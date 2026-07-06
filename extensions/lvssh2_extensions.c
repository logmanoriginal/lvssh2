#include "lvssh2_extensions.h"
#include <assert.h>
#include <stdlib.h>

// This macro asserts that the given value is less than or equal to INT32_MAX
// This is used to ensure that the length of a buffer is within the limits of LabVIEW
#define ASSERT_LABVIEW_MAXLEN(x) assert((x) <= INT32_MAX)
#define ASSERT_NO_ERROR(x) assert((x) == mgNoErr)

static int is_valid_length(size_t len) {
	return len <= INT32_MAX;
}

void data_buffer_to_LStrHandle(const void* data, int32 data_length, LStrHandle* string_handle_ptr) {
	MgErr error = NumericArrayResize(uB, 1, (UHandle*)(string_handle_ptr), data_length);
	if (error != mgNoErr){
		return;
	}

	if (!*string_handle_ptr) {
		return;
	}

	MoveBlock(data, LHStrBuf(*string_handle_ptr), data_length);
	LStrLen(**string_handle_ptr) = data_length;
}

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, void* context, const char* data, size_t length) {
	ASSERT_LABVIEW_MAXLEN(length);
	if (!is_valid_length(length)) {
		return;
	}

	LStrHandle message = NULL;
	data_buffer_to_LStrHandle(data, (int32)length, &message);

	LVUserEventRef* e = (LVUserEventRef*)context;
	if (!e){
		DSDisposeHandle(message);
		return;
	}

	// PostLVUserEvent, when bound to the event using `Register Event Callback`, will
	// synchronously block until the Callback VI handler has finished executing.
	// Evidence: https://lavag.org/topic/19251-labview-vi-and-c-callback/#findComment-116130
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

	data_buffer_to_LStrHandle(buffer, (int32)length, &payload.buffer);

	// PostLVUserEvent, when bound to the event using `Register Event Callback`, will
	// synchronously block until the Callback VI handler has finished executing.
	// Evidence: https://lavag.org/topic/19251-labview-vi-and-c-callback/#findComment-116130
	MgErr error = PostLVUserEvent(lv_abstract->send, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		DSDisposeHandle(payload.buffer);
		return LIBSSH2_ERROR_BAD_USE;
	}

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

	// PostLVUserEvent, when bound to the event using `Register Event Callback`, will
	// synchronously block until the Callback VI handler has finished executing.
	// Evidence: https://lavag.org/topic/19251-labview-vi-and-c-callback/#findComment-116130
	MgErr error = PostLVUserEvent(lv_abstract->recv, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		return LIBSSH2_ERROR_BAD_USE;
	}

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
	data_buffer_to_LStrHandle(name, (int32)name_len, &lv_name);

	LStrHandle lv_instruction = NULL;
	data_buffer_to_LStrHandle(instruction, (int32)instruction_len, &lv_instruction);

	lvssh2_userauth_keyboard_interactive_response_function_input_args payload = { 0 };
	payload.name = lv_name;
	payload.instruction = lv_instruction;
	payload.num_prompts = num_prompts;
	payload.prompts = prompts;
	payload.responses = lv_responses;

	// PostLVUserEvent, when bound to the event using `Register Event Callback`, will
	// synchronously block until the Callback VI handler has finished executing.
	// Evidence: https://lavag.org/topic/19251-labview-vi-and-c-callback/#findComment-116130
	MgErr error = PostLVUserEvent(lv_abstract->kbdint_response, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		free(lv_responses);
		DSDisposeHandle(lv_name);
		DSDisposeHandle(lv_instruction);
		return;
	}

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

	data_buffer_to_LStrHandle(data, (int32)data_len, &payload.data);

	LVUserEventRef* e = (LVUserEventRef*)abstract;

	// PostLVUserEvent, when bound to the event using `Register Event Callback`, will
	// synchronously block until the Callback VI handler has finished executing.
	// Evidence: https://lavag.org/topic/19251-labview-vi-and-c-callback/#findComment-116130
	MgErr error = PostLVUserEvent(*e, &payload);
	ASSERT_NO_ERROR(error);
	if (error != mgNoErr) {
		DSDisposeHandle(payload.data);
		return LIBSSH2_ERROR_BAD_USE;
	}

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
		}
		else {
			DSDisposeHandle(payload.data);
			return LIBSSH2_ERROR_ALLOC;
		}
	}

	DSDisposeHandle(payload.data);

	return LIBSSH2_ERROR_NONE;
}

LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR get_lvssh2_userauth_publickey_sign_function(void) {
	return lvssh2_userauth_publickey_sign_function;
}
