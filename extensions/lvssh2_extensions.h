#pragma once

#include "extcode.h"
#include "libssh2/libssh2.h"

#include "lv_prolog.h"

typedef struct {
	LStrHandle data;
	LStrHandle* signature;
} lvssh2_userauth_publickey_sign_function_input_args;

typedef struct {
	LVUserEventRef send;
	LVUserEventRef recv;
} lvssh2_abstract;

typedef struct {
	UINT_PTR socket;
	LStrHandle buffer;
	int flags;
	ssize_t* bytes_send;
} lvssh2_session_callback_send_function_input_args;

typedef struct {
	UINT_PTR socket;
	void* buffer;
	size_t length;
	int flags;
	ssize_t* bytes_received;
} lvssh2_session_callback_recv_function_input_args;

typedef struct {
	LStrHandle name;
	LStrHandle instruction;
	int num_prompts;
	const LIBSSH2_USERAUTH_KBDINT_PROMPT* prompts;
	LStrHandle* responses;
} lvssh2_userauth_keyboard_interactive_response_function_input_args;

LVUserEventRef* lvssh2_userauth_keyboard_interactive_response_event = { 0 };

// Function pointer for the userauth publickey sign function
typedef LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC((*LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR));

// Function pointer for the userauth keyboard interactive response function
typedef LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC((*LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC_PTR));

// Function pointer for the session callback send function
typedef LIBSSH2_SEND_FUNC((*LIBSSH2_SEND_FUNC_PTR));

// Function pointer for the session callback recv function
typedef LIBSSH2_RECV_FUNC((*LIBSSH2_RECV_FUNC_PTR));

#include "lv_epilog.h"

void data_buffer_to_LStrHandle(const void*, size_t, LStrHandle*);

void lvssh2_trace_handler_function(LIBSSH2_SESSION* session, void* context, const char* data, size_t length);

LIBSSH2_SEND_FUNC(lvssh2_session_callback_send_function);
LIBSSH2_RECV_FUNC(lvssh2_session_callback_recv_function);

LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC(lvssh2_userauth_keyboard_interactive_response_function);
LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC(lvssh2_userauth_publickey_sign_function);

extern "C" __declspec(dllexport) libssh2_trace_handler_func get_lvssh2_trace_handler_function() { return lvssh2_trace_handler_function; }
extern "C" __declspec(dllexport) LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR get_lvssh2_userauth_publickey_sign_function() { return lvssh2_userauth_publickey_sign_function; }

extern "C" __declspec(dllexport) LIBSSH2_SEND_FUNC_PTR get_lvssh2_session_callback_send_function() { return lvssh2_session_callback_send_function; }
extern "C" __declspec(dllexport) LIBSSH2_RECV_FUNC_PTR get_lvssh2_session_callback_recv_function() { return lvssh2_session_callback_recv_function; }

extern "C" __declspec(dllexport) LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC_PTR get_lvssh2_userauth_keyboard_interactive_response_function() { return lvssh2_userauth_keyboard_interactive_response_function; }
extern "C" __declspec(dllexport) void set_lvssh2_userauth_keyboard_interactive_response_callback(LVUserEventRef* event) { lvssh2_userauth_keyboard_interactive_response_event = event; }
