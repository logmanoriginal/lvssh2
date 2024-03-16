#pragma once

#include "extcode.h"
#include "libssh2/libssh2.h"

#pragma pack(push, 1)

typedef struct {
	LVUserEventRef send;
} lvssh2_abstract;


typedef struct {
	UINT_PTR socket;
	void* buffer;
	size_t length;
	int32_t flags;
} lvssh2_session_callback_send_function_input_args;

#pragma pack(pop)

ssize_t lvssh2_session_callback_send_return_value = 0;

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, LVUserEventRef* event, const char* data, size_t length);
ssize_t lvssh2_session_callback_send_function(libssh2_socket_t socket, const void* buffer, size_t length, int flags, lvssh2_abstract** abstract);

extern "C" __declspec(dllexport) void* get_lvssh2_trace_handler_function() { return lvssh2_trace_handler_function; }
extern "C" __declspec(dllexport) void* get_lvssh2_session_callback_send_function() { return lvssh2_session_callback_send_function; }

extern "C" __declspec(dllexport) void lvssh2_session_callback_send_function_return(ssize_t bytes_send);
