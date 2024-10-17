cmake_minimum_required(VERSION 3.18)
project(lvssh2_extensions C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_EXTENSIONS OFF)

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

FetchContent_Declare(
  libssh2
  GIT_REPOSITORY https://github.com/libssh2/libssh2.git
  GIT_TAG libssh2-1.11.0
  SOURCE_SUBDIR include
)

FetchContent_MakeAvailable(libssh2)

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
  GIT_REPOSITORY https://github.com/libssh2/libssh2.git
  GIT_TAG libssh2-1.11.0
  CMAKE_ARGS
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE=$<1:${CMAKE_BINARY_DIR}>
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG=$<1:${CMAKE_BINARY_DIR}>
    -DBUILD_STATIC_LIBS=OFF
    -DBUILD_EXAMPLES=OFF
    -DBUILD_TESTING=OFF
  INSTALL_COMMAND ""
)

# Custom command to rename the DLL
add_custom_command(
  TARGET libssh2
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E rename
    ${CMAKE_BINARY_DIR}/libssh2.dll
    ${CMAKE_BINARY_DIR}/libssh2${OUTPUT_NAME_SUFFIX}.dll
  COMMENT "Renaming libssh2.dll to libssh2${OUTPUT_NAME_SUFFIX}.dll"
)

# Custom command to move the DLL to the libssh2 directory
add_custom_command(
  TARGET libssh2
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy
    ${CMAKE_BINARY_DIR}/libssh2${OUTPUT_NAME_SUFFIX}.dll
    ${CMAKE_SOURCE_DIR}/libssh2
  COMMENT "Copying libssh2${OUTPUT_NAME_SUFFIX}.dll to libssh2 directory"
)