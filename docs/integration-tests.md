# Integration Tests

Integration tests start a local SSH server and run tests against it. The server is not included in the repository and must be installed separately.

In order to login to the server, you must configure a user name in the `LVSSH2_SSH_USER` environment variable. The password is empty.

# Install OpenSSH Server on Windows

**64-bit**: Use the [OpenSSH server](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) that comes with Windows 10 and later.

**32-bit**: Use [Git for Windows](https://git-scm.com/download/win) which includes a 32-bit version of the OpenSSH server. After installation, add the `bin` directory (`C:\Program Files\Git\usr\bin`) to the system `PATH` environment variable. This also works for 64-bit LabVIEW installations.