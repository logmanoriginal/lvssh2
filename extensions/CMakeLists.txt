add_library(${PROJECT_NAME} SHARED
  lvssh2_extensions.c
  lvssh2_extensions.h
)
set_property(TARGET ${PROJECT_NAME} PROPERTY C_VISIBILITY_PRESET hidden)

include_directories("${LABVIEW_CINTOOLS_DIR}")
include_directories("${libssh2_SOURCE_DIR}/include")
