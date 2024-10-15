This folder contains the source files for the extensions library.

## Build Instructions
To build the extensions library, run the following commands from the root of the repository:

```bash
cmake -B build -S . -G "Visual Studio 17 2022" -A Win32
cmake --build build --config Release
```

This will produce a 32-bit static library named `lvssh2_extensions` in the build directory.

Replace `-G "Visual Studio 17 2022"` with the appropriate generator for your version of Visual Studio.

Use `-A x64` instead of `-A Win32` for 64-bit builds.

Replace `--config Release` with `--config Debug` for debug builds.

> [!IMPORTANT]
> When building the extensions library with debugging enabled, libssh2 must also be built with debugging enabled.
