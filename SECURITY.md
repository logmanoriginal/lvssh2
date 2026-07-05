# Security Policy and Best Practices

This project exposes low-level libssh2 bindings. It does not automatically enforce trust decisions for the caller. Integrations must apply the checks below.

## Host Key Verification

Perform host key verification before any authentication or channel use.

Required sequence:
1. Create session and connect socket.
2. Call `libssh2_session_handshake`.
3. Retrieve host key with `libssh2_session_hostkey`.
4. Initialize/read known hosts database (`libssh2_knownhost_init`, `libssh2_knownhost_readfile` or `libssh2_knownhost_readline`).
5. Validate remote key using `libssh2_knownhost_checkp`.
6. Abort the connection unless result is `LIBSSH2_KNOWNHOST_CHECK_MATCH`.
7. Authenticate only after a successful match.

Treat these results as failures for authentication:
- `LIBSSH2_KNOWNHOST_CHECK_MISMATCH`
- `LIBSSH2_KNOWNHOST_CHECK_NOTFOUND`
- `LIBSSH2_KNOWNHOST_CHECK_FAILURE`

## Agent Forwarding

`libssh2_channel_request_auth_agent` must only be used after host key verification has returned `MATCH`.

Agent forwarding to an unverified host can expose credentials to a machine you did not intend to trust.

## Hash and Algorithm Guidance

Prefer SHA-256 for host key hash workflows. Avoid MD5 and SHA-1 for trust decisions.

When setting method preferences, avoid weak or legacy algorithms.

## Build Security Notes

The build process verifies libssh2 source signatures when `LIBSSH2_SOURCE=Tarball` is used.

## Reporting Security Issues

Report suspected vulnerabilities privately via repository maintainers.
Include:
- affected version/commit
- reproduction steps
- expected vs observed behavior
- impact assessment

## Supported Versions

Only the latest release is supported. Older versions may contain unpatched vulnerabilities.