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
CMAKE_SOURCE_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build

# Include any dependencies generated for this target.
include CMakeFiles/Seg_DBB2.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Seg_DBB2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Seg_DBB2.dir/flags.make

CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o: CMakeFiles/Seg_DBB2.dir/flags.make
CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o: ../Seg_DBB2.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/Seg_DBB2.cxx

CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/Seg_DBB2.cxx > CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.i

CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/Seg_DBB2.cxx -o CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.s

# Object files for target Seg_DBB2
Seg_DBB2_OBJECTS = \
"CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o"

# External object files for target Seg_DBB2
Seg_DBB2_EXTERNAL_OBJECTS =

Seg_DBB2: CMakeFiles/Seg_DBB2.dir/Seg_DBB2.cxx.o
Seg_DBB2: CMakeFiles/Seg_DBB2.dir/build.make
Seg_DBB2: /usr/local/lib/libitkdouble-conversion-5.1.a
Seg_DBB2: /usr/local/lib/libitksys-5.1.a
Seg_DBB2: /usr/local/lib/libitkvnl_algo-5.1.a
Seg_DBB2: /usr/local/lib/libitkvnl-5.1.a
Seg_DBB2: /usr/local/lib/libitkv3p_netlib-5.1.a
Seg_DBB2: /usr/local/lib/libitkvcl-5.1.a
Seg_DBB2: /usr/local/lib/libITKCommon-5.1.a
Seg_DBB2: /usr/local/lib/libitkNetlibSlatec-5.1.a
Seg_DBB2: /usr/local/lib/libITKStatistics-5.1.a
Seg_DBB2: /usr/local/lib/libITKTransform-5.1.a
Seg_DBB2: /usr/local/lib/libITKMesh-5.1.a
Seg_DBB2: /usr/local/lib/libitkzlib-5.1.a
Seg_DBB2: /usr/local/lib/libITKMetaIO-5.1.a
Seg_DBB2: /usr/local/lib/libITKSpatialObjects-5.1.a
Seg_DBB2: /usr/local/lib/libITKPath-5.1.a
Seg_DBB2: /usr/local/lib/libITKLabelMap-5.1.a
Seg_DBB2: /usr/local/lib/libITKQuadEdgeMesh-5.1.a
Seg_DBB2: /usr/local/lib/libITKFastMarching-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOImageBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKSmoothing-5.1.a
Seg_DBB2: /usr/local/lib/libITKImageFeature-5.1.a
Seg_DBB2: /usr/local/lib/libITKOptimizers-5.1.a
Seg_DBB2: /usr/local/lib/libITKPolynomials-5.1.a
Seg_DBB2: /usr/local/lib/libITKBiasCorrection-5.1.a
Seg_DBB2: /usr/local/lib/libITKColormap-5.1.a
Seg_DBB2: /usr/local/lib/libITKFFT-5.1.a
Seg_DBB2: /usr/local/lib/libITKConvolution-5.1.a
Seg_DBB2: /usr/local/lib/libITKDICOMParser-5.1.a
Seg_DBB2: /usr/local/lib/libITKDeformableMesh-5.1.a
Seg_DBB2: /usr/local/lib/libITKDenoising-5.1.a
Seg_DBB2: /usr/local/lib/libITKDiffusionTensorImage-5.1.a
Seg_DBB2: /usr/local/lib/libITKEXPAT-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmDICT-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmMSFF-5.1.a
Seg_DBB2: /usr/local/lib/libITKznz-5.1.a
Seg_DBB2: /usr/local/lib/libITKniftiio-5.1.a
Seg_DBB2: /usr/local/lib/libITKgiftiio-5.1.a
Seg_DBB2: /usr/local/lib/libITKPDEDeformableRegistration-5.1.a
Seg_DBB2: /usr/local/lib/libitkhdf5_cpp.a
Seg_DBB2: /usr/local/lib/libitkhdf5.a
Seg_DBB2: /usr/local/lib/libITKIOBMP-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOBioRad-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOBruker-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOCSV-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOGDCM-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOIPL-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOGE-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOGIPL-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOHDF5-5.1.a
Seg_DBB2: /usr/local/lib/libitkjpeg-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOJPEG-5.1.a
Seg_DBB2: /usr/local/lib/libitkopenjpeg-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOJPEG2000-5.1.a
Seg_DBB2: /usr/local/lib/libitktiff-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTIFF-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOLSM-5.1.a
Seg_DBB2: /usr/local/lib/libitkminc2-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMINC-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMRC-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshBYU-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshFreeSurfer-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshGifti-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshOBJ-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshOFF-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshVTK-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeta-5.1.a
Seg_DBB2: /usr/local/lib/libITKIONIFTI-5.1.a
Seg_DBB2: /usr/local/lib/libITKNrrdIO-5.1.a
Seg_DBB2: /usr/local/lib/libITKIONRRD-5.1.a
Seg_DBB2: /usr/local/lib/libitkpng-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOPNG-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOSiemens-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOXML-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOSpatialObjects-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOStimulate-5.1.a
Seg_DBB2: /usr/local/lib/libITKTransformFactory-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTransformBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTransformHDF5-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTransformInsightLegacy-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTransformMatlab-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOVTK-5.1.a
Seg_DBB2: /usr/local/lib/libITKKLMRegionGrowing-5.1.a
Seg_DBB2: /usr/local/lib/libitklbfgs-5.1.a
Seg_DBB2: /usr/local/lib/libITKMarkovRandomFieldsClassifiers-5.1.a
Seg_DBB2: /usr/local/lib/libITKOptimizersv4-5.1.a
Seg_DBB2: /usr/local/lib/libITKQuadEdgeMeshFiltering-5.1.a
Seg_DBB2: /usr/local/lib/libITKRegionGrowing-5.1.a
Seg_DBB2: /usr/local/lib/libITKRegistrationMethodsv4-5.1.a
Seg_DBB2: /usr/local/lib/libITKTestKernel-5.1.a
Seg_DBB2: /usr/local/lib/libITKVTK-5.1.a
Seg_DBB2: /usr/local/lib/libITKVideoCore-5.1.a
Seg_DBB2: /usr/local/lib/libITKVideoIO-5.1.a
Seg_DBB2: /usr/local/lib/libITKWatersheds-5.1.a
Seg_DBB2: /usr/local/lib/libITKFFT-5.1.a
Seg_DBB2: /usr/local/lib/libitkopenjpeg-5.1.a
Seg_DBB2: /usr/local/lib/libitkminc2-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOIPL-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOXML-5.1.a
Seg_DBB2: /usr/local/lib/libitkhdf5_cpp.a
Seg_DBB2: /usr/local/lib/libitkhdf5.a
Seg_DBB2: /usr/local/lib/libITKIOTransformBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKTransformFactory-5.1.a
Seg_DBB2: /usr/local/lib/libITKImageFeature-5.1.a
Seg_DBB2: /usr/local/lib/libITKOptimizersv4-5.1.a
Seg_DBB2: /usr/local/lib/libITKOptimizers-5.1.a
Seg_DBB2: /usr/local/lib/libitklbfgs-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOBMP-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOGDCM-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmMSFF-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmDICT-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmIOD-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmDSED-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmCommon-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmjpeg8-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmjpeg12-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmjpeg16-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmopenjp2-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmcharls-5.1.a
Seg_DBB2: /usr/local/lib/libitkgdcmuuid-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOGIPL-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOJPEG-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOTIFF-5.1.a
Seg_DBB2: /usr/local/lib/libitktiff-5.1.a
Seg_DBB2: /usr/local/lib/libitkjpeg-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshBYU-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshFreeSurfer-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshGifti-5.1.a
Seg_DBB2: /usr/local/lib/libITKgiftiio-5.1.a
Seg_DBB2: /usr/local/lib/libITKEXPAT-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshOBJ-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshOFF-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshVTK-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeshBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKQuadEdgeMesh-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOMeta-5.1.a
Seg_DBB2: /usr/local/lib/libITKMetaIO-5.1.a
Seg_DBB2: /usr/local/lib/libITKIONIFTI-5.1.a
Seg_DBB2: /usr/local/lib/libITKniftiio-5.1.a
Seg_DBB2: /usr/local/lib/libITKznz-5.1.a
Seg_DBB2: /usr/local/lib/libITKIONRRD-5.1.a
Seg_DBB2: /usr/local/lib/libITKNrrdIO-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOPNG-5.1.a
Seg_DBB2: /usr/local/lib/libitkpng-5.1.a
Seg_DBB2: /usr/local/lib/libitkzlib-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOVTK-5.1.a
Seg_DBB2: /usr/local/lib/libITKIOImageBase-5.1.a
Seg_DBB2: /usr/local/lib/libITKVideoCore-5.1.a
Seg_DBB2: /usr/local/lib/libITKStatistics-5.1.a
Seg_DBB2: /usr/local/lib/libitkNetlibSlatec-5.1.a
Seg_DBB2: /usr/local/lib/libITKSpatialObjects-5.1.a
Seg_DBB2: /usr/local/lib/libITKMesh-5.1.a
Seg_DBB2: /usr/local/lib/libITKTransform-5.1.a
Seg_DBB2: /usr/local/lib/libITKPath-5.1.a
Seg_DBB2: /usr/local/lib/libITKCommon-5.1.a
Seg_DBB2: /usr/local/lib/libitkdouble-conversion-5.1.a
Seg_DBB2: /usr/local/lib/libitksys-5.1.a
Seg_DBB2: /usr/local/lib/libITKVNLInstantiation-5.1.a
Seg_DBB2: /usr/local/lib/libitkvnl_algo-5.1.a
Seg_DBB2: /usr/local/lib/libitkvnl-5.1.a
Seg_DBB2: /usr/local/lib/libitkv3p_netlib-5.1.a
Seg_DBB2: /usr/local/lib/libitkvcl-5.1.a
Seg_DBB2: /usr/local/lib/libITKSmoothing-5.1.a
Seg_DBB2: CMakeFiles/Seg_DBB2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Seg_DBB2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Seg_DBB2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Seg_DBB2.dir/build: Seg_DBB2

.PHONY : CMakeFiles/Seg_DBB2.dir/build

CMakeFiles/Seg_DBB2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Seg_DBB2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Seg_DBB2.dir/clean

CMakeFiles/Seg_DBB2.dir/depend:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/RemoveComponents/build/CMakeFiles/Seg_DBB2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Seg_DBB2.dir/depend
