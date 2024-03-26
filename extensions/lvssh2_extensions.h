#pragma once

#include "extcode.h"
#include "libssh2/libssh2.h"

#pragma pack(push, 1)

typedef struct {
	unsigned char* data;
	size_t data_len;
} lvssh2_userauth_publickey_sign_function_input_args;

typedef struct {
	unsigned char* signature;
	size_t signature_len;
} lvssh2_userauth_publickey_sign_function_output_args;

typedef struct {
	LVUserEventRef send;
	LVUserEventRef recv;
} lvssh2_abstract;


typedef struct {
	UINT_PTR socket;
	void* buffer;
	size_t length;
	int32_t flags;
} lvssh2_session_callback_send_function_input_args;

typedef struct {
	UINT_PTR socket;
	void* buffer;
	size_t length;
	int32_t flags;
} lvssh2_session_callback_recv_function_input_args;

#pragma pack(pop)

ssize_t lvssh2_session_callback_send_return_value = 0;
ssize_t lvssh2_session_callback_recv_return_value = 0;

lvssh2_userauth_publickey_sign_function_output_args lvssh2_userauth_publickey_sign_return_value = { 0 };

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, LVUserEventRef* event, const char* data, size_t length);
int lvssh2_userauth_publickey_sign_function(LIBSSH2_SESSION* session, unsigned char** signature, size_t* signature_len, const unsigned char* data, size_t data_len, LVUserEventRef* event);

ssize_t lvssh2_session_callback_send_function(libssh2_socket_t socket, const void* buffer, size_t length, int flags, lvssh2_abstract** abstract);
ssize_t lvssh2_session_callback_recv_function(libssh2_socket_t socket, void* buffer, size_t length, int flags, lvssh2_abstract** abstract);

extern "C" __declspec(dllexport) void* get_lvssh2_trace_handler_function() { return lvssh2_trace_handler_function; }
extern "C" __declspec(dllexport) void* get_lvssh2_userauth_publickey_sign_function() { return lvssh2_userauth_publickey_sign_function; }

extern "C" __declspec(dllexport) void* get_lvssh2_session_callback_send_function() { return lvssh2_session_callback_send_function; }
extern "C" __declspec(dllexport) void* get_lvssh2_session_callback_recv_function() { return lvssh2_session_callback_recv_function; }

extern "C" __declspec(dllexport) void lvssh2_session_callback_send_function_return(ssize_t bytes_send);
extern "C" __declspec(dllexport) void lvssh2_session_callback_recv_function_return(ssize_t bytes_received);

extern "C" __declspec(dllexport) void lvssh2_userauth_publickey_sign_function_return(unsigned char* signature, size_t signature_len);