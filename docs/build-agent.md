Following software must be installed on the build agent:

- CMake 3.18 or later
- Visual Studio 2022 or later
- LabVIEW 2017 or later
- Strawberry Perl (for building OpenSSL)
- NASM (for building OpenSSL)

The `VIPM API` and `JKI State Machine` VI packages must be installed manually.

```ps1
winget install Kitware.CMake --source winget
winget install StrawberryPerl.StrawberryPerl --source winget
winget install NASM.NASM --source winget
```

Add NASM to the user PATH environment variable (`%USERPROFILE%\AppData\Local\bin\NASM`).

Move the environment variable for Strawberry Perl to the top of the system PATH environment variable (must occur before any other Perl installations, like git-scm).
