# Build instructions for libssh2

> [!NOTE]
> This document is based on the official [libssh2 build instructions](https://github.com/libssh2/libssh2/blob/master/docs/INSTALL_CMAKE.md).
> When in doubt, please refer to the original document.

## Build libssh2 on Windows

### Prerequisites

- Visual Studio 2022 or later
  - Make sure to install the "Desktop development with C++" workload, which includes the MSVC compiler and CMake.

### Build instructions

1. Clone the libssh2 repository:

   ```sh
   git clone https://github.com/libssh2/libssh2.git
   ```

> [!IMPORTANT]
> The following commands must be executed in the Visual Studio Developer Command Prompt.

2. Configure the build:

   ```sh
    cd libssh2
    cmake -B build -S . -G "Visual Studio 17 2022" -A Win32
    ```

    Replace `Visual Studio 17 2022` with the appropriate generator for your version of Visual Studio.

    Use `-A x64` instead of `-A Win32` for 64-bit builds.

3. Build the library:

    ```sh
    cmake --build build --config Release
    ```

    Replace `Release` with `Debug` for a debug build.

4. Install the library:

    To install the library, copy `libssh2.dll` from the `build/src/Release` directory to [/libssh2/](/libssh2/).

    For 64-bit builds, rename `libssh2.dll` to `libssh2_64.dll`.

> [!TIP]
> You can place both, 32-bit and 64-bit versions, in the same directory.
> The library path for libssh2 is configured as `libssh2**.*`, which resolves to the appropriate version based on the platform and bitness.
> For example, `libssh2.dll` for 32-bit builds and `libssh2_64.dll` for 64-bit builds on Windows. On Linux, the library is named `libssh2.so` and `libssh2_64.so`, respectively.
> See [Configuring the Call Library Function Node](https://www.ni.com/docs/en-US/bundle/labview/page/configuring-the-call-library-function-node.html) for more information.
