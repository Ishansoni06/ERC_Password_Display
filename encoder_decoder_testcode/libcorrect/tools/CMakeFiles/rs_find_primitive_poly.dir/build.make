# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ishan/rs_project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ishan/rs_project/build

# Include any dependencies generated for this target.
include libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/compiler_depend.make

# Include the progress variables for this target.
include libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/progress.make

# Include the compile flags for this target's objects.
include libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/flags.make

libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o: libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/flags.make
libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o: ../libcorrect/tools/find_rs_primitive_poly.c
libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o: libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ishan/rs_project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o"
	cd /home/ishan/rs_project/build/libcorrect/tools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o -MF CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o.d -o CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o -c /home/ishan/rs_project/libcorrect/tools/find_rs_primitive_poly.c

libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.i"
	cd /home/ishan/rs_project/build/libcorrect/tools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/ishan/rs_project/libcorrect/tools/find_rs_primitive_poly.c > CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.i

libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.s"
	cd /home/ishan/rs_project/build/libcorrect/tools && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/ishan/rs_project/libcorrect/tools/find_rs_primitive_poly.c -o CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.s

# Object files for target rs_find_primitive_poly
rs_find_primitive_poly_OBJECTS = \
"CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o"

# External object files for target rs_find_primitive_poly
rs_find_primitive_poly_EXTERNAL_OBJECTS =

libcorrect/bin/rs_find_primitive_poly: libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/find_rs_primitive_poly.c.o
libcorrect/bin/rs_find_primitive_poly: libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/build.make
libcorrect/bin/rs_find_primitive_poly: libcorrect/lib/libcorrect.a
libcorrect/bin/rs_find_primitive_poly: libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ishan/rs_project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../bin/rs_find_primitive_poly"
	cd /home/ishan/rs_project/build/libcorrect/tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rs_find_primitive_poly.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/build: libcorrect/bin/rs_find_primitive_poly
.PHONY : libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/build

libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/clean:
	cd /home/ishan/rs_project/build/libcorrect/tools && $(CMAKE_COMMAND) -P CMakeFiles/rs_find_primitive_poly.dir/cmake_clean.cmake
.PHONY : libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/clean

libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/depend:
	cd /home/ishan/rs_project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ishan/rs_project /home/ishan/rs_project/libcorrect/tools /home/ishan/rs_project/build /home/ishan/rs_project/build/libcorrect/tools /home/ishan/rs_project/build/libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libcorrect/tools/CMakeFiles/rs_find_primitive_poly.dir/depend

