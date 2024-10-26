cmake -B build/x86 -S . -G "Visual Studio 17 2022" -A Win32 -DLIBSSH2_SOURCE=Tarball -DLIBSSH2_URL=https://libssh2.org/download/libssh2-1.11.1.tar.gz -DLIBSSH2_URL_SIG=https://libssh2.org/download/libssh2-1.11.1.tar.gz.asc

cmake -B build/x64 -S . -G "Visual Studio 17 2022" -A x64 -DLIBSSH2_SOURCE=Tarball -DLIBSSH2_URL=https://libssh2.org/download/libssh2-1.11.1.tar.gz -DLIBSSH2_URL_SIG=https://libssh2.org/download/libssh2-1.11.1.tar.gz.asc

cmake --build build/x86 --config Release

cmake --build build/x64 --config Release
