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
include reg-lib/CMakeFiles/_reg_aladin.dir/depend.make

# Include the progress variables for this target.
include reg-lib/CMakeFiles/_reg_aladin.dir/progress.make

# Include the compile flags for this target's objects.
include reg-lib/CMakeFiles/_reg_aladin.dir/flags.make

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o: reg-lib/CMakeFiles/_reg_aladin.dir/flags.make
reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o: ../reg-lib/_reg_aladin.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin.cpp

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.i"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin.cpp > CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.i

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.s"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin.cpp -o CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.s

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o: reg-lib/CMakeFiles/_reg_aladin.dir/flags.make
reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o: ../reg-lib/_reg_aladin_sym.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin_sym.cpp

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.i"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin_sym.cpp > CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.i

reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.s"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib/_reg_aladin_sym.cpp -o CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.s

# Object files for target _reg_aladin
_reg_aladin_OBJECTS = \
"CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o" \
"CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o"

# External object files for target _reg_aladin
_reg_aladin_EXTERNAL_OBJECTS =

reg-lib/lib_reg_aladin.so: reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin.cpp.o
reg-lib/lib_reg_aladin.so: reg-lib/CMakeFiles/_reg_aladin.dir/_reg_aladin_sym.cpp.o
reg-lib/lib_reg_aladin.so: reg-lib/CMakeFiles/_reg_aladin.dir/build.make
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_localTransformation.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_blockMatching.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_resampling.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_globalTransformation.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_ssd.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_mutualinformation.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_tools.a
reg-lib/lib_reg_aladin.so: reg-io/lib_reg_ReadWriteImage.a
reg-lib/lib_reg_aladin.so: reg-io/png/libreg_png.a
reg-lib/lib_reg_aladin.so: /usr/lib/x86_64-linux-gnu/libpng.so
reg-lib/lib_reg_aladin.so: reg-io/nrrd/libreg_nrrd.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_tools.a
reg-lib/lib_reg_aladin.so: reg-lib/lib_reg_maths.a
reg-lib/lib_reg_aladin.so: reg-io/nifti/libreg_nifti.a
reg-lib/lib_reg_aladin.so: reg-io/nrrd/libreg_NrrdIO.a
reg-lib/lib_reg_aladin.so: reg-lib/CMakeFiles/_reg_aladin.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library lib_reg_aladin.so"
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_reg_aladin.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
reg-lib/CMakeFiles/_reg_aladin.dir/build: reg-lib/lib_reg_aladin.so

.PHONY : reg-lib/CMakeFiles/_reg_aladin.dir/build

reg-lib/CMakeFiles/_reg_aladin.dir/clean:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib && $(CMAKE_COMMAND) -P CMakeFiles/_reg_aladin.dir/cmake_clean.cmake
.PHONY : reg-lib/CMakeFiles/_reg_aladin.dir/clean

reg-lib/CMakeFiles/_reg_aladin.dir/depend:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-lib /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-lib/CMakeFiles/_reg_aladin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : reg-lib/CMakeFiles/_reg_aladin.dir/depend

