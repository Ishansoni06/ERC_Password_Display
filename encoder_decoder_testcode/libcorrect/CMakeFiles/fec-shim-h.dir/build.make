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

# Utility rule file for fec-shim-h.

# Include any custom commands dependencies for this target.
include libcorrect/CMakeFiles/fec-shim-h.dir/compiler_depend.make

# Include the progress variables for this target.
include libcorrect/CMakeFiles/fec-shim-h.dir/progress.make

libcorrect/CMakeFiles/fec-shim-h:
	cd /home/ishan/rs_project/build/libcorrect && /usr/bin/cmake -E copy /home/ishan/rs_project/libcorrect/include/fec_shim.h /home/ishan/rs_project/build/libcorrect/include/fec.h

fec-shim-h: libcorrect/CMakeFiles/fec-shim-h
fec-shim-h: libcorrect/CMakeFiles/fec-shim-h.dir/build.make
.PHONY : fec-shim-h

# Rule to build all files generated by this target.
libcorrect/CMakeFiles/fec-shim-h.dir/build: fec-shim-h
.PHONY : libcorrect/CMakeFiles/fec-shim-h.dir/build

libcorrect/CMakeFiles/fec-shim-h.dir/clean:
	cd /home/ishan/rs_project/build/libcorrect && $(CMAKE_COMMAND) -P CMakeFiles/fec-shim-h.dir/cmake_clean.cmake
.PHONY : libcorrect/CMakeFiles/fec-shim-h.dir/clean

libcorrect/CMakeFiles/fec-shim-h.dir/depend:
	cd /home/ishan/rs_project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ishan/rs_project /home/ishan/rs_project/libcorrect /home/ishan/rs_project/build /home/ishan/rs_project/build/libcorrect /home/ishan/rs_project/build/libcorrect/CMakeFiles/fec-shim-h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libcorrect/CMakeFiles/fec-shim-h.dir/depend

