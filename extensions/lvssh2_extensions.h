#pragma once

#include "extcode.h"

extern "C" __declspec(dllexport) void* get_event_trace_handler();

// The signature of this function matches the callback function for libssh2_trace_sethandler
void libssh2_trace_handler(void*, LVUserEventRef*, const char*, size_t);
