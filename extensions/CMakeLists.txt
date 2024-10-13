cmake_minimum_required(VERSION 3.18)
project(lvssh2_extensions C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_EXTENSIONS OFF)

# Get libssh2 source code
include(FetchContent)

FetchContent_Declare(
  libssh2
  GIT_REPOSITORY https://github.com/libssh2/libssh2.git
  GIT_TAG libssh2-1.11.0
  SOURCE_SUBDIR include
)

FetchContent_MakeAvailable(libssh2)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  message(STATUS "64-bit build")
  set(OUTPUT_NAME_SUFFIX "_64") # Append "_64" to the output name for 64-bit builds
  if(CMAKE_HOST_WIN32)
    message(STATUS "Windows build")
    set(LABVIEW_BASE_PATH "C:/Program Files/National Instruments")
  else()
    message(FATAL_ERROR "Unsupported platform")
  endif()
else()
  message(STATUS "32-bit build")
  set(OUTPUT_NAME_SUFFIX "") # No suffix for 32-bit builds
  if(CMAKE_HOST_WIN32)
    message(STATUS "Windows build")
    # SAFESH:NO is required to prevent linker errors when building with Visual Studio
    add_link_options(/SAFESEH:NO)
    set(LABVIEW_BASE_PATH "C:/Program Files (x86)/National Instruments")
  else()
    message(FATAL_ERROR "Unsupported platform")
  endif()
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

add_library(${PROJECT_NAME} SHARED
  lvssh2_extensions.c
  lvssh2_extensions.h
)

include_directories(${LABVIEW_CINTOOLS_DIR})
include_directories(${libssh2_SOURCE_DIR}/include)

target_link_libraries(${PROJECT_NAME} ${LABVIEW_CINTOOLS_DIR}/labview.lib)

set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME "${PROJECT_NAME}${OUTPUT_NAME_SUFFIX}"
)