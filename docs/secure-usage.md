# Secure Usage Guide

This guide describes the minimum safe integration pattern for SSH sessions created with lvssh2.

## Required Trust Workflow

Apply this workflow for every new server connection:

1. Initialize libssh2 and create a session.
2. Connect TCP and run `libssh2_session_handshake`.
3. Read the server host key with `libssh2_session_hostkey`.
4. Initialize known hosts (`libssh2_knownhost_init`) and load expected keys (`libssh2_knownhost_readfile` or `libssh2_knownhost_readline`).
5. Verify the host with `libssh2_knownhost_checkp`.
6. Continue only when the result is `LIBSSH2_KNOWNHOST_CHECK_MATCH`.
7. Authenticate after successful verification.
8. Open channels and transfer data.

Fail closed on all non-match results:
- `LIBSSH2_KNOWNHOST_CHECK_MISMATCH`
- `LIBSSH2_KNOWNHOST_CHECK_NOTFOUND`
- `LIBSSH2_KNOWNHOST_CHECK_FAILURE`

## High-Risk Operations

Use these operations only after host verification succeeds:

- `libssh2_channel_request_auth_agent`
- `libssh2_channel_direct_tcpip`
- `libssh2_channel_direct_tcpip_ex`
- Keyboard-interactive authentication methods

Reason: before host verification, these calls can expose credentials, allow man-in-the-middle abuse, or tunnel data through an untrusted endpoint.

## Authentication Guidance

- Prefer public key authentication over password when possible.
- Treat keyboard-interactive prompts as untrusted input unless host verification already succeeded.
- Do not retry authentication on a host-key mismatch.

## Algorithm Guidance

- Prefer SHA-256 host key hash workflows.
- Do not rely on MD5 or SHA-1 hashes for trust decisions.
- Avoid forcing legacy algorithm preferences with `libssh2_session_method_pref`.

## Minimal Implementation Checklist

- [ ] Known hosts loaded before authentication.
- [ ] Connection aborted when host check result is not `MATCH`.
- [ ] Agent forwarding only enabled after a verified host.
- [ ] Tunnel APIs used only after host verification.
- [ ] Logs include host verification decision and result code.
