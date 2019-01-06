# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build

# Include any dependencies generated for this target.
include src/CMakeFiles/ML16.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/ML16.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/ML16.dir/flags.make

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o: src/CMakeFiles/ML16.dir/flags.make
src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o: ../src/ML16Lidar.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o"
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && /usr/bin/g++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ML16.dir/ML16Lidar.cpp.o -c /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/src/ML16Lidar.cpp

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ML16.dir/ML16Lidar.cpp.i"
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/src/ML16Lidar.cpp > CMakeFiles/ML16.dir/ML16Lidar.cpp.i

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ML16.dir/ML16Lidar.cpp.s"
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/src/ML16Lidar.cpp -o CMakeFiles/ML16.dir/ML16Lidar.cpp.s

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.requires:

.PHONY : src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.requires

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.provides: src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/ML16.dir/build.make src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.provides.build
.PHONY : src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.provides

src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.provides.build: src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o


# Object files for target ML16
ML16_OBJECTS = \
"CMakeFiles/ML16.dir/ML16Lidar.cpp.o"

# External object files for target ML16
ML16_EXTERNAL_OBJECTS =

lib/libML16.so.1.1: src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o
lib/libML16.so.1.1: src/CMakeFiles/ML16.dir/build.make
lib/libML16.so.1.1: /usr/local/lib/libboost_thread.so
lib/libML16.so.1.1: /usr/lib/x86_64-linux-gnu/libpthread.so
lib/libML16.so.1.1: src/CMakeFiles/ML16.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../lib/libML16.so"
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ML16.dir/link.txt --verbose=$(VERBOSE)
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && $(CMAKE_COMMAND) -E cmake_symlink_library ../lib/libML16.so.1.1 ../lib/libML16.so.1 ../lib/libML16.so

lib/libML16.so.1: lib/libML16.so.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libML16.so.1

lib/libML16.so: lib/libML16.so.1.1
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libML16.so

# Rule to build all files generated by this target.
src/CMakeFiles/ML16.dir/build: lib/libML16.so

.PHONY : src/CMakeFiles/ML16.dir/build

src/CMakeFiles/ML16.dir/requires: src/CMakeFiles/ML16.dir/ML16Lidar.cpp.o.requires

.PHONY : src/CMakeFiles/ML16.dir/requires

src/CMakeFiles/ML16.dir/clean:
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src && $(CMAKE_COMMAND) -P CMakeFiles/ML16.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/ML16.dir/clean

src/CMakeFiles/ML16.dir/depend:
	cd /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/src /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src /home/yinzi/Desktop/ML16SDK-AutoBuild/ML16SDK/build/src/CMakeFiles/ML16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/ML16.dir/depend

