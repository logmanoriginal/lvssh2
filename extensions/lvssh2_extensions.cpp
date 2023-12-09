#include "lvssh2_extensions.h"

void* get_event_trace_handler() {
	return libssh2_trace_handler;
}

void libssh2_trace_handler(void* session, LVUserEventRef* event, const char* data, size_t length) {
	LStrHandle message = (LStrHandle)DSNewHClr(sizeof(int32) + length + sizeof(uChar));
	LStrPrintf(message, (CStr)"%s", data);

	PostLVUserEvent(*event, &message);

	DSDisposeHandle(message);
}
