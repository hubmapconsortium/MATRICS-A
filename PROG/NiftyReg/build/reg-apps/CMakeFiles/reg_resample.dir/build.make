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
include reg-apps/CMakeFiles/reg_resample.dir/depend.make

# Include the progress variables for this target.
include reg-apps/CMakeFiles/reg_resample.dir/progress.make

# Include the compile flags for this target's objects.
include reg-apps/CMakeFiles/reg_resample.dir/flags.make

reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.o: reg-apps/CMakeFiles/reg_resample.dir/flags.make
reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.o: ../reg-apps/reg_resample.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.o"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/reg_resample.dir/reg_resample.cpp.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-apps/reg_resample.cpp

reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/reg_resample.dir/reg_resample.cpp.i"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-apps/reg_resample.cpp > CMakeFiles/reg_resample.dir/reg_resample.cpp.i

reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/reg_resample.dir/reg_resample.cpp.s"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-apps/reg_resample.cpp -o CMakeFiles/reg_resample.dir/reg_resample.cpp.s

# Object files for target reg_resample
reg_resample_OBJECTS = \
"CMakeFiles/reg_resample.dir/reg_resample.cpp.o"

# External object files for target reg_resample
reg_resample_EXTERNAL_OBJECTS =

reg-apps/reg_resample: reg-apps/CMakeFiles/reg_resample.dir/reg_resample.cpp.o
reg-apps/reg_resample: reg-apps/CMakeFiles/reg_resample.dir/build.make
reg-apps/reg_resample: reg-lib/lib_reg_resampling.a
reg-apps/reg_resample: reg-lib/lib_reg_localTransformation.a
reg-apps/reg_resample: reg-lib/lib_reg_tools.a
reg-apps/reg_resample: reg-lib/lib_reg_globalTransformation.a
reg-apps/reg_resample: reg-io/lib_reg_ReadWriteImage.a
reg-apps/reg_resample: reg-io/png/libreg_png.a
reg-apps/reg_resample: /usr/lib/x86_64-linux-gnu/libpng.so
reg-apps/reg_resample: reg-io/nrrd/libreg_nrrd.a
reg-apps/reg_resample: reg-lib/lib_reg_tools.a
reg-apps/reg_resample: reg-lib/lib_reg_maths.a
reg-apps/reg_resample: reg-io/nifti/libreg_nifti.a
reg-apps/reg_resample: reg-io/nrrd/libreg_NrrdIO.a
reg-apps/reg_resample: reg-apps/CMakeFiles/reg_resample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable reg_resample"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/reg_resample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
reg-apps/CMakeFiles/reg_resample.dir/build: reg-apps/reg_resample

.PHONY : reg-apps/CMakeFiles/reg_resample.dir/build

reg-apps/CMakeFiles/reg_resample.dir/clean:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps && $(CMAKE_COMMAND) -P CMakeFiles/reg_resample.dir/cmake_clean.cmake
.PHONY : reg-apps/CMakeFiles/reg_resample.dir/clean

reg-apps/CMakeFiles/reg_resample.dir/depend:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-apps /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-apps/CMakeFiles/reg_resample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : reg-apps/CMakeFiles/reg_resample.dir/depend

