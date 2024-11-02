cmake_minimum_required(VERSION 3.18)
project(lvssh2_extensions C)

# Suppress "lib" prefix on libraries
set(CMAKE_SHARED_LIBRARY_PREFIX "")

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_EXTENSIONS OFF)

set(
  LIBSSH2_SOURCE "GitHub"
  CACHE STRING "Source of the libssh2 library."
)
set_property(CACHE LIBSSH2_SOURCE PROPERTY STRINGS "GitHub" "Tarball")

set(
  LIBSSH2_COMMIT_HASH "a312b43325e3383c865a87bb1d26cb52e3292641"
  CACHE STRING "Commit hash of the libssh2 repository. Also accepts branch names and tags. The use of commit hashes is strongly recommended to avoid pulling malicious code. Only used when LIBSSH2_SOURCE is GitHub."
)

set(
  LIBSSH2_URL "https://libssh2.org/download/libssh2-1.11.1.tar.gz"
  CACHE STRING "URL of the libssh2 tarball. Only used when LIBSSH2_SOURCE is Tarball."
)

set(
  LIBSSH2_URL_SIG "https://libssh2.org/download/libssh2-1.11.1.tar.gz.asc"
  CACHE STRING "URL of the libssh2 tarball PGP signature. Only used when LIBSSH2_SOURCE is Tarball."
)

# Set output directory to libssh2
# $<1:...> is used to prevent Visual Studio from appending a configuration name to the output directory
#          see: https://discourse.cmake.org/t/changing-output-directories/8829/2
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "$<1:${CMAKE_SOURCE_DIR}/libssh2>")

# Determine if the build is 32-bit or 64-bit
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(OUTPUT_NAME_SUFFIX "_64") # Append "_64" to the output name for 64-bit builds
else()
  set(OUTPUT_NAME_SUFFIX "") # No suffix for 32-bit builds
endif()

# Get libssh2 source code
include(FetchContent)

if(${LIBSSH2_SOURCE} STREQUAL "GitHub")
  FetchContent_Declare(
    libssh2
    GIT_REPOSITORY https://github.com/libssh2/libssh2.git
    GIT_TAG ${LIBSSH2_COMMIT_HASH}
    SOURCE_SUBDIR include
  )
elseif(${LIBSSH2_SOURCE} STREQUAL "Tarball")
  # Download the tarball and its PGP signature
  file(DOWNLOAD ${LIBSSH2_URL} ${CMAKE_BINARY_DIR}/libssh2.tar.gz)
  file(DOWNLOAD ${LIBSSH2_URL_SIG} ${CMAKE_BINARY_DIR}/libssh2.tar.gz.sig)

  # Verify the PGP signature
  execute_process(
    COMMAND gpg --verify ${CMAKE_BINARY_DIR}/libssh2.tar.gz.sig ${CMAKE_BINARY_DIR}/libssh2.tar.gz
    RESULT_VARIABLE GPG_RESULT
    OUTPUT_VARIABLE GPG_OUTPUT
    ERROR_VARIABLE GPG_ERROR
  )

  if(NOT GPG_RESULT EQUAL 0)
    message(FATAL_ERROR "PGP signature verification failed: ${GPG_ERROR}")
  else()
    message(STATUS "PGP signature verification succeeded.")
  endif()

  # Use the verified tarball
  FetchContent_Declare(
    libssh2
    URL file://${CMAKE_BINARY_DIR}/libssh2.tar.gz
    SOURCE_SUBDIR include
    DOWNLOAD_EXTRACT_TIMESTAMP ON
  )
else()
  message(FATAL_ERROR "Invalid value for LIBSSH2_SOURCE: ${LIBSSH2_SOURCE}")
endif()

FetchContent_MakeAvailable(libssh2)
FetchContent_GetProperties(libssh2)

# Set LabVIEW base path based on the platform
if(CMAKE_HOST_WIN32)
  message(STATUS "Windows build")
  if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(LABVIEW_BASE_PATH "C:/Program Files/National Instruments")
  else()
    # SAFESH:NO is required to prevent linker errors when building with Visual Studio
    add_link_options(/SAFESEH:NO)
    set(LABVIEW_BASE_PATH "C:/Program Files (x86)/National Instruments")
  endif()
else()
  message(FATAL_ERROR "Unsupported platform")
endif()

# Generate list of CINTOOLS directories
set(LABVIEW_PATHS "")
string(TIMESTAMP CURRENT_YEAR "%Y")
foreach(YEAR RANGE 2013 ${CURRENT_YEAR})
  list(APPEND LABVIEW_PATHS "${LABVIEW_BASE_PATH}/LabVIEW ${YEAR}/cintools")
endforeach()

# Find the first existing CINTOOLS directory
find_path(LABVIEW_CINTOOLS_DIR
  NAMES "extcode.h" "labview.lib"
  PATHS ${LABVIEW_PATHS}
  NO_DEFAULT_PATH
)

if(NOT LABVIEW_CINTOOLS_DIR)
  message(FATAL_ERROR "LabVIEW C Interface Tools not found")
else()
  message(STATUS "LabVIEW C Interface Tools found at ${LABVIEW_CINTOOLS_DIR}")
endif()

add_subdirectory(extensions)

target_link_libraries(${PROJECT_NAME} "${LABVIEW_CINTOOLS_DIR}/labview.lib")

set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME "${PROJECT_NAME}${OUTPUT_NAME_SUFFIX}"
)

include(ExternalProject)

ExternalProject_Add(
  libssh2
  SOURCE_DIR ${libssh2_SOURCE_DIR}
  CMAKE_ARGS
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE=$<1:${CMAKE_BINARY_DIR}>
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG=$<1:${CMAKE_BINARY_DIR}>
    -DBUILD_STATIC_LIBS=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_TESTING=OFF
    -DLIBSSH2_NO_DEPRECATED=ON
    -DENABLE_ECDSA_WINCNG=ON
  INSTALL_COMMAND ""
)

# Custom command to rename the DLL
add_custom_command(
  TARGET libssh2
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E rename
    ${CMAKE_BINARY_DIR}/libssh2${CMAKE_SHARED_LIBRARY_SUFFIX}
    ${CMAKE_BINARY_DIR}/libssh2${OUTPUT_NAME_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}
  COMMENT "Renaming libssh2${CMAKE_SHARED_LIBRARY_SUFFIX} to libssh2${OUTPUT_NAME_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}"
)

# Custom command to move the DLL to the libssh2 directory
add_custom_command(
  TARGET libssh2
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy
    ${CMAKE_BINARY_DIR}/libssh2${OUTPUT_NAME_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX}
    ${CMAKE_SOURCE_DIR}/libssh2
  COMMENT "Copying libssh2${OUTPUT_NAME_SUFFIX}${CMAKE_SHARED_LIBRARY_SUFFIX} to libssh2 directory"
)