cmake_minimum_required(VERSION 3.16)

project(Qt_Cplusplus_Model_SQLite VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Find necessary Qt modules
find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Sql)

# Set up the project with standard Qt configuration
qt_standard_project_setup(REQUIRES 6.5)

# Add the executable, including both source and header files
qt_add_executable(appQt_Cplusplus_Model_SQLite
    main.cpp
    DatabaseManager.cpp
    CustomSqlQueryModel.cpp
    DatabaseManager.h
    CustomSqlQueryModel.h
)

# Add QML module
qt_add_qml_module(appQt_Cplusplus_Model_SQLite
    URI Qt_Cplusplus_Model_SQLite
    VERSION 1.0
    QML_FILES Main.qml
)

# Set target properties for macOS and Windows
set_target_properties(appQt_Cplusplus_Model_SQLite PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

# Link the necessary Qt libraries
target_link_libraries(appQt_Cplusplus_Model_SQLite
    PRIVATE Qt6::Quick Qt6::Sql
)

# Installation setup
include(GNUInstallDirs)
install(TARGETS appQt_Cplusplus_Model_SQLite
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
