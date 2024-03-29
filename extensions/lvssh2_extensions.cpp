#include "lvssh2_extensions.h"

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, LVUserEventRef* event, const char* data, size_t length) {
	LStrHandle message = (LStrHandle)DSNewHClr(sizeof(int32) + length + sizeof(uChar));
	LStrPrintf(message, (CStr)"%s", data);

	PostLVUserEvent(*event, &message);

	DSDisposeHandle(message);
}

int lvssh2_userauth_publickey_sign_function(LIBSSH2_SESSION* session, unsigned char** signature, size_t* signature_len, const unsigned char* data, size_t data_len, LVUserEventRef* event) {
	lvssh2_userauth_publickey_sign_function_input_args* payload = (lvssh2_userauth_publickey_sign_function_input_args*)malloc(sizeof(lvssh2_userauth_publickey_sign_function_input_args));
	payload->data = (unsigned char*)data;
	payload->data_len = data_len;

	
	
	lvssh2_userauth_publickey_sign_return_value = { 0 };
	
	PostLVUserEvent(*event, payload);

	free(payload);

	*signature = lvssh2_userauth_publickey_sign_return_value.signature;
	*signature_len = lvssh2_userauth_publickey_sign_return_value.signature_len;

	return 0;
}

void lvssh2_userauth_publickey_sign_function_return(unsigned char* signature, size_t signature_len) {

	unsigned char* signature_copy = (unsigned char*)malloc(signature_len);
	memcpy(signature_copy, signature, signature_len);

	lvssh2_userauth_publickey_sign_return_value.signature = signature_copy;
	lvssh2_userauth_publickey_sign_return_value.signature_len = signature_len;
}

ssize_t lvssh2_session_callback_send_function(libssh2_socket_t socket, const void* buffer, size_t length, int flags, lvssh2_abstract** abstract) {
	lvssh2_session_callback_send_function_input_args* payload = (lvssh2_session_callback_send_function_input_args*)malloc(sizeof(lvssh2_session_callback_send_function_input_args));
	payload->socket = socket;
	payload->buffer = (void*)buffer;
	payload->length = length;
	payload->flags = flags;
	
	lvssh2_session_callback_send_return_value = 0;
	
	PostLVUserEvent((*abstract)->send, payload);

	free(payload);

	return lvssh2_session_callback_send_return_value;
}

void lvssh2_session_callback_send_function_return(ssize_t bytes_send) {
	lvssh2_session_callback_send_return_value = bytes_send;
}

ssize_t lvssh2_session_callback_recv_function(libssh2_socket_t socket, void* buffer, size_t length, int flags, lvssh2_abstract** abstract) {
	lvssh2_session_callback_recv_function_input_args* payload = (lvssh2_session_callback_recv_function_input_args*)malloc(sizeof(lvssh2_session_callback_recv_function_input_args));
	payload->socket = socket;
	payload->buffer = buffer;
	payload->length = length;
	payload->flags = flags;
	
	lvssh2_session_callback_recv_return_value = 0;
	
	PostLVUserEvent((*abstract)->recv, payload);

	free(payload);

	return lvssh2_session_callback_recv_return_value;
}

void lvssh2_session_callback_recv_function_return(ssize_t bytes_received) {
	lvssh2_session_callback_recv_return_value = bytes_received;
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

	LStrHandle lv_name = (LStrHandle)DSNewHClr(sizeof(int32) + name_len + sizeof(uChar));
	LStrPrintf(lv_name, (CStr)"%s", name);

	LStrHandle lv_instruction = (LStrHandle)DSNewHClr(sizeof(int32) + instruction_len + sizeof(uChar));
	LStrPrintf(lv_instruction, (CStr)"%s", instruction);
	
	lvssh2_userauth_keyboard_interactive_response_function_input_args* payload = (lvssh2_userauth_keyboard_interactive_response_function_input_args*)malloc(sizeof(lvssh2_userauth_keyboard_interactive_response_function_input_args));
	payload->name = lv_name;
	payload->instruction = lv_instruction;
	payload->num_prompts = num_prompts;
	payload->prompts = (LIBSSH2_USERAUTH_KBDINT_PROMPT*)prompts;

	lvssh2_userauth_keyboard_interactive_response_return_value = responses;
	lvssh2_userauth_keyboard_interactive_response_return_value_count = 0;

	PostLVUserEvent(*lvssh2_userauth_keyboard_interactive_response_event, payload);

	free(payload);
	DSDisposeHandle(lv_name);
	DSDisposeHandle(lv_instruction);
}

void lvssh2_userauth_keyboard_interactive_add_response(const char* text, unsigned int text_len) {
	LIBSSH2_USERAUTH_KBDINT_RESPONSE response = { 0 };
	
	response.text = (char*)malloc(text_len);
	memcpy(response.text, text, text_len);

	response.length = text_len;

	lvssh2_userauth_keyboard_interactive_response_return_value[lvssh2_userauth_keyboard_interactive_response_return_value_count] = response;
	lvssh2_userauth_keyboard_interactive_response_return_value_count++;
}
