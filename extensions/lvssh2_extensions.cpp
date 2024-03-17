#include "lvssh2_extensions.h"

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, LVUserEventRef* event, const char* data, size_t length) {
	LStrHandle message = (LStrHandle)DSNewHClr(sizeof(int32) + length + sizeof(uChar));
	LStrPrintf(message, (CStr)"%s", data);

	PostLVUserEvent(*event, &message);

	DSDisposeHandle(message);
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

