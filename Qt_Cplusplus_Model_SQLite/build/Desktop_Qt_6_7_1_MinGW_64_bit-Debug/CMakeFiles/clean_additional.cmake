# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appQt_Cplusplus_Model_SQLite_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appQt_Cplusplus_Model_SQLite_autogen.dir\\ParseCache.txt"
  "appQt_Cplusplus_Model_SQLite_autogen"
  )
endif()
