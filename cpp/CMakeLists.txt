# required
cmake_minimum_required(VERSION 3.10)
project(main)
add_executable(main "src/main.cpp")

# -I
target_include_directories(main PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include/")

#target_link_libraries(main PRIVATE profilerLib)
