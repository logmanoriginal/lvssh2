# libssh2 API
This is a list of exported libssh2 APIs and their corresponding matches in this project.

# Constants

| libssh2                                 | lvssh2                                              |
| --------------------------------------- | --------------------------------------------------- |
| `LIBSSH2_CALLBACK_IGNORE`               | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_DEBUG`                | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_DISCONNECT`           | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_MACERROR`             | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_X11`                  | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_SEND`                 | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_RECV`                 | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_AUTHAGENT`            | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_AUTHAGENT_IDENTITIES` | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_CALLBACK_AUTHAGENT_SIGN`       | `libssh2.lvlib:libssh2_session_callback_type.ctl`   |
| `LIBSSH2_FLAG_SIGPIPE`                  | `libssh2.lvlib:libssh2_flag.ctl`                    |
| `LIBSSH2_FLAG_COMPRESS`                 | `libssh2.lvlib:libssh2_flag.ctl`                    |
| `LIBSSH2_FLAG_QUOTE_PATHS`              | `libssh2.lvlib:libssh2_flag.ctl`                    |
| `LIBSSH2_HOSTKEY_HASH_MD5`              | `libssh2.lvlib:Host Key Hash Type.ctl`              |
| `LIBSSH2_HOSTKEY_HASH_SHA1`             | `libssh2.lvlib:Host Key Hash Type.ctl`              |
| `LIBSSH2_HOSTKEY_HASH_SHA256`           | `libssh2.lvlib:Host Key Hash Type.ctl`              |
| `LIBSSH2_INIT_NO_CRYPTO`                |
| `LIBSSH2_KNOWNHOST_CHECK_MATCH`         | `libssh2.lvlib:Known Host Check Result.ctl`         |
| `LIBSSH2_KNOWNHOST_CHECK_MISMATCH`      | `libssh2.lvlib:Known Host Check Result.ctl`         |
| `LIBSSH2_KNOWNHOST_CHECK_NOTFOUND`      | `libssh2.lvlib:Known Host Check Result.ctl`         |
| `LIBSSH2_KNOWNHOST_CHECK_FAILURE`       | `libssh2.lvlib:Known Host Check Result.ctl`         |
| `LIBSSH2_KNOWNHOST_TYPE_MASK`           |
| `LIBSSH2_KNOWNHOST_TYPE_PLAIN`          |
| `LIBSSH2_KNOWNHOST_TYPE_SHA1`           |
| `LIBSSH2_KNOWNHOST_TYPE_CUSTOM`         |
| `LIBSSH2_KNOWNHOST_KEYENC_MASK`         |
| `LIBSSH2_KNOWNHOST_KEYENC_RAW`          |
| `LIBSSH2_KNOWNHOST_KEYENC_BASE64`       |
| `LIBSSH2_KNOWNHOST_KEY_MASK`            |
| `LIBSSH2_KNOWNHOST_KEY_SHIFT`           |
| `LIBSSH2_KNOWNHOST_KEY_RSA1`            |
| `LIBSSH2_KNOWNHOST_KEY_SSHRSA`          |
| `LIBSSH2_KNOWNHOST_KEY_SSHDSS`          |
| `LIBSSH2_KNOWNHOST_KEY_ECDSA_256`       |
| `LIBSSH2_KNOWNHOST_KEY_ECDSA_384`       |
| `LIBSSH2_KNOWNHOST_KEY_ECDSA_521`       |
| `LIBSSH2_KNOWNHOST_KEY_ED25519`         |
| `LIBSSH2_KNOWNHOST_KEY_UNKNOWN`         |
| `LIBSSH2_KNOWNHOST_FILE_OPENSSH`        | `libssh2.lvlib:Known Host File Type.ctl`            |
| `LIBSSH2_METHOD_KEX`                    | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_HOSTKEY`                | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_CRYPT_CS`               | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_CRYPT_SC`               | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_MAC_CS`                 | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_MAC_SC`                 | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_COMP_CS`                | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_COMP_SC`                | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_LANG_CS`                | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_LANG_SC`                | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_METHOD_SIGN_ALGO`              | `libssh2.lvlib:libssh2_method_type.ctl`             |
| `LIBSSH2_SESSION_BLOCK_INBOUND`         | `libssh2.lvlib:libssh2_session_block_direction.ctl` |
| `LIBSSH2_SESSION_BLOCK_OUTBOUND`        | `libssh2.lvlib:libssh2_session_block_direction.ctl` |
| `LIBSSH2_SFTP_STATVFS`                  | `libssh2.lvlib:libssh2_sftp_statvfs.ctl`            |
| `LIBSSH2_SFTP_STAT`                     | `libssh2.lvlib:libssh2_sftp_stat_type.ctl`          |
| `LIBSSH2_SFTP_LSTAT`                    | `libssh2.lvlib:libssh2_sftp_stat_type.ctl`          |
| `LIBSSH2_SFTP_SETSTAT`                  | `libssh2.lvlib:libssh2_sftp_stat_type.ctl`          |

# Standard Error Codes
Standard error codes are mapped to error range 5000 through 5999 (0x1388 through 0x176F).

| libssh2                                 | lvssh2                                                        |
| --------------------------------------- | ------------------------------------------------------------- |
| `LIBSSH2_ERROR_NONE`                    | no error                                                      |
| `LIBSSH2_ERROR_SOCKET_NONE`             | `libssh2: (Hex 0x1388) LIBSSH2_ERROR_SOCKET_NONE`             |
| `LIBSSH2_ERROR_BANNER_RECV`             | `libssh2: (Hex 0x1389) LIBSSH2_ERROR_BANNER_RECV`             |
| `LIBSSH2_ERROR_BANNER_NONE`             | `libssh2: (Hex 0x1389) LIBSSH2_ERROR_BANNER_RECV`             |
| `LIBSSH2_ERROR_BANNER_SEND`             | `libssh2: (Hex 0x138A) LIBSSH2_ERROR_BANNER_SEND`             |
| `LIBSSH2_ERROR_INVALID_MAC`             | `libssh2: (Hex 0x138B) LIBSSH2_ERROR_INVALID_MAC`             |
| `LIBSSH2_ERROR_KEX_FAILURE`             | `libssh2: (Hex 0x138C) LIBSSH2_ERROR_KEX_FAILURE`             |
| `LIBSSH2_ERROR_ALLOC`                   | `libssh2: (Hex 0x138D) LIBSSH2_ERROR_ALLOC`                   |
| `LIBSSH2_ERROR_SOCKET_SEND`             | `libssh2: (Hex 0x138E) LIBSSH2_ERROR_SOCKET_SEND`             |
| `LIBSSH2_ERROR_KEY_EXCHANGE_FAILURE`    | `libssh2: (Hex 0x138F) LIBSSH2_ERROR_KEY_EXCHANGE_FAILURE`    |
| `LIBSSH2_ERROR_TIMEOUT`                 | `libssh2: (Hex 0x1390) LIBSSH2_ERROR_TIMEOUT`                 |
| `LIBSSH2_ERROR_HOSTKEY_INIT`            | `libssh2: (Hex 0x1391) LIBSSH2_ERROR_HOSTKEY_INIT`            |
| `LIBSSH2_ERROR_HOSTKEY_SIGN`            | `libssh2: (Hex 0x1392) LIBSSH2_ERROR_HOSTKEY_SIGN`            |
| `LIBSSH2_ERROR_DECRYPT`                 | `libssh2: (Hex 0x1393) LIBSSH2_ERROR_DECRYPT`                 |
| `LIBSSH2_ERROR_SOCKET_DISCONNECT`       | `libssh2: (Hex 0x1394) LIBSSH2_ERROR_SOCKET_DISCONNECT`       |
| `LIBSSH2_ERROR_PROTO`                   | `libssh2: (Hex 0x1395) LIBSSH2_ERROR_PROTO`                   |
| `LIBSSH2_ERROR_PASSWORD_EXPIRED`        | `libssh2: (Hex 0x1396) LIBSSH2_ERROR_PASSWORD_EXPIRED`        |
| `LIBSSH2_ERROR_FILE`                    | `libssh2: (Hex 0x1397) LIBSSH2_ERROR_FILE`                    |
| `LIBSSH2_ERROR_METHOD_NONE`             | `libssh2: (Hex 0x1398) LIBSSH2_ERROR_METHOD_NONE`             |
| `LIBSSH2_ERROR_AUTHENTICATION_FAILED`   | `libssh2: (Hex 0x1399) LIBSSH2_ERROR_AUTHENTICATION_FAILED`   |
| `LIBSSH2_ERROR_PUBLICKEY_UNRECOGNIZED`  | `libssh2: (Hex 0x1399) LIBSSH2_ERROR_AUTHENTICATION_FAILED`   |
| `LIBSSH2_ERROR_PUBLICKEY_UNVERIFIED`    | `libssh2: (Hex 0x139A) LIBSSH2_ERROR_PUBLICKEY_UNVERIFIED`    |
| `LIBSSH2_ERROR_CHANNEL_OUTOFORDER`      | `libssh2: (Hex 0x139B) LIBSSH2_ERROR_CHANNEL_OUTOFORDER`      |
| `LIBSSH2_ERROR_CHANNEL_FAILURE`         | `libssh2: (Hex 0x139C) LIBSSH2_ERROR_CHANNEL_FAILURE`         |
| `LIBSSH2_ERROR_CHANNEL_REQUEST_DENIED`  | `libssh2: (Hex 0x139D) LIBSSH2_ERROR_CHANNEL_REQUEST_DENIED`  |
| `LIBSSH2_ERROR_CHANNEL_UNKNOWN`         | `libssh2: (Hex 0x139E) LIBSSH2_ERROR_CHANNEL_UNKNOWN`         |
| `LIBSSH2_ERROR_CHANNEL_WINDOW_EXCEEDED` | `libssh2: (Hex 0x139F) LIBSSH2_ERROR_CHANNEL_WINDOW_EXCEEDED` |
| `LIBSSH2_ERROR_CHANNEL_PACKET_EXCEEDED` | `libssh2: (Hex 0x13A0) LIBSSH2_ERROR_CHANNEL_PACKET_EXCEEDED` |
| `LIBSSH2_ERROR_CHANNEL_CLOSED`          | `libssh2: (Hex 0x13A1) LIBSSH2_ERROR_CHANNEL_CLOSED`          |
| `LIBSSH2_ERROR_CHANNEL_EOF_SENT`        | `libssh2: (Hex 0x13A2) LIBSSH2_ERROR_CHANNEL_EOF_SENT`        |
| `LIBSSH2_ERROR_SCP_PROTOCOL`            | `libssh2: (Hex 0x13A3) LIBSSH2_ERROR_SCP_PROTOCOL`            |
| `LIBSSH2_ERROR_ZLIB`                    | `libssh2: (Hex 0x13A4) LIBSSH2_ERROR_ZLIB`                    |
| `LIBSSH2_ERROR_SOCKET_TIMEOUT`          | `libssh2: (Hex 0x13A5) LIBSSH2_ERROR_SOCKET_TIMEOUT`          |
| `LIBSSH2_ERROR_SFTP_PROTOCOL`           | `libssh2: (Hex 0x13A6) LIBSSH2_ERROR_SFTP_PROTOCOL`           |
| `LIBSSH2_ERROR_REQUEST_DENIED`          | `libssh2: (Hex 0x13A7) LIBSSH2_ERROR_REQUEST_DENIED`          |
| `LIBSSH2_ERROR_METHOD_NOT_SUPPORTED`    | `libssh2: (Hex 0x13A8) LIBSSH2_ERROR_METHOD_NOT_SUPPORTED`    |
| `LIBSSH2_ERROR_INVAL`                   | `libssh2: (Hex 0x13A9) LIBSSH2_ERROR_INVAL`                   |
| `LIBSSH2_ERROR_INVALID_POLL_TYPE`       | `libssh2: (Hex 0x13AA) LIBSSH2_ERROR_INVALID_POLL_TYPE`       |
| `LIBSSH2_ERROR_PUBLICKEY_PROTOCOL`      | `libssh2: (Hex 0x13AB) LIBSSH2_ERROR_PUBLICKEY_PROTOCOL`      |
| `LIBSSH2_ERROR_EAGAIN`                  | `libssh2: (Hex 0x13AC) LIBSSH2_ERROR_EAGAIN`                  |
| `LIBSSH2_ERROR_BUFFER_TOO_SMALL`        | `libssh2: (Hex 0x13AD) LIBSSH2_ERROR_BUFFER_TOO_SMALL`        |
| `LIBSSH2_ERROR_BAD_USE`                 | `libssh2: (Hex 0x13AE) LIBSSH2_ERROR_BAD_USE`                 |
| `LIBSSH2_ERROR_COMPRESS`                | `libssh2: (Hex 0x13AF) LIBSSH2_ERROR_COMPRESS`                |
| `LIBSSH2_ERROR_OUT_OF_BOUNDARY`         | `libssh2: (Hex 0x13B0) LIBSSH2_ERROR_OUT_OF_BOUNDARY`         |
| `LIBSSH2_ERROR_AGENT_PROTOCOL`          | `libssh2: (Hex 0x13B1) LIBSSH2_ERROR_AGENT_PROTOCOL`          |
| `LIBSSH2_ERROR_SOCKET_RECV`             | `libssh2: (Hex 0x13B2) LIBSSH2_ERROR_SOCKET_RECV`             |
| `LIBSSH2_ERROR_ENCRYPT`                 | `libssh2: (Hex 0x13B3) LIBSSH2_ERROR_ENCRYPT`                 |
| `LIBSSH2_ERROR_BAD_SOCKET`              | `libssh2: (Hex 0x13B4) LIBSSH2_ERROR_BAD_SOCKET`              |
| `LIBSSH2_ERROR_KNOWN_HOSTS`             | `libssh2: (Hex 0x13B5) LIBSSH2_ERROR_KNOWN_HOSTS`             |
| `LIBSSH2_ERROR_CHANNEL_WINDOW_FULL`     | `libssh2: (Hex 0x13B6) LIBSSH2_ERROR_CHANNEL_WINDOW_FULL`     |
| `LIBSSH2_ERROR_KEYFILE_AUTH_FAILED`     | `libssh2: (Hex 0x13B7) LIBSSH2_ERROR_KEYFILE_AUTH_FAILED`     |
| `LIBSSH2_ERROR_RANDGEN`                 | `libssh2: (Hex 0x13B8) LIBSSH2_ERROR_RANDGEN`                 |
| `LIBSSH2_ERROR_MISSING_USERAUTH_BANNER` | `libssh2: (Hex 0x13B9) LIBSSH2_ERROR_MISSING_USERAUTH_BANNER` |
| `LIBSSH2_ERROR_ALGO_UNSUPPORTED`        | `libssh2: (Hex 0x13BA) LIBSSH2_ERROR_ALGO_UNSUPPORTED`        |

# SFTP Error Codes
SFTP error codes are mapped to error range 6000 through 6999 (0x1770 through 0x1B57)

| libssh2-sftp                        | lvssh2                                                         |
| ----------------------------------- | -------------------------------------------------------------- |
| `LIBSSH2_FX_OK`                     | no error                                                       |
| `LIBSSH2_FX_EOF`                    | `libssh2-sftp: (Hex 0x1770) LIBSSH2_FX_EOF`                    |
| `LIBSSH2_FX_NO_SUCH_FILE`           | `libssh2-sftp: (Hex 0x1771) LIBSSH2_FX_NO_SUCH_FILE`           |
| `LIBSSH2_FX_PERMISSION_DENIED`      | `libssh2-sftp: (Hex 0x1772) LIBSSH2_FX_PERMISSION_DENIED`      |
| `LIBSSH2_FX_FAILURE`                | `libssh2-sftp: (Hex 0x1773) LIBSSH2_FX_FAILURE`                |
| `LIBSSH2_FX_BAD_MESSAGE`            | `libssh2-sftp: (Hex 0x1774) LIBSSH2_FX_BAD_MESSAGE`            |
| `LIBSSH2_FX_NO_CONNECTION`          | `libssh2-sftp: (Hex 0x1775) LIBSSH2_FX_NO_CONNECTION`          |
| `LIBSSH2_FX_CONNECTION_LOST`        | `libssh2-sftp: (Hex 0x1776) LIBSSH2_FX_CONNECTION_LOST`        |
| `LIBSSH2_FX_OP_UNSUPPORTED`         | `libssh2-sftp: (Hex 0x1777) LIBSSH2_FX_OP_UNSUPPORTED`         |
| `LIBSSH2_FX_INVALID_HANDLE`         | `libssh2-sftp: (Hex 0x1778) LIBSSH2_FX_INVALID_HANDLE`         |
| `LIBSSH2_FX_NO_SUCH_PATH`           | `libssh2-sftp: (Hex 0x1779) LIBSSH2_FX_NO_SUCH_PATH`           |
| `LIBSSH2_FX_FILE_ALREADY_EXISTS`    | `libssh2-sftp: (Hex 0x177A) LIBSSH2_FX_FILE_ALREADY_EXISTS`    |
| `LIBSSH2_FX_WRITE_PROTECT`          | `libssh2-sftp: (Hex 0x177B) LIBSSH2_FX_WRITE_PROTECT`          |
| `LIBSSH2_FX_NO_MEDIA`               | `libssh2-sftp: (Hex 0x177C) LIBSSH2_FX_NO_MEDIA`               |
| `LIBSSH2_FX_NO_SPACE_ON_FILESYSTEM` | `libssh2-sftp: (Hex 0x177D) LIBSSH2_FX_NO_SPACE_ON_FILESYSTEM` |
| `LIBSSH2_FX_QUOTA_EXCEEDED`         | `libssh2-sftp: (Hex 0x177E) LIBSSH2_FX_QUOTA_EXCEEDED`         |
| `LIBSSH2_FX_UNKNOWN_PRINCIPAL`      | `libssh2-sftp: (Hex 0x177F) LIBSSH2_FX_UNKNOWN_PRINCIPAL`      |
| `LIBSSH2_FX_LOCK_CONFLICT`          | `libssh2-sftp: (Hex 0x1780) LIBSSH2_FX_LOCK_CONFLICT`          |
| `LIBSSH2_FX_DIR_NOT_EMPTY`          | `libssh2-sftp: (Hex 0x1781) LIBSSH2_FX_DIR_NOT_EMPTY`          |
| `LIBSSH2_FX_NOT_A_DIRECTORY`        | `libssh2-sftp: (Hex 0x1782) LIBSSH2_FX_NOT_A_DIRECTORY`        |
| `LIBSSH2_FX_INVALID_FILENAME`       | `libssh2-sftp: (Hex 0x1783) LIBSSH2_FX_INVALID_FILENAME`       |
| `LIBSSH2_FX_LINK_LOOP`              | `libssh2-sftp: (Hex 0x1784) LIBSSH2_FX_LINK_LOOP`              |

# Functions
| libssh2                                                                                | lvssh2                                                |
| -------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| [`libssh2_agent_connect`][libssh2_agent_connect]                                       | `libssh2.lvlib:libssh2_agent_connect.vi`              |
| [`libssh2_agent_disconnect`][libssh2_agent_disconnect]                                 | `libssh2.lvlib:libssh2_agent_disconnect.vi`           |
| [`libssh2_agent_free`][libssh2_agent_free]                                             | `libssh2.lvlib:libssh2_agent_free.vi`                 |
| [`libssh2_agent_get_identity`][libssh2_agent_get_identity]                             | `libssh2.lvlib:libssh2_agent_get_identity.vi`         |
| [`libssh2_agent_get_identity_path`][libssh2_agent_get_identity_path]                   | `libssh2.lvlib:libssh2_agent_get_identity_path.vi`    |
| [`libssh2_agent_init`][libssh2_agent_init]                                             | `libssh2.lvlib:libssh2_agent_init.vi`                 |
| [`libssh2_agent_list_identities`][libssh2_agent_list_identities]                       | `libssh2.lvlib:libssh2_agent_list_identities.vi`      |
| [`libssh2_agent_set_identity_path`][libssh2_agent_set_identity_path]                   | `libssh2.lvlib:libssh2_agent_set_identity_path.vi`    |
| [`libssh2_agent_sign`][libssh2_agent_sign]                                             | `libssh2.lvlib:libssh2_agent_sign.vi`                 |
| [`libssh2_agent_userauth`][libssh2_agent_userauth]                                     | `libssh2.lvlib:libssh2_agent_userauth.vi`             |
| [`libssh2_banner_set`][libssh2_banner_set]                                             | Deprecated. Use `libssh2_session_banner_set` instead! |
| [`libssh2_base64_decode`][libssh2_base64_decode]                                       | Deprecated. Use dedicated base64 library instead!     |
| [`libssh2_channel_close`][libssh2_channel_close]                                       | `libssh2.lvlib:libssh2_channel_close.vi`              |
| [`libssh2_channel_direct_streamlocal_ex`][libssh2_channel_direct_streamlocal_ex]       |                                                       |
| [`libssh2_channel_direct_tcpip`][libssh2_channel_direct_tcpip]                         | `libssh2.lvlib:libssh2_channel_direct_tcpip.vi`       |
| [`libssh2_channel_direct_tcpip_ex`][libssh2_channel_direct_tcpip_ex]                   | `libssh2.lvlib:libssh2_channel_direct_tcpip_ex.vi`    |
| [`libssh2_channel_eof`][libssh2_channel_eof]                                           | `libssh2.lvlib:libssh2_channel_eof.vi`                |
| [`libssh2_channel_exec`][libssh2_channel_exec]                                         | `libssh2.lvlib:libssh2_channel_exec.vi`               |
| [`libssh2_channel_flush`][libssh2_channel_flush]                                       | `libssh2.lvlib:libssh2_channel_flush.vi`              |
| [`libssh2_channel_flush_ex`][libssh2_channel_flush_ex]                                 | `libssh2.lvlib:libssh2_channel_flush_ex.vi`           |
| [`libssh2_channel_flush_stderr`][libssh2_channel_flush_stderr]                         | `libssh2.lvlib:libssh2_channel_flush_stderr.vi`       |
| [`libssh2_channel_forward_accept`][libssh2_channel_forward_accept]                     | `libssh2.lvlib:libssh2_channel_forward_accept.vi`     |
| [`libssh2_channel_forward_cancel`][libssh2_channel_forward_cancel]                     | `libssh2.lvlib:libssh2_channel_forward_cancel.vi`     |
| [`libssh2_channel_forward_listen`][libssh2_channel_forward_listen]                     | `libssh2.lvlib:libssh2_channel_forward_listen.vi`     |
| [`libssh2_channel_forward_listen_ex`][libssh2_channel_forward_listen_ex]               | `libssh2.lvlib:libssh2_channel_forward_listen_ex.vi`  |
| [`libssh2_channel_free`][libssh2_channel_free]                                         | `libssh2.lvlib:libssh2_channel_free.vi`               |
| [`libssh2_channel_get_exit_signal`][libssh2_channel_get_exit_signal]                   | `libssh2.lvlib:libssh2_channel_get_exit_signal.vi`    |
| [`libssh2_channel_get_exit_status`][libssh2_channel_get_exit_status]                   | `libssh2.lvlib:libssh2_channel_get_exit_status.vi`    |
| [`libssh2_channel_handle_extended_data`][libssh2_channel_handle_extended_data]         |
| [`libssh2_channel_handle_extended_data2`][libssh2_channel_handle_extended_data2]       |
| [`libssh2_channel_ignore_extended_data`][libssh2_channel_ignore_extended_data]         |
| [`libssh2_channel_open_ex`][libssh2_channel_open_ex]                                   | `libssh2.lvlib:libssh2_channel_open_ex.vi`            |
| [`libssh2_channel_open_session`][libssh2_channel_open_session]                         | `libssh2.lvlib:libssh2_channel_open_session.vi`       |
| [`libssh2_channel_process_startup`][libssh2_channel_process_startup]                   | `libssh2.lvlib:libssh2_channel_process_startup.vi`    |
| [`libssh2_channel_read`][libssh2_channel_read]                                         | `libssh2.lvlib:libssh2_channel_read.vi`               |
| [`libssh2_channel_read_ex`][libssh2_channel_read_ex]                                   | `libssh2.lvlib:libssh2_channel_read_ex.vi`            |
| [`libssh2_channel_read_stderr`][libssh2_channel_read_stderr]                           | `libssh2.lvlib:libssh2_channel_read_stderr.vi`        |
| [`libssh2_channel_receive_window_adjust`][libssh2_channel_receive_window_adjust]       |                                                       |
| [`libssh2_channel_receive_window_adjust2`][libssh2_channel_receive_window_adjust2]     |                                                       |
| [`libssh2_channel_request_auth_agent`][libssh2_channel_request_auth_agent]             |                                                       |
| [`libssh2_channel_request_pty`][libssh2_channel_request_pty]                           |                                                       |
| [`libssh2_channel_request_pty_ex`][libssh2_channel_request_pty_ex]                     | `libssh2.lvlib:libssh2_channel_request_pty_ex.vi`     |
| [`libssh2_channel_request_pty_size`][libssh2_channel_request_pty_size]                 |                                                       |
| [`libssh2_channel_request_pty_size_ex`][libssh2_channel_request_pty_size_ex]           |                                                       |
| [`libssh2_channel_send_eof`][libssh2_channel_send_eof]                                 | `libssh2.lvlib:libssh2_channel_send_eof.vi`           |
| [`libssh2_channel_set_blocking`][libssh2_channel_set_blocking]                         | `libssh2.lvlib:libssh2_channel_set_blocking.vi`       |
| [`libssh2_channel_setenv`][libssh2_channel_setenv]                                     | See `libssh2_channel_setenv_ex`                       |
| [`libssh2_channel_setenv_ex`][libssh2_channel_setenv_ex]                               | `libssh2.lvlib:libssh2_channel_setenv_ex.vi`          |
| [`libssh2_channel_shell`][libssh2_channel_shell]                                       |                                                       |
| [`libssh2_channel_signal_ex`][libssh2_channel_signal_ex]                               |                                                       |
| [`libssh2_channel_subsystem`][libssh2_channel_subsystem]                               |                                                       |
| [`libssh2_channel_wait_closed`][libssh2_channel_wait_closed]                           |                                                       |
| [`libssh2_channel_wait_eof`][libssh2_channel_wait_eof]                                 |                                                       |
| [`libssh2_channel_window_read`][libssh2_channel_window_read]                           | See `libssh2_channel_window_read_ex`                  |
| [`libssh2_channel_window_read_ex`][libssh2_channel_window_read_ex]                     | `libssh2.lvlib:libssh2_channel_window_read_ex.vi`     |
| [`libssh2_channel_window_write`][libssh2_channel_window_write]                         | See `libssh2_channel_window_write_ex`                 |
| [`libssh2_channel_window_write_ex`][libssh2_channel_window_write_ex]                   | `libssh2.lvlib:libssh2_channel_window_write_ex.vi`    |
| [`libssh2_channel_write`][libssh2_channel_write]                                       | `libssh2.lvlib:libssh2_channel_write.vi`              |
| [`libssh2_channel_write_ex`][libssh2_channel_write_ex]                                 | `libssh2.lvlib:libssh2_channel_write_ex.vi`           |
| [`libssh2_channel_write_stderr`][libssh2_channel_write_stderr]                         | `libssh2.lvlib:libssh2_channel_write_stderr.vi`       |
| [`libssh2_channel_x11_req`][libssh2_channel_x11_req]                                   |                                                       |
| [`libssh2_channel_x11_req_ex`][libssh2_channel_x11_req_ex]                             |                                                       |
| [`libssh2_crypto_engine`][libssh2_crypto_engine]                                       | `libssh2.lvlib:libssh2_crypto_engine.vi`              |
| [`libssh2_exit`][libssh2_exit]                                                         | `libssh2.lvlib:libssh2_exit.vi`                       |
| [`libssh2_free`][libssh2_free]                                                         | `libssh2.lvlib:libssh2_free.vi`                       |
| [`libssh2_hostkey_hash`][libssh2_hostkey_hash]                                         | `libssh2.lvlib:libssh2_hostkey_hash.vi`               |
| [`libssh2_init`][libssh2_init]                                                         | `libssh2.lvlib:libssh2_init.vi`                       |
| [`libssh2_keepalive_config`][libssh2_keepalive_config]                                 |                                                       |
| [`libssh2_keepalive_send`][libssh2_keepalive_send]                                     |                                                       |
| [`libssh2_knownhost_add`][libssh2_knownhost_add]                                       |                                                       |
| [`libssh2_knownhost_addc`][libssh2_knownhost_addc]                                     |                                                       |
| [`libssh2_knownhost_check`][libssh2_knownhost_check]                                   |                                                       |
| [`libssh2_knownhost_checkp`][libssh2_knownhost_checkp]                                 | `libssh2.lvlib:libssh2_knownhost_checkp.vi`           |
| [`libssh2_knownhost_del`][libssh2_knownhost_del]                                       |                                                       |
| [`libssh2_knownhost_free`][libssh2_knownhost_free]                                     | `libssh2.lvlib:libssh2_knownhost_free.vi`             |
| [`libssh2_knownhost_get`][libssh2_knownhost_get]                                       | `libssh2.lvlib:libssh2_knownhost_get.vi`              |
| [`libssh2_knownhost_init`][libssh2_knownhost_init]                                     | `libssh2.lvlib:libssh2_knownhost_init.vi`             |
| [`libssh2_knownhost_readfile`][libssh2_knownhost_readfile]                             | `libssh2.lvlib:libssh2_knownhost_readfile.vi`         |
| [`libssh2_knownhost_readline`][libssh2_knownhost_readline]                             |                                                       |
| [`libssh2_knownhost_writefile`][libssh2_knownhost_writefile]                           | `libssh2.lvlib:libssh2_knownhost_writefile.vi`        |
| [`libssh2_knownhost_writeline`][libssh2_knownhost_writeline]                           |
| [`libssh2_poll`][libssh2_poll]                                                         |
| [`libssh2_poll_channel_read`][libssh2_poll_channel_read]                               |
| [`libssh2_publickey_add`][libssh2_publickey_add]                                       |
| [`libssh2_publickey_add_ex`][libssh2_publickey_add_ex]                                 |
| [`libssh2_publickey_init`][libssh2_publickey_init]                                     |
| [`libssh2_publickey_list_fetch`][libssh2_publickey_list_fetch]                         |
| [`libssh2_publickey_list_free`][libssh2_publickey_list_free]                           |
| [`libssh2_publickey_remove`][libssh2_publickey_remove]                                 |
| [`libssh2_publickey_remove_ex`][libssh2_publickey_remove_ex]                           |
| [`libssh2_publickey_shutdown`][libssh2_publickey_shutdown]                             |
| [`libssh2_scp_recv`][libssh2_scp_recv]                                                 |
| [`libssh2_scp_recv2`][libssh2_scp_recv2]                                               |
| [`libssh2_scp_send`][libssh2_scp_send]                                                 |
| [`libssh2_scp_send64`][libssh2_scp_send64]                                             |
| [`libssh2_scp_send_ex`][libssh2_scp_send_ex]                                           |
| [`libssh2_session_abstract`][libssh2_session_abstract]                                 | `libssh2.lvlib:libssh2_session_abstract.vi`           |
| [`libssh2_session_banner_get`][libssh2_session_banner_get]                             | `libssh2.lvlib:libssh2_session_banner_get.vi`         |
| [`libssh2_session_banner_set`][libssh2_session_banner_set]                             | `libssh2.lvlib:libssh2_session_banner_set.vi`         |
| [`libssh2_session_block_directions`][libssh2_session_block_directions]                 | `libssh2.lvlib:libssh2_session_block_directions.vi`   |
| [`libssh2_session_callback_set`][libssh2_session_callback_set]                         | `libssh2.lvlib:libssh2_session_callback_set.vi`       |
| [`libssh2_session_disconnect`][libssh2_session_disconnect]                             | `libssh2.lvlib:libssh2_session_disconnect.vi`         |
| [`libssh2_session_disconnect_ex`][libssh2_session_disconnect_ex]                       | `libssh2.lvlib:libssh2_session_disconnect_ex.vi`      |
| [`libssh2_session_flag`][libssh2_session_flag]                                         | `libssh2.lvlib:libssh2_session_flag.vi`               |
| [`libssh2_session_free`][libssh2_session_free]                                         | `libssh2.lvlib:libssh2_session_free.vi`               |
| [`libssh2_session_get_blocking`][libssh2_session_get_blocking]                         | `libssh2.lvlib:libssh2_session_get_blocking.vi`       |
| [`libssh2_session_get_read_timeout`][libssh2_session_get_read_timeout]                 | `libssh2.lvlib:libssh2_session_get_read_timeout.vi`   |
| [`libssh2_session_get_timeout`][libssh2_session_get_timeout]                           | `libssh2.lvlib:libssh2_session_get_timeout.vi`        |
| [`libssh2_session_handshake`][libssh2_session_handshake]                               | `libssh2.lvlib:libssh2_session_handshake.vi`          |
| [`libssh2_session_hostkey`][libssh2_session_hostkey]                                   | `libssh2.lvlib:libssh2_session_hostkey.vi`            |
| [`libssh2_session_init`][libssh2_session_init]                                         | `libssh2.lvlib:libssh2_session_init.vi`               |
| [`libssh2_session_init_ex`][libssh2_session_init_ex]                                   | `libssh2.lvlib:libssh2_session_init_ex.vi`            |
| [`libssh2_session_last_errno`][libssh2_session_last_errno]                             | `libssh2.lvlib:libssh2_session_last_errno.vi`         |
| [`libssh2_session_last_error`][libssh2_session_last_error]                             | `libssh2.lvlib:libssh2_session_last_error.vi`         |
| [`libssh2_session_method_pref`][libssh2_session_method_pref]                           | `libssh2.lvlib:libssh2_session_method_pref.vi`        |
| [`libssh2_session_methods`][libssh2_session_methods]                                   | `libssh2.lvlib:libssh2_session_methods.vi`            |
| [`libssh2_session_set_blocking`][libssh2_session_set_blocking]                         | `libssh2.lvlib:libssh2_session_set_blocking.vi`       |
| [`libssh2_session_set_last_error`][libssh2_session_set_last_error]                     | `libssh2.lvlib:libssh2_session_set_last_error.vi`     |
| [`libssh2_session_set_read_timeout`][libssh2_session_set_read_timeout]                 | `libssh2.lvlib:libssh2_session_set_read_timeout.vi`   |
| [`libssh2_session_set_timeout`][libssh2_session_set_timeout]                           | `libssh2.lvlib:libssh2_session_set_timeout.vi`        |
| [`libssh2_session_startup`][libssh2_session_startup]                                   | Deprecated. Use `libssh2_session_handshake` instead!  |
| [`libssh2_session_supported_algs`][libssh2_session_supported_algs]                     | `libssh2.lvlib:libssh2_session_supported_algs`        |
| [`libssh2_sftp_close`][libssh2_sftp_close]                                             | `libssh2.lvlib:libssh2_sftp_close.vi`                 |
| [`libssh2_sftp_close_handle`][libssh2_sftp_close_handle]                               | `libssh2.lvlib:libssh2_sftp_close_handle.vi`          |
| [`libssh2_sftp_closedir`][libssh2_sftp_closedir]                                       | `libssh2.lvlib:libssh2_sftp_closedir.vi`              |
| [`libssh2_sftp_fsetstat`][libssh2_sftp_fsetstat]                                       | `libssh2.lvlib:libssh2_sftp_fsetstat.vi`              |
| [`libssh2_sftp_fstat`][libssh2_sftp_fstat]                                             | `libssh2.lvlib:libssh2_sftp_fstat.vi`                 |
| [`libssh2_sftp_fstat_ex`][libssh2_sftp_fstat_ex]                                       | `libssh2.lvlib:libssh2_sftp_fstat_ex.vi`              |
| [`libssh2_sftp_fstatvfs`][libssh2_sftp_fstatvfs]                                       | `libssh2.lvlib:libssh2_sftp_fstatvfs.vi`              |
| [`libssh2_sftp_fsync`][libssh2_sftp_fsync]                                             | `libssh2.lvlib:libssh2_sftp_fsync.vi`                 |
| [`libssh2_sftp_get_channel`][libssh2_sftp_get_channel]                                 | `libssh2.lvlib:libssh2_sftp_get_channel.vi`           |
| [`libssh2_sftp_init`][libssh2_sftp_init]                                               | `libssh2.lvlib:libssh2_sftp_init.vi`                  |
| [`libssh2_sftp_last_error`][libssh2_sftp_last_error]                                   | `libssh2.lvlib:libssh2_sftp_last_error.vi`            |
| [`libssh2_sftp_lstat`][libssh2_sftp_lstat]                                             | `libssh2.lvlib:libssh2_sftp_lstat.vi`                 |
| [`libssh2_sftp_mkdir`][libssh2_sftp_mkdir]                                             | See `libssh2_sftp_mkdir_ex`                           |
| [`libssh2_sftp_mkdir_ex`][libssh2_sftp_mkdir_ex]                                       | `libssh2.lvlib:libssh2_sftp_mkdir_ex.vi`              |
| [`libssh2_sftp_open`][libssh2_sftp_open]                                               | `libssh2.lvlib:libssh2_sftp_open.vi`                  |
| [`libssh2_sftp_open_ex`][libssh2_sftp_open_ex]                                         | `libssh2.lvlib:libssh2_sftp_open_ex.vi`               |
| [`libssh2_sftp_open_ex_r`][libssh2_sftp_open_ex_r]                                     | `libssh2.lvlib:libssh2_sftp_open_ex_r.vi`             |
| [`libssh2_sftp_open_r`][libssh2_sftp_open_r]                                           | `libssh2.lvlib:libssh2_sftp_open_r.vi`                |
| [`libssh2_sftp_opendir`][libssh2_sftp_opendir]                                         | `libssh2.lvlib:libssh2_sftp_opendir.vi`               |
| [`libssh2_sftp_read`][libssh2_sftp_read]                                               | `libssh2.lvlib:libssh2_sftp_read.vi`                  |
| [`libssh2_sftp_readdir`][libssh2_sftp_readdir]                                         | `libssh2.lvlib:libssh2_sftp_readdir.vi`               |
| [`libssh2_sftp_readdir_ex`][libssh2_sftp_readdir_ex]                                   | `libssh2.lvlib:libssh2_sftp_readdir_ex.vi`            |
| [`libssh2_sftp_readlink`][libssh2_sftp_readlink]                                       | `libssh2.lvlib:libssh2_sftp_readlink.vi`              |
| [`libssh2_sftp_realpath`][libssh2_sftp_realpath]                                       | `libssh2.lvlib:libssh2_sftp_realpath.vi`              |
| [`libssh2_sftp_rename`][libssh2_sftp_rename]                                           | `libssh2.lvlib:libssh2_sftp_rename.vi`                |
| [`libssh2_sftp_rename_ex`][libssh2_sftp_rename_ex]                                     | `libssh2.lvlib:libssh2_sftp_rename_ex.vi`             |
| [`libssh2_sftp_rewind`][libssh2_sftp_rewind]                                           | `libssh2.lvlib:libssh2_sftp_rewind.vi`                |
| [`libssh2_sftp_rmdir`][libssh2_sftp_rmdir]                                             | See `libssh2_sftp_rmdir_ex`                           |
| [`libssh2_sftp_rmdir_ex`][libssh2_sftp_rmdir_ex]                                       | `libssh2.lvlib:libssh2_sftp_rmdir_ex.vi`              |
| [`libssh2_sftp_seek`][libssh2_sftp_seek]                                               | Deprecated. Use `libssh2_sftp_seek64` instead!        |
| [`libssh2_sftp_seek64`][libssh2_sftp_seek64]                                           | `libssh2.lvlib:libssh2_sftp_seek64.vi`                |
| [`libssh2_sftp_setstat`][libssh2_sftp_setstat]                                         | `libssh2.lvlib:libssh2_sftp_setstat.vi`               |
| [`libssh2_sftp_shutdown`][libssh2_sftp_shutdown]                                       | `libssh2.lvlib:libssh2_sftp_shutdown.vi`              |
| [`libssh2_sftp_stat`][libssh2_sftp_stat]                                               | `libssh2.lvlib:libssh2_sftp_stat.vi`                  |
| [`libssh2_sftp_stat_ex`][libssh2_sftp_stat_ex]                                         | `libssh2.lvlib:libssh2_sftp_stat_ex.vi`               |
| [`libssh2_sftp_statvfs`][libssh2_sftp_statvfs]                                         | `libssh2.lvlib:libssh2_sftp_statvfs.vi`               |
| [`libssh2_sftp_symlink`][libssh2_sftp_symlink]                                         | `libssh2.lvlib:libssh2_sftp_symlink.vi`               |
| [`libssh2_sftp_symlink_ex`][libssh2_sftp_symlink_ex]                                   | `libssh2.lvlib:libssh2_sftp_symlink_ex.vi`            |
| [`libssh2_sftp_tell`][libssh2_sftp_tell]                                               | Deprecated. Use `libssh2_sftp_tell64` instead!        |
| [`libssh2_sftp_tell64`][libssh2_sftp_tell64]                                           | `libssh2.lvlib:libssh2_sftp_tell64.vi`                |
| [`libssh2_sftp_unlink`][libssh2_sftp_unlink]                                           |                                                       |
| [`libssh2_sftp_unlink_ex`][libssh2_sftp_unlink_ex]                                     |                                                       |
| [`libssh2_sftp_write`][libssh2_sftp_write]                                             | `libssh2.lvlib:libssh2_sftp_write.vi`                 |
| [`libssh2_sign_sk`][libssh2_sign_sk]                                                   |                                                       |
| [`libssh2_trace`][libssh2_trace]                                                       | `libssh2.lvlib:libssh2_trace.vi`                      |
| [`libssh2_trace_sethandler`][libssh2_trace_sethandler]                                 | `libssh2.lvlib:libssh2_trace_sethandler.vi`           |
| [`libssh2_userauth_authenticated`][libssh2_userauth_authenticated]                     |                                                       |
| [`libssh2_userauth_banner`][libssh2_userauth_banner]                                   | `libssh2.lvlib:libssh2_userauth_banner.vi`            |
| [`libssh2_userauth_hostbased_fromfile`][libssh2_userauth_hostbased_fromfile]           |                                                       |
| [`libssh2_userauth_hostbased_fromfile_ex`][libssh2_userauth_hostbased_fromfile_ex]     |                                                       |
| [`libssh2_userauth_keyboard_interactive`][libssh2_userauth_keyboard_interactive]       |                                                       |
| [`libssh2_userauth_keyboard_interactive_ex`][libssh2_userauth_keyboard_interactive_ex] |
| [`libssh2_userauth_list`][libssh2_userauth_list]                                       | `libssh2.lvlib:libssh2_userauth_list.vi`              |
| [`libssh2_userauth_password`][libssh2_userauth_password]                               | `libssh2.lvlib:libssh2_userauth_password.vi`          |
| [`libssh2_userauth_password_ex`][libssh2_userauth_password_ex]                         | `libssh2.lvlib:libssh2_userauth_password_ex.vi`       |
| [`libssh2_userauth_publickey`][libssh2_userauth_publickey]                             |
| [`libssh2_userauth_publickey_fromfile`][libssh2_userauth_publickey_fromfile]           |
| [`libssh2_userauth_publickey_fromfile_ex`][libssh2_userauth_publickey_fromfile_ex]     |
| [`libssh2_userauth_publickey_frommemory`][libssh2_userauth_publickey_frommemory]       |
| [`libssh2_userauth_publickey_sk`][libssh2_userauth_publickey_sk]                       |
| [`libssh2_version`][libssh2_version]                                                   | `libssh2.lvlib:libssh2_version.vi`                    |

<!-- Link definitions -->
[libssh2_agent_connect]: https://libssh2.org/libssh2_agent_connect.html
[libssh2_agent_disconnect]: https://libssh2.org/libssh2_agent_disconnect.html
[libssh2_agent_free]: https://libssh2.org/libssh2_agent_free.html
[libssh2_agent_get_identity]: https://libssh2.org/libssh2_agent_get_identity.html
[libssh2_agent_get_identity_path]: https://libssh2.org/libssh2_agent_get_identity_path.html
[libssh2_agent_init]: https://libssh2.org/libssh2_agent_init.html
[libssh2_agent_list_identities]: https://libssh2.org/libssh2_agent_list_identities.html
[libssh2_agent_set_identity_path]: https://libssh2.org/libssh2_agent_set_identity_path.html
[libssh2_agent_sign]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_agent_sign.3
[libssh2_agent_userauth]: https://libssh2.org/libssh2_agent_userauth.html
[libssh2_banner_set]: https://libssh2.org/libssh2_banner_set.html
[libssh2_base64_decode]: https://libssh2.org/libssh2_base64_decode.html
[libssh2_channel_close]: https://libssh2.org/libssh2_channel_close.html
[libssh2_channel_direct_streamlocal_ex]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_channel_direct_streamlocal_ex.3
[libssh2_channel_direct_tcpip]: https://libssh2.org/libssh2_channel_direct_tcpip.html
[libssh2_channel_direct_tcpip_ex]: https://libssh2.org/libssh2_channel_direct_tcpip_ex.html
[libssh2_channel_eof]: https://libssh2.org/libssh2_channel_eof.html
[libssh2_channel_exec]: https://libssh2.org/libssh2_channel_exec.html
[libssh2_channel_flush]: https://libssh2.org/libssh2_channel_flush.html
[libssh2_channel_flush_ex]: https://libssh2.org/libssh2_channel_flush_ex.html
[libssh2_channel_flush_stderr]: https://libssh2.org/libssh2_channel_flush_stderr.html
[libssh2_channel_forward_accept]: https://libssh2.org/libssh2_channel_forward_accept.html
[libssh2_channel_forward_cancel]: https://libssh2.org/libssh2_channel_forward_cancel.html
[libssh2_channel_forward_listen]: https://libssh2.org/libssh2_channel_forward_listen.html
[libssh2_channel_forward_listen_ex]: https://libssh2.org/libssh2_channel_forward_listen_ex.html
[libssh2_channel_free]: https://libssh2.org/libssh2_channel_free.html
[libssh2_channel_get_exit_signal]: https://libssh2.org/libssh2_channel_get_exit_signal.html
[libssh2_channel_get_exit_status]: https://libssh2.org/libssh2_channel_get_exit_status.html
[libssh2_channel_handle_extended_data]: https://libssh2.org/libssh2_channel_handle_extended_data.html
[libssh2_channel_handle_extended_data2]: https://libssh2.org/libssh2_channel_handle_extended_data2.html
[libssh2_channel_ignore_extended_data]: https://libssh2.org/libssh2_channel_ignore_extended_data.html
[libssh2_channel_open_ex]: https://libssh2.org/libssh2_channel_open_ex.html
[libssh2_channel_open_session]: https://libssh2.org/libssh2_channel_open_session.html
[libssh2_channel_process_startup]: https://libssh2.org/libssh2_channel_process_startup.html
[libssh2_channel_read]: https://libssh2.org/libssh2_channel_read.html
[libssh2_channel_read_ex]: https://libssh2.org/libssh2_channel_read_ex.html
[libssh2_channel_read_stderr]: https://libssh2.org/libssh2_channel_read_stderr.html
[libssh2_channel_receive_window_adjust]: https://libssh2.org/libssh2_channel_receive_window_adjust.html
[libssh2_channel_receive_window_adjust2]: https://libssh2.org/libssh2_channel_receive_window_adjust2.html
[libssh2_channel_request_auth_agent]: https://libssh2.org/libssh2_channel_request_auth_agent.html
[libssh2_channel_request_pty]: https://libssh2.org/libssh2_channel_request_pty.html
[libssh2_channel_request_pty_ex]: https://libssh2.org/libssh2_channel_request_pty_ex.html
[libssh2_channel_request_pty_size]: https://libssh2.org/libssh2_channel_request_pty_size.html
[libssh2_channel_request_pty_size_ex]: https://libssh2.org/libssh2_channel_request_pty_size_ex.html
[libssh2_channel_send_eof]: https://libssh2.org/libssh2_channel_send_eof.html
[libssh2_channel_set_blocking]: https://libssh2.org/libssh2_channel_set_blocking.html
[libssh2_channel_setenv]: https://libssh2.org/libssh2_channel_setenv.html
[libssh2_channel_setenv_ex]: https://libssh2.org/libssh2_channel_setenv_ex.html
[libssh2_channel_shell]: https://libssh2.org/libssh2_channel_shell.html
[libssh2_channel_signal_ex]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_channel_signal_ex.3
[libssh2_channel_subsystem]: https://libssh2.org/libssh2_channel_subsystem.html
[libssh2_channel_wait_closed]: https://libssh2.org/libssh2_channel_wait_closed.html
[libssh2_channel_wait_eof]: https://libssh2.org/libssh2_channel_wait_eof.html
[libssh2_channel_window_read]: https://libssh2.org/libssh2_channel_window_read.html
[libssh2_channel_window_read_ex]: https://libssh2.org/libssh2_channel_window_read_ex.html
[libssh2_channel_window_write]: https://libssh2.org/libssh2_channel_window_write.html
[libssh2_channel_window_write_ex]: https://libssh2.org/libssh2_channel_window_write_ex.html
[libssh2_channel_write]: https://libssh2.org/libssh2_channel_write.html
[libssh2_channel_write_ex]: https://libssh2.org/libssh2_channel_write_ex.html
[libssh2_channel_write_stderr]: https://libssh2.org/libssh2_channel_write_stderr.html
[libssh2_channel_x11_req]: https://libssh2.org/libssh2_channel_x11_req.html
[libssh2_channel_x11_req_ex]: https://libssh2.org/libssh2_channel_x11_req_ex.html
[libssh2_crypto_engine]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_crypto_engine.3
[libssh2_exit]: https://libssh2.org/libssh2_exit.html
[libssh2_free]: https://libssh2.org/libssh2_free.html
[libssh2_hostkey_hash]: https://libssh2.org/libssh2_hostkey_hash.html
[libssh2_init]: https://libssh2.org/libssh2_init.html
[libssh2_keepalive_config]: https://libssh2.org/libssh2_keepalive_config.html
[libssh2_keepalive_send]: https://libssh2.org/libssh2_keepalive_send.html
[libssh2_knownhost_add]: https://libssh2.org/libssh2_knownhost_add.html
[libssh2_knownhost_addc]: https://libssh2.org/libssh2_knownhost_addc.html
[libssh2_knownhost_check]: https://libssh2.org/libssh2_knownhost_check.html
[libssh2_knownhost_checkp]: https://libssh2.org/libssh2_knownhost_checkp.html
[libssh2_knownhost_del]: https://libssh2.org/libssh2_knownhost_del.html
[libssh2_knownhost_free]: https://libssh2.org/libssh2_knownhost_free.html
[libssh2_knownhost_get]: https://libssh2.org/libssh2_knownhost_get.html
[libssh2_knownhost_init]: https://libssh2.org/libssh2_knownhost_init.html
[libssh2_knownhost_readfile]: https://libssh2.org/libssh2_knownhost_readfile.html
[libssh2_knownhost_readline]: https://libssh2.org/libssh2_knownhost_readline.html
[libssh2_knownhost_writefile]: https://libssh2.org/libssh2_knownhost_writefile.html
[libssh2_knownhost_writeline]: https://libssh2.org/libssh2_knownhost_writeline.html
[libssh2_poll]: https://libssh2.org/libssh2_poll.html
[libssh2_poll_channel_read]: https://libssh2.org/libssh2_poll_channel_read.html
[libssh2_publickey_add]: https://libssh2.org/libssh2_publickey_add.html
[libssh2_publickey_add_ex]: https://libssh2.org/libssh2_publickey_add_ex.html
[libssh2_publickey_init]: https://libssh2.org/libssh2_publickey_init.html
[libssh2_publickey_list_fetch]: https://libssh2.org/libssh2_publickey_list_fetch.html
[libssh2_publickey_list_free]: https://libssh2.org/libssh2_publickey_list_free.html
[libssh2_publickey_remove]: https://libssh2.org/libssh2_publickey_remove.html
[libssh2_publickey_remove_ex]: https://libssh2.org/libssh2_publickey_remove_ex.html
[libssh2_publickey_shutdown]: https://libssh2.org/libssh2_publickey_shutdown.html
[libssh2_scp_recv]: https://libssh2.org/libssh2_scp_recv.html
[libssh2_scp_recv2]: https://libssh2.org/libssh2_scp_recv2.html
[libssh2_scp_send]: https://libssh2.org/libssh2_scp_send.html
[libssh2_scp_send64]: https://libssh2.org/libssh2_scp_send64.html
[libssh2_scp_send_ex]: https://libssh2.org/libssh2_scp_send_ex.html
[libssh2_session_abstract]: https://libssh2.org/libssh2_session_abstract.html
[libssh2_session_banner_get]: https://libssh2.org/libssh2_session_banner_get.html
[libssh2_session_banner_set]: https://libssh2.org/libssh2_session_banner_set.html
[libssh2_session_block_directions]: https://libssh2.org/libssh2_session_block_directions.html
[libssh2_session_callback_set]: https://libssh2.org/libssh2_session_callback_set.html
[libssh2_session_disconnect]: https://libssh2.org/libssh2_session_disconnect.html
[libssh2_session_disconnect_ex]: https://libssh2.org/libssh2_session_disconnect_ex.html
[libssh2_session_flag]: https://libssh2.org/libssh2_session_flag.html
[libssh2_session_free]: https://libssh2.org/libssh2_session_free.html
[libssh2_session_get_blocking]: https://libssh2.org/libssh2_session_get_blocking.html
[libssh2_session_get_read_timeout]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_session_get_read_timeout.3
[libssh2_session_get_timeout]: https://libssh2.org/libssh2_session_get_timeout.html
[libssh2_session_handshake]: https://libssh2.org/libssh2_session_handshake.html
[libssh2_session_hostkey]: https://libssh2.org/libssh2_session_hostkey.html
[libssh2_session_init]: https://libssh2.org/libssh2_session_init.html
[libssh2_session_init_ex]: https://libssh2.org/libssh2_session_init_ex.html
[libssh2_session_last_errno]: https://libssh2.org/libssh2_session_last_errno.html
[libssh2_session_last_error]: https://libssh2.org/libssh2_session_last_error.html
[libssh2_session_method_pref]: https://libssh2.org/libssh2_session_method_pref.html
[libssh2_session_methods]: https://libssh2.org/libssh2_session_methods.html
[libssh2_session_set_blocking]: https://libssh2.org/libssh2_session_set_blocking.html
[libssh2_session_set_last_error]: https://libssh2.org/libssh2_session_set_last_error.html
[libssh2_session_set_read_timeout]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_session_set_read_timeout.3
[libssh2_session_set_timeout]: https://libssh2.org/libssh2_session_set_timeout.html
[libssh2_session_startup]: https://libssh2.org/libssh2_session_startup.html
[libssh2_session_supported_algs]: https://libssh2.org/libssh2_session_supported_algs.html
[libssh2_sftp_close]: https://libssh2.org/libssh2_sftp_close.html
[libssh2_sftp_close_handle]: https://libssh2.org/libssh2_sftp_close_handle.html
[libssh2_sftp_closedir]: https://libssh2.org/libssh2_sftp_closedir.html
[libssh2_sftp_fsetstat]: https://libssh2.org/libssh2_sftp_fsetstat.html
[libssh2_sftp_fstat]: https://libssh2.org/libssh2_sftp_fstat.html
[libssh2_sftp_fstat_ex]: https://libssh2.org/libssh2_sftp_fstat_ex.html
[libssh2_sftp_fstatvfs]: https://libssh2.org/libssh2_sftp_fstatvfs.html
[libssh2_sftp_fsync]: https://libssh2.org/libssh2_sftp_fsync.html
[libssh2_sftp_get_channel]: https://libssh2.org/libssh2_sftp_get_channel.html
[libssh2_sftp_init]: https://libssh2.org/libssh2_sftp_init.html
[libssh2_sftp_last_error]: https://libssh2.org/libssh2_sftp_last_error.html
[libssh2_sftp_lstat]: https://libssh2.org/libssh2_sftp_lstat.html
[libssh2_sftp_mkdir]: https://libssh2.org/libssh2_sftp_mkdir.html
[libssh2_sftp_mkdir_ex]: https://libssh2.org/libssh2_sftp_mkdir_ex.html
[libssh2_sftp_open]: https://libssh2.org/libssh2_sftp_open.html
[libssh2_sftp_open_ex]: https://libssh2.org/libssh2_sftp_open_ex.html
[libssh2_sftp_open_ex_r]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_sftp_open_ex_r.3
[libssh2_sftp_open_r]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_sftp_open_r.3
[libssh2_sftp_opendir]: https://libssh2.org/libssh2_sftp_opendir.html
[libssh2_sftp_read]: https://libssh2.org/libssh2_sftp_read.html
[libssh2_sftp_readdir]: https://libssh2.org/libssh2_sftp_readdir.html
[libssh2_sftp_readdir_ex]: https://libssh2.org/libssh2_sftp_readdir_ex.html
[libssh2_sftp_readlink]: https://libssh2.org/libssh2_sftp_readlink.html
[libssh2_sftp_realpath]: https://libssh2.org/libssh2_sftp_realpath.html
[libssh2_sftp_rename]: https://libssh2.org/libssh2_sftp_rename.html
[libssh2_sftp_rename_ex]: https://libssh2.org/libssh2_sftp_rename_ex.html
[libssh2_sftp_rewind]: https://libssh2.org/libssh2_sftp_rewind.html
[libssh2_sftp_rmdir]: https://libssh2.org/libssh2_sftp_rmdir.html
[libssh2_sftp_rmdir_ex]: https://libssh2.org/libssh2_sftp_rmdir_ex.html
[libssh2_sftp_seek]: https://libssh2.org/libssh2_sftp_seek.html
[libssh2_sftp_seek64]: https://libssh2.org/libssh2_sftp_seek64.html
[libssh2_sftp_setstat]: https://libssh2.org/libssh2_sftp_setstat.html
[libssh2_sftp_shutdown]: https://libssh2.org/libssh2_sftp_shutdown.html
[libssh2_sftp_stat]: https://libssh2.org/libssh2_sftp_stat.html
[libssh2_sftp_stat_ex]: https://libssh2.org/libssh2_sftp_stat_ex.html
[libssh2_sftp_statvfs]: https://libssh2.org/libssh2_sftp_statvfs.html
[libssh2_sftp_symlink]: https://libssh2.org/libssh2_sftp_symlink.html
[libssh2_sftp_symlink_ex]: https://libssh2.org/libssh2_sftp_symlink_ex.html
[libssh2_sftp_tell]: https://libssh2.org/libssh2_sftp_tell.html
[libssh2_sftp_tell64]: https://libssh2.org/libssh2_sftp_tell64.html
[libssh2_sftp_unlink]: https://libssh2.org/libssh2_sftp_unlink.html
[libssh2_sftp_unlink_ex]: https://libssh2.org/libssh2_sftp_unlink_ex.html
[libssh2_sftp_write]: https://libssh2.org/libssh2_sftp_write.html
[libssh2_sign_sk]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_sign_sk.3
[libssh2_trace]: https://libssh2.org/libssh2_trace.html
[libssh2_trace_sethandler]: https://libssh2.org/libssh2_trace_sethandler.html
[libssh2_userauth_authenticated]: https://libssh2.org/libssh2_userauth_authenticated.html
[libssh2_userauth_banner]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_userauth_banner.3
[libssh2_userauth_hostbased_fromfile]: https://libssh2.org/libssh2_userauth_hostbased_fromfile.html
[libssh2_userauth_hostbased_fromfile_ex]: https://libssh2.org/libssh2_userauth_hostbased_fromfile_ex.html
[libssh2_userauth_keyboard_interactive]: https://libssh2.org/libssh2_userauth_keyboard_interactive.html
[libssh2_userauth_keyboard_interactive_ex]: https://libssh2.org/libssh2_userauth_keyboard_interactive_ex.html
[libssh2_userauth_list]: https://libssh2.org/libssh2_userauth_list.html
[libssh2_userauth_password]: https://libssh2.org/libssh2_userauth_password.html
[libssh2_userauth_password_ex]: https://libssh2.org/libssh2_userauth_password_ex.html
[libssh2_userauth_publickey]: https://libssh2.org/libssh2_userauth_publickey.html
[libssh2_userauth_publickey_fromfile]: https://libssh2.org/libssh2_userauth_publickey_fromfile.html
[libssh2_userauth_publickey_fromfile_ex]: https://libssh2.org/libssh2_userauth_publickey_fromfile_ex.html
[libssh2_userauth_publickey_frommemory]: https://libssh2.org/libssh2_userauth_publickey_frommemory.html
[libssh2_userauth_publickey_sk]: https://github.com/libssh2/libssh2/blob/master/docs/libssh2_userauth_publickey_sk.3
[libssh2_version]: https://libssh2.org/libssh2_version.html
