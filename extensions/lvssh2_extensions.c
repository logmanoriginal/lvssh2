#include "lvssh2_extensions.h"
#include <assert.h>
#include <stdlib.h>

// This macro asserts that the given value is less than or equal to INT32_MAX
// This is used to ensure that the length of a buffer is within the limits of LabVIEW
#define ASSERT_LABVIEW_MAXLEN(x) assert((x) <= INT32_MAX)
#define ASSERT_NO_ERROR(x) assert((x) == mgNoErr)

void data_buffer_to_LStrHandle(const void* data, int32 data_length, LStrHandle* string_handle_ptr) {
	NumericArrayResize(uB, 1, (UHandle*)(string_handle_ptr), data_length);

	if (!*string_handle_ptr) {
		return;
	}

	MoveBlock(data, LHStrBuf(*string_handle_ptr), data_length);
	LStrLen(**string_handle_ptr) = data_length;
}

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, void* context, const char* data, size_t length) {
	ASSERT_LABVIEW_MAXLEN(length);

	LStrHandle message = NULL;
	data_buffer_to_LStrHandle(data, (int32)length, &message);

	LVUserEventRef* e = (LVUserEventRef*)context;
	MgErr error = PostLVUserEvent(*e, &message);
	ASSERT_NO_ERROR(error);

	DSDisposeHandle(message);
}

libssh2_trace_handler_func get_lvssh2_trace_handler_function(void) {
	return lvssh2_trace_handler_function;
}

LIBSSH2_SEND_FUNC(lvssh2_session_callback_send_function) {
	ASSERT_LABVIEW_MAXLEN(length);

	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract->send)
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

	MgErr error = PostLVUserEvent(lv_abstract->send, &payload);
	ASSERT_NO_ERROR(error);

	DSDisposeHandle(payload.buffer);

	return bytes_send;
}

libssh2_cb_generic* get_lvssh2_session_callback_send_function(void) {
	return (libssh2_cb_generic*)lvssh2_session_callback_send_function;
}

LIBSSH2_RECV_FUNC(lvssh2_session_callback_recv_function) {
	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract->recv)
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

	MgErr error = PostLVUserEvent(lv_abstract->recv, &payload);
	ASSERT_NO_ERROR(error);

	return bytes_received;
}

libssh2_cb_generic* get_lvssh2_session_callback_recv_function(void) {
	return (libssh2_cb_generic*)lvssh2_session_callback_recv_function;
}

LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC(lvssh2_userauth_keyboard_interactive_response_function) {
	ASSERT_LABVIEW_MAXLEN(name_len);
	ASSERT_LABVIEW_MAXLEN(instruction_len);

	if (num_prompts == 0) {
		return;
	}

	lvssh2_abstract* lv_abstract = *(lvssh2_abstract**)abstract;
	if (!lv_abstract->kbdint_response)
	{
		return;
	}

	LStrHandle* lv_responses = (LStrHandle*)malloc(num_prompts * sizeof(LStrHandle));
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

	MgErr error = PostLVUserEvent(lv_abstract->kbdint_response, &payload);
	ASSERT_NO_ERROR(error);

	for (int i = 0; i < num_prompts; i++) {
		size_t response_length = LHStrLen(lv_responses[i]);
		const char* response_buffer = LHStrBuf(lv_responses[i]);
		if (response_buffer) {
			LIBSSH2_USERAUTH_KBDINT_RESPONSE* response = (LIBSSH2_USERAUTH_KBDINT_RESPONSE*)malloc(sizeof(LIBSSH2_USERAUTH_KBDINT_RESPONSE));
			if (response) {
				response->text = (char*)malloc(response_length);
				if (response->text) {
					memcpy(response->text, response_buffer, response_length);
					response->length = response_length;

					responses[i] = *response;
				}
				else {
					free(response);
				}
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

	*sig = NULL;
	*sig_len = 0;

	lvssh2_userauth_publickey_sign_function_input_args payload = { 0 };
	payload.data = 0;

	LStrHandle lv_signature = NULL;
	payload.signature = &lv_signature;

	data_buffer_to_LStrHandle(data, (int32)data_len, &payload.data);

	LVUserEventRef* e = (LVUserEventRef*)abstract;
	MgErr error = PostLVUserEvent(*e, &payload);
	ASSERT_NO_ERROR(error);

	size_t signature_length = LHStrLen(lv_signature);
	const char* signature_buffer = LHStrBuf(lv_signature);
	if (signature_buffer) {
		*sig = (unsigned char*)malloc(signature_length * sizeof(unsigned char));
		if (*sig)
		{
			memcpy(*sig, signature_buffer, signature_length);
		}

		*sig_len = signature_length;
	}

	DSDisposeHandle(payload.data);

	return LIBSSH2_ERROR_NONE;
}

LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR get_lvssh2_userauth_publickey_sign_function(void) {
	return lvssh2_userauth_publickey_sign_function;
}
