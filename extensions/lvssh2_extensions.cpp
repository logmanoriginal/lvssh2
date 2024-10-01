#include "lvssh2_extensions.h"

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, LVUserEventRef* event, const char* data, size_t length) {
	LStrHandle message = nullptr;
	data_buffer_to_LStrHandle(data, length, &message);

	PostLVUserEvent(*event, &message);

	DSDisposeHandle(message);
}

int lvssh2_userauth_publickey_sign_function(LIBSSH2_SESSION* session, unsigned char** signature, size_t* signature_len, const unsigned char* data, size_t data_len, LVUserEventRef* event) {
	*signature = nullptr;
	*signature_len = 0;
	
	lvssh2_userauth_publickey_sign_function_input_args payload = { 0 };
	payload.data = 0;

	LStrHandle lv_signature = 0;
	payload.signature = &lv_signature;

	data_buffer_to_LStrHandle(data, data_len, &payload.data);

	PostLVUserEvent(*event, &payload);

	*signature = (unsigned char*)malloc(LHStrLen(lv_signature) * sizeof(unsigned char*));
	memcpy(*signature, LHStrBuf(lv_signature), LHStrLen(lv_signature));

	*signature_len = LHStrLen(lv_signature);

	DSDisposeHandle(payload.data);

	return 0;
}

ssize_t lvssh2_session_callback_send_function(libssh2_socket_t socket, const void* buffer, size_t length, int flags, lvssh2_abstract** abstract) {
	lvssh2_session_callback_send_function_input_args payload = { 0 };
	payload.socket = socket;
	payload.buffer = 0;
	payload.flags = flags;

	ssize_t bytes_send = 0;
	payload.bytes_send = &bytes_send;

	data_buffer_to_LStrHandle(buffer, length, &payload.buffer);

	PostLVUserEvent((*abstract)->send, &payload);

	DSDisposeHandle(payload.buffer);

	return bytes_send;
}

ssize_t lvssh2_session_callback_recv_function(libssh2_socket_t socket, void* buffer, size_t length, int flags, lvssh2_abstract** abstract) {
	lvssh2_session_callback_recv_function_input_args payload = { 0 };
	payload.socket = socket;
	payload.buffer = buffer;
	payload.length = length;
	payload.flags = flags;

	ssize_t bytes_received = 0;
	payload.bytes_received = &bytes_received;

	PostLVUserEvent((*abstract)->recv, &payload);

	return bytes_received;
}

void lvssh2_userauth_keyboard_interactive_response_function(
	const char* name,
	int name_len,
	const char* instruction,
	int instruction_len,
	int num_prompts,
	const LIBSSH2_USERAUTH_KBDINT_PROMPT* prompts,
	LIBSSH2_USERAUTH_KBDINT_RESPONSE* responses,
	void** abstract)
{
	if (num_prompts == 0) {
		return;
	}

	LStrHandle* lv_responses = (LStrHandle*)malloc(num_prompts * sizeof(LStrHandle));

	LStrHandle lv_name = 0;
	data_buffer_to_LStrHandle(name, name_len, &lv_name);

	LStrHandle lv_instruction = 0;
	data_buffer_to_LStrHandle(instruction, instruction_len, &lv_instruction);

	lvssh2_userauth_keyboard_interactive_response_function_input_args payload = { 0 };
	payload.name = lv_name;
	payload.instruction = lv_instruction;
	payload.num_prompts = num_prompts;
	payload.prompts = prompts;
	payload.responses = lv_responses;

	PostLVUserEvent(*lvssh2_userauth_keyboard_interactive_response_event, &payload);

	for (int i = 0; i < num_prompts; i++) {
		LIBSSH2_USERAUTH_KBDINT_RESPONSE* response = (LIBSSH2_USERAUTH_KBDINT_RESPONSE*)malloc(sizeof(LIBSSH2_USERAUTH_KBDINT_RESPONSE));
		if (response) {
			response->text = (char*)malloc(LHStrLen(lv_responses[i]));
			if (response->text) {
				memcpy(response->text, LHStrBuf(lv_responses[i]), LHStrLen(lv_responses[i]));
				response->length = LHStrLen(lv_responses[i]);

				responses[i] = *response;
			}
			else {
				free(response);
			}
		}
	}

	free(lv_responses);

	DSDisposeHandle(lv_name);
	DSDisposeHandle(lv_instruction);
}

void data_buffer_to_LStrHandle(const void* data, size_t data_length, LStrHandle* string_handle_ptr) {
	NumericArrayResize(uB, 1, (UHandle*)(string_handle_ptr), data_length);
	MoveBlock(data, LHStrBuf(*string_handle_ptr), data_length);
	LStrLen(**string_handle_ptr) = data_length;
}
