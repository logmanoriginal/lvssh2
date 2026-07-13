#pragma once

#ifdef _WIN32
#  define LVSSH2_API __declspec(dllexport)
#else
#  define LVSSH2_API __attribute__((visibility("default")))
#endif

#include <stdint.h>
#include "extcode.h"
#include "libssh2.h"

#include "lv_prolog.h"

// Completion rendezvous shared between a callback shim and its LabVIEW handler VI.
typedef struct lvssh2_completion lvssh2_completion;

typedef struct {
	LStrHandle data;
	LStrHandle* signature;
	uintptr_t completion;
} lvssh2_userauth_publickey_sign_function_input_args;

typedef struct {
	LVUserEventRef send;
	LVUserEventRef recv;
	LVUserEventRef kbdint_response;
} lvssh2_abstract;

typedef struct {
	uintptr_t socket;
	LStrHandle buffer;
	int flags;
	ssize_t* bytes_send;
	uintptr_t completion;
} lvssh2_session_callback_send_function_input_args;

typedef struct {
	uintptr_t socket;
	void* buffer;
	size_t length;
	int flags;
	ssize_t* bytes_received;
	uintptr_t completion;
} lvssh2_session_callback_recv_function_input_args;

typedef struct {
	LStrHandle name;
	LStrHandle instruction;
	int num_prompts;
	const LIBSSH2_USERAUTH_KBDINT_PROMPT* prompts;
	LStrHandle* responses;
	uintptr_t completion;
} lvssh2_userauth_keyboard_interactive_response_function_input_args;

// Function pointer for the userauth publickey sign function
typedef LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC((*LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR));

// Function pointer for the userauth keyboard interactive response function
typedef LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC((*LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC_PTR));

#include "lv_epilog.h"

LVSSH2_API libssh2_trace_handler_func get_lvssh2_trace_handler_function(void);

LVSSH2_API libssh2_cb_generic* get_lvssh2_session_callback_send_function(void);

LVSSH2_API libssh2_cb_generic* get_lvssh2_session_callback_recv_function(void);

LVSSH2_API LIBSSH2_USERAUTH_KBDINT_RESPONSE_FUNC_PTR get_lvssh2_userauth_keyboard_interactive_response_function(void);

LVSSH2_API LIBSSH2_USERAUTH_PUBLICKEY_SIGN_FUNC_PTR get_lvssh2_userauth_publickey_sign_function(void);

// Releases the callback shim blocked on the given completion. The LabVIEW handler VI
// must call this exactly once for every event it receives, as its final operation and
// on every code path (including error paths), after writing all outputs through the
// payload pointers. `completion` is the value of the payload's `completion` field.
LVSSH2_API void lvssh2_extensions_signal_completion(uintptr_t completion);
