# This script builds the project for different OS types.
# It supports Windows (msys) and Linux (linux-gnu).
# Options:
#   - build.sh [Release|Debug] [OpenSSL|WinCNG]

build_type=${1:-Release}
crypto_backend=${2:-OpenSSL}

if [[ "$OSTYPE" == "msys"* ]]; then
    generator="Visual Studio 17 2022"
    build_archs=("Win32" "x64")
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    generator="Unix Makefiles"
    build_archs=("x64")
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

for arch in "${build_archs[@]}"; do
    echo "Building $arch..."
    cmake_cmd="cmake -B build/$arch -S . -G \"$generator\""

    if [[ "$generator" == "Visual Studio 17 2022" ]]; then
        cmake_cmd+=" -A \"$arch\""
    fi

    if [[ "$build_type" == "Release" ]]; then
        cmake_cmd+=" -DLIBSSH2_SOURCE=Tarball"
        cmake_cmd+=" -DLIBSSH2_URL=https://libssh2.org/download/libssh2-1.11.1.tar.gz"
        cmake_cmd+=" -DLIBSSH2_URL_SIG=https://libssh2.org/download/libssh2-1.11.1.tar.gz.asc"
    else
        cmake_cmd+=" -DCMAKE_BUILD_TYPE=Debug"
        cmake_cmd+=" -DLIBSSH2_SOURCE=GitHub"
        cmake_cmd+=" -DLIBSSH2_COMMIT_HASH=a312b43325e3383c865a87bb1d26cb52e3292641"
    fi

    cmake_cmd+=" -DCRYPTO_BACKEND=$crypto_backend"

    if [[ "$crypto_backend" == "OpenSSL" ]]; then
        cmake_cmd+=" -DOPENSSL_COMMIT_HASH=a26d85337dbdcd33c971f38eb3fa5150e75cea87"
    fi

    eval $cmake_cmd
    cmake --build "build/$arch" --config $build_type
done
