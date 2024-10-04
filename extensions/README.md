This folder contains the source files for `lvssh2_extensions.dll`.

`lvssh2_extensions.dll` is written in C using Visual Studio 2022.

You may need to add `<LabVIEW>/cintools` to your include path in order to compile the project (required for "extcode.h"). The version and bitness of LabVIEW doesn't matter.

After building the solution, copy `lvssh2_extensions.dll` to `libssh2` under root.
