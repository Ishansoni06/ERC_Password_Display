cmake_minimum_required(VERSION 3.10)
project(RSProject C)

add_subdirectory(libcorrect)
include_directories(libcorrect/include)

add_executable(encoder encoder/encoder.c)
target_link_libraries(encoder correct)

add_executable(decoder decoder/decoder.c)
target_link_libraries(decoder correct)

