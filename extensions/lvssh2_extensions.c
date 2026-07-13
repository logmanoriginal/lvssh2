#include "lvssh2_extensions.h"
#include <assert.h>
#include <stdlib.h>

// C11 threads require MSVC 2022 17.8+ (/std:c11) on Windows and glibc 2.28+ on
// Linux. macOS is not supported.
#ifdef __STDC_NO_THREADS__
#error "C11 threads support is required"
#endif
#include <threads.h>

// PostLVUserEvent only guarantees that the event data has been copied when it
// returns; whether the LabVIEW handler has already run depends on platform and
// registration method and must not be relied upon. Callback shims that read
// results written by the handler therefore block on this rendezvous until the
// handler VI calls lvssh2_extensions_signal_completion.
struct lvssh2_completion {
	mtx_t lock;
	cnd_t cond;
	int done;
};

// Asserts that the return value of a threads function is `thrd_success`.
#define ASSERT_THRD_SUCCESS(x) assert((x) == thrd_success)

static int completion_init(lvssh2_completion* completion) {
	int result = mtx_init(&completion->lock, mtx_plain);
	ASSERT_THRD_SUCCESS(result);
	if (result != thrd_success) {
		return result;
	}

	result = cnd_init(&completion->cond);
	ASSERT_THRD_SUCCESS(result);
	if (result != thrd_success) {
		mtx_destroy(&completion->lock);
		return result;
	}

	completion->done = 0;
	return thrd_success;
}

static void completion_wait(lvssh2_completion* completion) {
	int result = mtx_lock(&completion->lock);
	ASSERT_THRD_SUCCESS(result);

	// Loop in case of spurious wakeup
	// https://en.cppreference.com/c/thread/cnd_wait
	while (!completion->done) {
		result = cnd_wait(&completion->cond, &completion->lock);
		ASSERT_THRD_SUCCESS(result);
	}

	result = mtx_unlock(&completion->lock);
	ASSERT_THRD_SUCCESS(result);
}

// Signals while holding the lock so the waiter cannot observe `done` and
// destroy the completion before the signaler is finished touching it.
static void completion_signal(lvssh2_completion* completion) {
	int result = mtx_lock(&completion->lock);
	ASSERT_THRD_SUCCESS(result);

	completion->done = 1;

	result = cnd_signal(&completion->cond);
	ASSERT_THRD_SUCCESS(result);

	result = mtx_unlock(&completion->lock);
	ASSERT_THRD_SUCCESS(result);
}

static void completion_destroy(lvssh2_completion* completion) {
	mtx_destroy(&completion->lock);
	cnd_destroy(&completion->cond);
}

void lvssh2_extensions_signal_completion(uintptr_t completion) {
	if (!completion) {
		return;
	}

	completion_signal((lvssh2_completion*)completion);
}

// This macro asserts that the given value is less than or equal to INT32_MAX
// This is used to ensure that the length of a buffer is within the limits of LabVIEW
#define ASSERT_LABVIEW_MAXLEN(x) assert((x) <= INT32_MAX)
#define ASSERT_NO_ERROR(x) assert((x) == mgNoErr)

static int is_valid_length(size_t len) {
	return len <= INT32_MAX;
}

static MgErr data_buffer_to_LStrHandle(const void* data, int32 data_length, LStrHandle* string_handle_ptr) {
	MgErr error = NumericArrayResize(uB, 1, (UHandle*)(string_handle_ptr), data_length);
	if (error != mgNoErr){
		return error;
	}

	if (!*string_handle_ptr) {
		return mgArgErr;
	}

	MoveBlock(data, LHStrBuf(*string_handle_ptr), data_length);
	LStrLen(**string_handle_ptr) = data_length;
	return mgNoErr;
}

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, void* context, const char* data, size_t length) {
	ASSERT_LABVIEW_MAXLEN(length);
	if (!is_valid_length(length)) {
		return;
	}

	LStrHandle message = NULL;
	if (data_buffer_to_LStrHandle(data, (int32)length, &message) != mgNoErr){
		return;
	}

	LVUserEventRef* e = (LVUserEventRef*)context;
	if (!e){
		DSDisposeHandle(message);
		return;
	}

	// Fire-and-forget: do not wait for completion because the trace handler returns no data.
	MgErr error = PostLVUserEvent(*e, &message);
	ASSERT_NO_ERROR(error);

	DSDisposeHandle(message);
}

libssh2_trace_handler_func get_lvssh2_trace_handler_function(void) {
	return lvssh2_trace_handler_function;
}

LIBSSH2_SEND_FUNC(lvssh2_session_callback_send_function) {
	ASSERT_LABVIEW_MAXLEN(length);
	if (!is_valid_length(length)) {
		return LIBSSH2_ERROR_INVAL;
	}

	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract || !lv_abstract->send)
	{
		return LIBSSH2_ERROR_BAD_USE;
	}

	lvssh2_session_callback_send_function_input_args payload = { 0 };
	payload.socket = socket;
	payload.buffer = NULL;
	payload.flags = flags;

	ssize_t bytes_send = 0;
	payload.bytes_send = &bytes_send;

	if (data_buffer_to_LStrHandle(buffer, (int32)length, &payload.buffer) != mgNoErr){
		return LIBSSH2_ERROR_ALLOC;
	}

	lvssh2_completion completion;
	if (completion_init(&completion) != thrd_success) {
		DSDisposeHandle(payload.buffer);
		return LIBSSH2_ERROR_ALLOC;
	}

	payload.completion = (uintptr_t)&completion;

	// The outputs written by the handler VI (*bytes_send) are only valid after
	// completion_wait returns; the handler VI must always signal the completion.
	MgErr error = PostLVUserEvent(lv_abstract->send, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		completion_destroy(&completion);
		DSDisposeHandle(payload.buffer);
		return LIBSSH2_ERROR_BAD_USE;
	}

	completion_wait(&completion);
	completion_destroy(&completion);

	DSDisposeHandle(payload.buffer);

	if (bytes_send > (ssize_t)length){
		bytes_send = length;
	}

	return bytes_send;
}

libssh2_cb_generic* get_lvssh2_session_callback_send_function(void) {
	return (libssh2_cb_generic*)lvssh2_session_callback_send_function;
}

LIBSSH2_RECV_FUNC(lvssh2_session_callback_recv_function) {
	ASSERT_LABVIEW_MAXLEN(length);
	if (!is_valid_length(length)) {
		return LIBSSH2_ERROR_INVAL;
	}

	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract || !lv_abstract->recv)
	{
		return LIBSSH2_ERROR_BAD_USE;
	}

	lvssh2_session_callback_recv_function_input_args payload = { 0 };
	payload.socket = socket;
	payload.buffer = buffer;
	payload.length = length;
	payload.flags = flags;

	ssize_t bytes_received = 0;
	payload.bytes_received = &bytes_received;

	lvssh2_completion completion;
	if (completion_init(&completion) != thrd_success) {
		return LIBSSH2_ERROR_ALLOC;
	}

	payload.completion = (uintptr_t)&completion;

	// The outputs written by the handler VI (buffer contents, *bytes_received) are
	// only valid after completion_wait returns; the handler VI must always signal
	// the completion.
	MgErr error = PostLVUserEvent(lv_abstract->recv, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		completion_destroy(&completion);
		return LIBSSH2_ERROR_BAD_USE;
	}

	completion_wait(&completion);
	completion_destroy(&completion);

	if (bytes_received > (ssize_t)length){
		bytes_received = length;
	}

	return bytes_received;
}

libssh2_cb_generic* get_lvssh2_session_callback_recv_function(void) {
	return (libssh2_cb_generic*)lvssh2_session_callback_recv_function;
}

LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC(lvssh2_userauth_keyboard_interactive_response_function) {
	ASSERT_LABVIEW_MAXLEN(name_len);
	ASSERT_LABVIEW_MAXLEN(instruction_len);
	if (!is_valid_length(name_len) || !is_valid_length(instruction_len)) {
		return;
	}

	if (num_prompts <= 0) {
		return;
	}

	// Prevent oversized allocation attempt
	if ((size_t)num_prompts > (SIZE_MAX / sizeof(LStrHandle))) {
		return;
	}

	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract || !lv_abstract->kbdint_response)
	{
		return;
	}

	LStrHandle* lv_responses = (LStrHandle*)calloc(num_prompts, sizeof(LStrHandle));
	if (!lv_responses) {
		return;
	}

	LStrHandle lv_name = NULL;
	if (data_buffer_to_LStrHandle(name, (int32)name_len, &lv_name) != mgNoErr){
		free(lv_responses);
		return;
	}

	LStrHandle lv_instruction = NULL;
	if (data_buffer_to_LStrHandle(instruction, (int32)instruction_len, &lv_instruction) != mgNoErr){
		DSDisposeHandle(lv_name);
		free(lv_responses);
		return;
	}

	lvssh2_userauth_keyboard_interactive_response_function_input_args payload = { 0 };
	payload.name = lv_name;
	payload.instruction = lv_instruction;
	payload.num_prompts = num_prompts;
	payload.prompts = prompts;
	payload.responses = lv_responses;

	lvssh2_completion completion;
	if (completion_init(&completion) != thrd_success) {
		free(lv_responses);
		DSDisposeHandle(lv_name);
		DSDisposeHandle(lv_instruction);
		return;
	}

	payload.completion = (uintptr_t)&completion;

	// The outputs written by the handler VI (responses[]) are only valid after
	// completion_wait returns; the handler VI must always signal the completion.
	MgErr error = PostLVUserEvent(lv_abstract->kbdint_response, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		completion_destroy(&completion);
		free(lv_responses);
		DSDisposeHandle(lv_name);
		DSDisposeHandle(lv_instruction);
		return;
	}

	completion_wait(&completion);
	completion_destroy(&completion);

	for (int i = 0; i < num_prompts; i++) {
		responses[i].text = NULL;
		responses[i].length = 0;

		if (!lv_responses[i]){
			continue;
		}

		size_t response_length = LHStrLen(lv_responses[i]);
		const char* response_buffer = LHStrBuf(lv_responses[i]);
		if (response_buffer && response_length > 0 && response_length <= INT32_MAX) {
			// Freed by libssh2 via LIBSSH2_FREE; matches malloc only with the default
			// session allocator (libssh2_session_init). Do not use libssh2_session_init_ex
			// with custom allocators without revisiting this.
			char* text = (char*)malloc(response_length);
			if (text) {
				memcpy(text, response_buffer, response_length);
				responses[i].text = text;
				responses[i].length = response_length;
			}
		}
	}

	free(lv_responses);

	DSDisposeHandle(lv_name);
	DSDisposeHandle(lv_instruction);
}

LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC_PTR get_lvssh2_userauth_keyboard_interactive_response_function(void) {
	return lvssh2_userauth_keyboard_interactive_response_function;
}

LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC(lvssh2_userauth_publickey_sign_function) {
	ASSERT_LABVIEW_MAXLEN(data_len);
	if (!is_valid_length(data_len)) {
		return LIBSSH2_ERROR_INVAL;
	}

	*sig = NULL;
	*sig_len = 0;

	lvssh2_userauth_publickey_sign_function_input_args payload = { 0 };
	payload.data = 0;

	LStrHandle lv_signature = NULL;
	payload.signature = &lv_signature;

	if (data_buffer_to_LStrHandle(data, (int32)data_len, &payload.data) != mgNoErr){
		return LIBSSH2_ERROR_ALLOC;
	}

	LVUserEventRef* e = (LVUserEventRef*)abstract;

	lvssh2_completion completion;
	if (completion_init(&completion) != thrd_success) {
		DSDisposeHandle(payload.data);
		return LIBSSH2_ERROR_ALLOC;
	}

	payload.completion = (uintptr_t)&completion;

	// The outputs written by the handler VI (*signature) are only valid after
	// completion_wait returns; the handler VI must always signal the completion.
	MgErr error = PostLVUserEvent(*e, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		completion_destroy(&completion);
		DSDisposeHandle(payload.data);
		return LIBSSH2_ERROR_BAD_USE;
	}

	completion_wait(&completion);
	completion_destroy(&completion);

	if (!lv_signature){
		DSDisposeHandle(payload.data);
		return LIBSSH2_ERROR_BAD_USE;
	}

	size_t signature_length = LHStrLen(lv_signature);
	const char* signature_buffer = LHStrBuf(lv_signature);
	if (signature_buffer && signature_length > 0 && signature_length <= INT32_MAX) {
		// Freed by libssh2 via LIBSSH2_FREE; matches malloc only with the default
		// session allocator (libssh2_session_init). Do not use libssh2_session_init_ex
		// with custom allocators without revisiting this.
		unsigned char* signature = (unsigned char*)malloc(signature_length * sizeof(unsigned char));
		if (signature) {
			memcpy(signature, signature_buffer, signature_length);
			*sig = signature;
			*sig_len = signature_length;
		} else {
			DSDisposeHandle(payload.data);
			return LIBSSH2_ERROR_ALLOC;
		}

		DSDisposeHandle(payload.data);
		return LIBSSH2_ERROR_NONE;
	}

	DSDisposeHandle(payload.data);
	return LIBSSH2_ERROR_BAD_USE;
}

LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR get_lvssh2_userauth_publickey_sign_function(void) {
	return lvssh2_userauth_publickey_sign_function;
}
