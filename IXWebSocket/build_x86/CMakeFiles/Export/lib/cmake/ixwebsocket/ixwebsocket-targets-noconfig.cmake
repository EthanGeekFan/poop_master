#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ixwebsocket::ixwebsocket" for configuration ""
set_property(TARGET ixwebsocket::ixwebsocket APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(ixwebsocket::ixwebsocket PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libixwebsocket.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS ixwebsocket::ixwebsocket )
list(APPEND _IMPORT_CHECK_FILES_FOR_ixwebsocket::ixwebsocket "${_IMPORT_PREFIX}/lib/libixwebsocket.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
