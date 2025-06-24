# CMake generated Testfile for 
# Source directory: /home/ishan/rs_project/libcorrect/tests
# Build directory: /home/ishan/rs_project/build/libcorrect/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(convolutional_test "/home/ishan/rs_project/build/tests/convolutional_test_runner")
set_tests_properties(convolutional_test PROPERTIES  WORKING_DIRECTORY "/home/ishan/rs_project/build/tests" _BACKTRACE_TRIPLES "/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;7;add_test;/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;0;")
add_test(convolutional_sse_test "/home/ishan/rs_project/build/tests/convolutional_sse_test_runner")
set_tests_properties(convolutional_sse_test PROPERTIES  WORKING_DIRECTORY "/home/ishan/rs_project/build/tests" _BACKTRACE_TRIPLES "/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;14;add_test;/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;0;")
add_test(convolutional_shim_test "/home/ishan/rs_project/build/tests/convolutional_shim_test_runner")
set_tests_properties(convolutional_shim_test PROPERTIES  WORKING_DIRECTORY "/home/ishan/rs_project/build/tests" _BACKTRACE_TRIPLES "/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;29;add_test;/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;0;")
add_test(reed_solomon_test "/home/ishan/rs_project/build/tests/reed_solomon_test_runner")
set_tests_properties(reed_solomon_test PROPERTIES  WORKING_DIRECTORY "/home/ishan/rs_project/build/tests" _BACKTRACE_TRIPLES "/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;35;add_test;/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;0;")
add_test(reed_solomon_shim_interop_test "/home/ishan/rs_project/build/tests/reed_solomon_shim_interop_test_runner")
set_tests_properties(reed_solomon_shim_interop_test PROPERTIES  WORKING_DIRECTORY "/home/ishan/rs_project/build/tests" _BACKTRACE_TRIPLES "/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;49;add_test;/home/ishan/rs_project/libcorrect/tests/CMakeLists.txt;0;")
