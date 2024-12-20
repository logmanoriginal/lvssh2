# This script builds the project for different OS types.
# It supports Windows (msys) and Linux (linux-gnu).
# Options:
#   - build.sh [Release|Debug]

build_type=${1:-Release}

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
        cmake_cmd+=" -DLIBSSH2_SOURCE=GitHub"
        cmake_cmd+=" -DLIBSSH2_COMMIT_HASH=libssh2-1.11.1"

    fi

    eval $cmake_cmd
    cmake --build "build/$arch" --config $build_type
done
