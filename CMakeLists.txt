cmake_minimum_required(VERSION VERSION 3.15 FATAL_ERROR)
set(CMAKE_EXPORT_COMPILE_COMMANDS on)
set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${CMAKE_CURRENT_LIST_DIR}/cmake")
project(socix CUDA CXX)
add_subdirectory(src)
