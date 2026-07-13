add_library(${PROJECT_NAME} SHARED
  lvssh2_extensions.c
  lvssh2_extensions.h
)
set_property(TARGET ${PROJECT_NAME} PROPERTY C_VISIBILITY_PRESET hidden)

# The completion rendezvous uses C11 <threads.h>, which glibc implements on top
# of pthreads (a separate library before glibc 2.34)
find_package(Threads REQUIRED)
target_link_libraries(${PROJECT_NAME} Threads::Threads)

include_directories("${LABVIEW_CINTOOLS_DIR}")
include_directories("${libssh2_SOURCE_DIR}/include")
