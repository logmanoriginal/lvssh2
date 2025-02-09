_TLDR;_ -- Run the following commands from the root of the repository:
```bash
cmake -B build/Win32 -S . -G "Visual Studio 17 2022" -A Win32
cmake -B build/x64 -S . -G "Visual Studio 17 2022" -A x64
cmake --build build/Win32 --config Release
cmake --build build/x64 --config Release
```

---

# CMake Build Instructions
This project uses CMake to build shared libraries needed for lvssh2. This includes an extensions library that provides additional functionality that cannot otherwise be implemented in LabVIEW and libssh2, which is at the core of the project.

The CMake files are configured to place the output libraries in the correct location. This way, you can build the libraries and immediately use them in the LabVIEW project without having to manually copy them.

> [!IMPORTANT]
> You must close the project in LabVIEW before building the libraries. Otherwise, the build process will fail because LabVIEW locks the files.

## Prerequisites

- CMake 3.18 or later (it is typically best to install the latest version)
- Windows:
    - Visual Studio 2022 or later
        - Make sure to install the "Desktop development with C++" workload, which includes the MSVC compiler and CMake.

> [!IMPORTANT]
> To build the libraries, both 32 and 64-bit versions of LabVIEW must be installed on the system.

## Build Instructions

Run the following commands from the root of the repository:

```bash
# 1. Configure the build
# -B: specifies the build directory
# -S: specifies the source directory
# -G: specifies the generator (Visual Studio 17 2022 in this case)
# -A: specifies the architecture (Win32 or x64)
cmake -B build -S . -G "Visual Studio 17 2022" -A Win32

# 2. Build the libraries
# "build" is the build directory
# --config Release: specifies the build configuration (Release or Debug)
cmake --build build --config Release
```

This will build the libraries and place them in the appropriate directories for the LabVIEW project. The file names are as follows:

- 32-bit:
    - `libssh2_extensions.dll` (Windows) or `libssh2_extensions.so` (Linux)
    - `libssh2.dll` (Windows) or `libssh2.so` (Linux)
    - `libssl-3.dll` (Windows, OpenSSL)
    - `libcrypto-3.dll` (Windows, OpenSSL)
- 64-bit:
    - `libssh2_extensions_64.dll` (Windows) or `libssh2_extensions_64.so` (Linux)
    - `libssh2_64.dll` (Windows) or `libssh2_64.so` (Linux)
    - `libssl-3-64.dll` (Windows, OpenSSL)
    - `libcrypto-3-64.dll` (Windows, OpenSSL)

> [!TIP]
> Both 32-bit and 64-bit libraries can coexist in the same directory. LabVIEW will automatically choose the appropriate library based on the bitness of LabVIEW. See [Configuring the Call Library Function Node](https://www.ni.com/docs/en-US/bundle/labview/page/configuring-the-call-library-function-node.html) for more information.

## Options
These options provide additional customization of the build process. They can be set using the `-D` flag when running `cmake`.

| Option | Description |
| ------ | ----------- |
| `LIBSSH2_SOURCE` | Source of the libssh2 library. Available options are: "GitHub" and "Tarball". Default is "GitHub". |
| `LIBSSH2_COMMIT_HASH` | Requires `LIBSSH2_SOURCE=GitHub`.<br><br> Commit hash of the libssh2 repository. Also accepts branch names and tags. The use of commit hashes is **strongly recommended** to avoid pulling malicious code. |
| `LIBSSH2_URL` | Requires `LIBSSH2_SOURCE=Tarball`.<br><br> URL of the libssh2 tarball. See https://libssh2.org/ |
| `LIBSSH2_URL_SIG` | Requires `LIBSSH2_SOURCE=Tarball`.<br><br> URL of the libssh2 tarball signature. The public key used to verify the signature must be available on the system prior to building. |
| `CRYPTO_BACKEND` | Crypto backend to use. Available options are: "OpenSSL" and "WinCNG". Default is "OpenSSL". |
| `OPENSSL_COMMIT_HASH` | Requires `CRYPTO_BACKEND=OpenSSL`.<br><br> Commit hash of the OpenSSL repository. Also accepts branch names and tags. The use of commit hashes is **strongly recommended** to avoid pulling malicious code. |
