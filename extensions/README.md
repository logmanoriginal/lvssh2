This folder contains the source files for the extensions library.

## Build Instructions
To build the extensions library, run the following commands from the root of the repository:

```bash
mkdir build
cd build
cmake ../extensions
cmake --build . --config MinSizeRel
```

Configurations:
- `Release`: Build the library with optimizations enabled.
- `Debug`: Build the library with debugging information enabled.
- `MinSizeRel`: Build the library with optimizations for size enabled.
- `RelWithDebInfo`: Build the library with optimizations enabled and debugging information enabled.

> [!IMPORTANT]
> When building the extensions library with debugging enabled, libssh2 must also be built with debugging enabled.

The build will produce a static library named `lvssh2_extensions` (or `lvssh2_extensions_64` on 64-bit systems). These files must be copied to the `libssh2` folder.
