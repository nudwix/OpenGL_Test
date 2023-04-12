cmake_minimum_required(VERSION 3.23)
project(OpenGL_Test)

set(CMAKE_CXX_STANDARD 17)


add_compile_definitions(GLEW_STATIC)
#add_executable(OpenGL_Test src/main.cpp)
add_executable(OpenGL_Test src/main.cpp external/glew/src/glew.c)

# OpenGL
find_package(OpenGL REQUIRED)
target_link_libraries(OpenGL_Test OpenGL::GL)

# GLFW
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(external/glfw-3.3.8)
target_link_libraries(OpenGL_Test glfw)

# GLEW
include_directories(external/glew/include)
#include_directories(external/glew-2.1.0/include)
#link_directories(external/glew-2.1.0/lib/Release/Win32)
#target_link_libraries(OpenGL_Test ${CMAKE_CURRENT_SOURCE_DIR}/external/glew-2.1.0/lib/Release/Win32/glew32s.lib)
#target_link_libraries(OpenGL_Test ${CMAKE_CURRENT_SOURCE_DIR}/external/glew-2.1.0/lib/Release/Win32/glew32.lib)
#target_link_libraries(OpenGL_Test ${CMAKE_CURRENT_SOURCE_DIR}/external/glew-2.1.0/bin/Release/Win32/glew32.dll)
