# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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
CMAKE_COMMAND = /usr/bin/cmake/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build

# Include any dependencies generated for this target.
include reg-lib/CMakeFiles/_reg_ssd.dir/depend.make

# Include the progress variables for this target.
include reg-lib/CMakeFiles/_reg_ssd.dir/progress.make

# Include the compile flags for this target's objects.
include reg-lib/CMakeFiles/_reg_ssd.dir/flags.make

reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o: reg-lib/CMakeFiles/_reg_ssd.dir/flags.make
reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o: ../reg-lib/_reg_ssd.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_ssd.cpp

reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.i"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_ssd.cpp > CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.i

reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.s"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_ssd.cpp -o CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.s

# Object files for target _reg_ssd
_reg_ssd_OBJECTS = \
"CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o"

# External object files for target _reg_ssd
_reg_ssd_EXTERNAL_OBJECTS =

reg-lib/lib_reg_ssd.a: reg-lib/CMakeFiles/_reg_ssd.dir/_reg_ssd.cpp.o
reg-lib/lib_reg_ssd.a: reg-lib/CMakeFiles/_reg_ssd.dir/build.make
reg-lib/lib_reg_ssd.a: reg-lib/CMakeFiles/_reg_ssd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library lib_reg_ssd.a"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && $(CMAKE_COMMAND) -P CMakeFiles/_reg_ssd.dir/cmake_clean_target.cmake
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_reg_ssd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
reg-lib/CMakeFiles/_reg_ssd.dir/build: reg-lib/lib_reg_ssd.a

.PHONY : reg-lib/CMakeFiles/_reg_ssd.dir/build

reg-lib/CMakeFiles/_reg_ssd.dir/clean:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && $(CMAKE_COMMAND) -P CMakeFiles/_reg_ssd.dir/cmake_clean.cmake
.PHONY : reg-lib/CMakeFiles/_reg_ssd.dir/clean

reg-lib/CMakeFiles/_reg_ssd.dir/depend:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib/CMakeFiles/_reg_ssd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : reg-lib/CMakeFiles/_reg_ssd.dir/depend

