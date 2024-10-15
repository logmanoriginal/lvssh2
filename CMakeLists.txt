cmake_minimum_required(VERSION 3.18)
project(lvssh2_extensions C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED YES)
set(CMAKE_C_EXTENSIONS OFF)

# Determine if the build is 32-bit or 64-bit
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
  set(OUTPUT_NAME_SUFFIX "_64") # Append "_64" to the output name for 64-bit builds
else()
  set(OUTPUT_NAME_SUFFIX "") # No suffix for 32-bit builds
endif()

add_subdirectory(extensions)

target_link_libraries(${PROJECT_NAME} ${LABVIEW_CINTOOLS_DIR}/labview.lib)

set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME "${PROJECT_NAME}${OUTPUT_NAME_SUFFIX}"
)
