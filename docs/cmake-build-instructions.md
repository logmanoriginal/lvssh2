# CMake Build Instructions
This project uses CMake to build shared libraries, including:
- [libssh2](https://github.com/libssh2/libssh2)
- [openssl](https://github.com/openssl/openssl)
- `lvssh2_extensions` - a custom extensions library for functionality that cannot otherwise be implemented in LabVIEW.

## Prerequisites

- LabVIEW 2017 or later (both 32-bit and 64-bit installations)
- CMake 4.2 or later (it is typically best to install the latest version)
- Windows:
    - Visual Studio 2026
        - Make sure to install the "Desktop development with C++" workload, which includes the MSVC compiler and CMake.
- Strawberry Perl (needed for OpenSSL configuration steps)

The following Perl modules are required for OpenSSL builds:

| Module | Windows | Linux |
| ------ | ------- | ----- |
| `Locale:Maketext:Simple` | `cpan Locale:Maketext:Simple` | `sudo apt install liblocale-maketext-simple-perl` |

> [!IMPORTANT]
> If you are running Git for Windows, follow these steps:
> - Add CMake & Strawberry Perl to `$PATH` inside Git Bash:<br> Write `export PATH="/c/Program Files/CMake/bin:/c/Strawberry/perl/bin:$PATH` into `~/.bashrc`.
> - Check if the right versions of cmake & perl are used:<br> `which cmake perl`<br> Expected:<br> `/c/Program Files/CMake/bin/cmake`<br>
`/c/Strawberry/perl/bin/perl`

## Build Instructions

> [!IMPORTANT]
> Close LabVIEW before building the libraries.

You can either run the default build script or write custom build instructions.

### Default Build Script

The repository comes with a default build script, which is also used for regular release builds. It compiles both 32-bit and 64-bit libraries and defaults to `Release` + `OpenSSL` with specific release versions of OpenSSL and libssh2.

```bash
# Options:
#   build.sh [Release|Debug] [OpenSSL|WinCNG]
./build.sh
```

### Custom Build Instructions

Use this method if you require more control over the build process. It runs in two stages: configure & build. Find below a table of additional options.

```bash
# Stage 1: Configure the build
# -B: specifies the build directory (typically "/build")
# -S: specifies the source directory (the repository root "./")
# -G: specifies the generator ("Visual Studio 18 2026" in this case)
# -A: specifies the architecture (Win32 or x64)
cmake -B build -S . -G "Visual Studio 18 2026" -A Win32

# Stage 2: Build the libraries
# "build" is the build directory specified previously
# --config Release: specifies the build configuration (Release or Debug)
cmake --build build --config Release
```

#### Custom Build Options
These options provide additional customization of the build process. They can be set at the configuration stage (first stage), using the `-D` flag (e.g., `-DLIBSSH2_SOURCE=Tarball`).

| Option | Description |
| ------ | ----------- |
| `LIBSSH2_SOURCE` | Source of the libssh2 library. Available options are: "GitHub" and "Tarball". Default is "GitHub". |
| `LIBSSH2_COMMIT_HASH` | Requires `LIBSSH2_SOURCE=GitHub`.<br><br> Commit hash of the libssh2 repository. Also accepts branch names and tags. The use of commit hashes is **strongly recommended** to avoid pulling malicious code. |
| `LIBSSH2_URL` | Requires `LIBSSH2_SOURCE=Tarball`.<br><br> URL of the libssh2 tarball. See https://libssh2.org/ |
| `LIBSSH2_URL_SIG` | Requires `LIBSSH2_SOURCE=Tarball`.<br><br> URL of the libssh2 tarball signature. The public key used to verify the signature must be available on the system prior to building. |
| `CRYPTO_BACKEND` | Crypto backend to use. Available options are: "OpenSSL" and "WinCNG". Default is "OpenSSL". |
| `OPENSSL_COMMIT_HASH` | Requires `CRYPTO_BACKEND=OpenSSL`.<br><br> Commit hash of the OpenSSL repository. Also accepts branch names and tags. The use of commit hashes is **strongly recommended** to avoid pulling malicious code. |
| `LVSSH2_ENABLE_UNSAFESEH_WIN32` | Win32-only compatibility toggle for `/SAFESEH:NO`. Default is `OFF` (secure default using `/SAFESEH`). Enable only when your toolchain cannot link with `/SAFESEH`. |
| `LIBSSH2_ENABLE_DEBUG_LOGGING` | Build libssh2 with debug trace logging (libssh2_trace). Default is `OFF`. |

### Build Output

The build process automatically places all libraries in the appropriate directories:

- 32-bit:
    - `libssh2/libssh2_extensions.dll` (Windows) or `libssh2/libssh2_extensions.so` (Linux)
    - `libssh2/libssh2.dll` (Windows) or `libssh2/libssh2.so` (Linux)
    - `libssh2/libssl-4.dll` (Windows, OpenSSL)
    - `libssh2/libcrypto-4.dll` (Windows, OpenSSL)
- 64-bit:
    - `libssh2/libssh2_extensions_64.dll` (Windows) or `libssh2/libssh2_extensions_64.so` (Linux)
    - `libssh2/libssh2_64.dll` (Windows) or `libssh2/libssh2_64.so` (Linux)
    - `libssh2/libssl-4-64.dll` (Windows, OpenSSL)
    - `libssh2/libcrypto-4-64.dll` (Windows, OpenSSL)

> [!TIP]
> Both 32-bit and 64-bit libraries can coexist in the same directory. LabVIEW will automatically choose the appropriate library based on the bitness of LabVIEW. See [Configuring the Call Library Function Node](https://www.ni.com/docs/en-US/bundle/labview/page/configuring-the-call-library-function-node.html) for more information.
