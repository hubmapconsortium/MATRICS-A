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
CMAKE_SOURCE_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build

# Include any dependencies generated for this target.
include CMakeFiles/ConnectedComp.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/ConnectedComp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/ConnectedComp.dir/flags.make

CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o: CMakeFiles/ConnectedComp.dir/flags.make
CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o: ../ConnectedComp3D.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o -c /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/ConnectedComp3D.cxx

CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/ConnectedComp3D.cxx > CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.i

CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/ConnectedComp3D.cxx -o CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.s

# Object files for target ConnectedComp
ConnectedComp_OBJECTS = \
"CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o"

# External object files for target ConnectedComp
ConnectedComp_EXTERNAL_OBJECTS =

ConnectedComp: CMakeFiles/ConnectedComp.dir/ConnectedComp3D.cxx.o
ConnectedComp: CMakeFiles/ConnectedComp.dir/build.make
ConnectedComp: /usr/local/lib/libitkdouble-conversion-5.1.a
ConnectedComp: /usr/local/lib/libitksys-5.1.a
ConnectedComp: /usr/local/lib/libitkvnl_algo-5.1.a
ConnectedComp: /usr/local/lib/libitkvnl-5.1.a
ConnectedComp: /usr/local/lib/libitkv3p_netlib-5.1.a
ConnectedComp: /usr/local/lib/libitkvcl-5.1.a
ConnectedComp: /usr/local/lib/libITKCommon-5.1.a
ConnectedComp: /usr/local/lib/libitkNetlibSlatec-5.1.a
ConnectedComp: /usr/local/lib/libITKStatistics-5.1.a
ConnectedComp: /usr/local/lib/libITKTransform-5.1.a
ConnectedComp: /usr/local/lib/libITKMesh-5.1.a
ConnectedComp: /usr/local/lib/libitkzlib-5.1.a
ConnectedComp: /usr/local/lib/libITKMetaIO-5.1.a
ConnectedComp: /usr/local/lib/libITKSpatialObjects-5.1.a
ConnectedComp: /usr/local/lib/libITKPath-5.1.a
ConnectedComp: /usr/local/lib/libITKLabelMap-5.1.a
ConnectedComp: /usr/local/lib/libITKQuadEdgeMesh-5.1.a
ConnectedComp: /usr/local/lib/libITKFastMarching-5.1.a
ConnectedComp: /usr/local/lib/libITKIOImageBase-5.1.a
ConnectedComp: /usr/local/lib/libITKSmoothing-5.1.a
ConnectedComp: /usr/local/lib/libITKImageFeature-5.1.a
ConnectedComp: /usr/local/lib/libITKOptimizers-5.1.a
ConnectedComp: /usr/local/lib/libITKPolynomials-5.1.a
ConnectedComp: /usr/local/lib/libITKBiasCorrection-5.1.a
ConnectedComp: /usr/local/lib/libITKColormap-5.1.a
ConnectedComp: /usr/local/lib/libITKFFT-5.1.a
ConnectedComp: /usr/local/lib/libITKConvolution-5.1.a
ConnectedComp: /usr/local/lib/libITKDICOMParser-5.1.a
ConnectedComp: /usr/local/lib/libITKDeformableMesh-5.1.a
ConnectedComp: /usr/local/lib/libITKDenoising-5.1.a
ConnectedComp: /usr/local/lib/libITKDiffusionTensorImage-5.1.a
ConnectedComp: /usr/local/lib/libITKEXPAT-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmDICT-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmMSFF-5.1.a
ConnectedComp: /usr/local/lib/libITKznz-5.1.a
ConnectedComp: /usr/local/lib/libITKniftiio-5.1.a
ConnectedComp: /usr/local/lib/libITKgiftiio-5.1.a
ConnectedComp: /usr/local/lib/libITKPDEDeformableRegistration-5.1.a
ConnectedComp: /usr/local/lib/libitkhdf5_cpp.a
ConnectedComp: /usr/local/lib/libitkhdf5.a
ConnectedComp: /usr/local/lib/libITKIOBMP-5.1.a
ConnectedComp: /usr/local/lib/libITKIOBioRad-5.1.a
ConnectedComp: /usr/local/lib/libITKIOBruker-5.1.a
ConnectedComp: /usr/local/lib/libITKIOCSV-5.1.a
ConnectedComp: /usr/local/lib/libITKIOGDCM-5.1.a
ConnectedComp: /usr/local/lib/libITKIOIPL-5.1.a
ConnectedComp: /usr/local/lib/libITKIOGE-5.1.a
ConnectedComp: /usr/local/lib/libITKIOGIPL-5.1.a
ConnectedComp: /usr/local/lib/libITKIOHDF5-5.1.a
ConnectedComp: /usr/local/lib/libitkjpeg-5.1.a
ConnectedComp: /usr/local/lib/libITKIOJPEG-5.1.a
ConnectedComp: /usr/local/lib/libitkopenjpeg-5.1.a
ConnectedComp: /usr/local/lib/libITKIOJPEG2000-5.1.a
ConnectedComp: /usr/local/lib/libitktiff-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTIFF-5.1.a
ConnectedComp: /usr/local/lib/libITKIOLSM-5.1.a
ConnectedComp: /usr/local/lib/libitkminc2-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMINC-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMRC-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshBase-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshBYU-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshFreeSurfer-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshGifti-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshOBJ-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshOFF-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshVTK-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeta-5.1.a
ConnectedComp: /usr/local/lib/libITKIONIFTI-5.1.a
ConnectedComp: /usr/local/lib/libITKNrrdIO-5.1.a
ConnectedComp: /usr/local/lib/libITKIONRRD-5.1.a
ConnectedComp: /usr/local/lib/libitkpng-5.1.a
ConnectedComp: /usr/local/lib/libITKIOPNG-5.1.a
ConnectedComp: /usr/local/lib/libITKIOSiemens-5.1.a
ConnectedComp: /usr/local/lib/libITKIOXML-5.1.a
ConnectedComp: /usr/local/lib/libITKIOSpatialObjects-5.1.a
ConnectedComp: /usr/local/lib/libITKIOStimulate-5.1.a
ConnectedComp: /usr/local/lib/libITKTransformFactory-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTransformBase-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTransformHDF5-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTransformInsightLegacy-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTransformMatlab-5.1.a
ConnectedComp: /usr/local/lib/libITKIOVTK-5.1.a
ConnectedComp: /usr/local/lib/libITKKLMRegionGrowing-5.1.a
ConnectedComp: /usr/local/lib/libitklbfgs-5.1.a
ConnectedComp: /usr/local/lib/libITKMarkovRandomFieldsClassifiers-5.1.a
ConnectedComp: /usr/local/lib/libITKOptimizersv4-5.1.a
ConnectedComp: /usr/local/lib/libITKQuadEdgeMeshFiltering-5.1.a
ConnectedComp: /usr/local/lib/libITKRegionGrowing-5.1.a
ConnectedComp: /usr/local/lib/libITKRegistrationMethodsv4-5.1.a
ConnectedComp: /usr/local/lib/libITKTestKernel-5.1.a
ConnectedComp: /usr/local/lib/libITKVTK-5.1.a
ConnectedComp: /usr/local/lib/libITKVideoCore-5.1.a
ConnectedComp: /usr/local/lib/libITKVideoIO-5.1.a
ConnectedComp: /usr/local/lib/libITKWatersheds-5.1.a
ConnectedComp: /usr/local/lib/libITKFFT-5.1.a
ConnectedComp: /usr/local/lib/libitkopenjpeg-5.1.a
ConnectedComp: /usr/local/lib/libitkminc2-5.1.a
ConnectedComp: /usr/local/lib/libITKIOIPL-5.1.a
ConnectedComp: /usr/local/lib/libITKIOXML-5.1.a
ConnectedComp: /usr/local/lib/libitkhdf5_cpp.a
ConnectedComp: /usr/local/lib/libitkhdf5.a
ConnectedComp: /usr/local/lib/libITKIOTransformBase-5.1.a
ConnectedComp: /usr/local/lib/libITKTransformFactory-5.1.a
ConnectedComp: /usr/local/lib/libITKImageFeature-5.1.a
ConnectedComp: /usr/local/lib/libITKOptimizersv4-5.1.a
ConnectedComp: /usr/local/lib/libITKOptimizers-5.1.a
ConnectedComp: /usr/local/lib/libitklbfgs-5.1.a
ConnectedComp: /usr/local/lib/libITKIOBMP-5.1.a
ConnectedComp: /usr/local/lib/libITKIOGDCM-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmMSFF-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmDICT-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmIOD-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmDSED-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmCommon-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmjpeg8-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmjpeg12-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmjpeg16-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmopenjp2-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmcharls-5.1.a
ConnectedComp: /usr/local/lib/libitkgdcmuuid-5.1.a
ConnectedComp: /usr/local/lib/libITKIOGIPL-5.1.a
ConnectedComp: /usr/local/lib/libITKIOJPEG-5.1.a
ConnectedComp: /usr/local/lib/libITKIOTIFF-5.1.a
ConnectedComp: /usr/local/lib/libitktiff-5.1.a
ConnectedComp: /usr/local/lib/libitkjpeg-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshBYU-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshFreeSurfer-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshGifti-5.1.a
ConnectedComp: /usr/local/lib/libITKgiftiio-5.1.a
ConnectedComp: /usr/local/lib/libITKEXPAT-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshOBJ-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshOFF-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshVTK-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeshBase-5.1.a
ConnectedComp: /usr/local/lib/libITKQuadEdgeMesh-5.1.a
ConnectedComp: /usr/local/lib/libITKIOMeta-5.1.a
ConnectedComp: /usr/local/lib/libITKMetaIO-5.1.a
ConnectedComp: /usr/local/lib/libITKIONIFTI-5.1.a
ConnectedComp: /usr/local/lib/libITKniftiio-5.1.a
ConnectedComp: /usr/local/lib/libITKznz-5.1.a
ConnectedComp: /usr/local/lib/libITKIONRRD-5.1.a
ConnectedComp: /usr/local/lib/libITKNrrdIO-5.1.a
ConnectedComp: /usr/local/lib/libITKIOPNG-5.1.a
ConnectedComp: /usr/local/lib/libitkpng-5.1.a
ConnectedComp: /usr/local/lib/libitkzlib-5.1.a
ConnectedComp: /usr/local/lib/libITKIOVTK-5.1.a
ConnectedComp: /usr/local/lib/libITKIOImageBase-5.1.a
ConnectedComp: /usr/local/lib/libITKVideoCore-5.1.a
ConnectedComp: /usr/local/lib/libITKStatistics-5.1.a
ConnectedComp: /usr/local/lib/libitkNetlibSlatec-5.1.a
ConnectedComp: /usr/local/lib/libITKSpatialObjects-5.1.a
ConnectedComp: /usr/local/lib/libITKMesh-5.1.a
ConnectedComp: /usr/local/lib/libITKTransform-5.1.a
ConnectedComp: /usr/local/lib/libITKPath-5.1.a
ConnectedComp: /usr/local/lib/libITKCommon-5.1.a
ConnectedComp: /usr/local/lib/libitkdouble-conversion-5.1.a
ConnectedComp: /usr/local/lib/libitksys-5.1.a
ConnectedComp: /usr/local/lib/libITKVNLInstantiation-5.1.a
ConnectedComp: /usr/local/lib/libitkvnl_algo-5.1.a
ConnectedComp: /usr/local/lib/libitkvnl-5.1.a
ConnectedComp: /usr/local/lib/libitkv3p_netlib-5.1.a
ConnectedComp: /usr/local/lib/libitkvcl-5.1.a
ConnectedComp: /usr/local/lib/libITKSmoothing-5.1.a
ConnectedComp: CMakeFiles/ConnectedComp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ConnectedComp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/ConnectedComp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/ConnectedComp.dir/build: ConnectedComp

.PHONY : CMakeFiles/ConnectedComp.dir/build

CMakeFiles/ConnectedComp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/ConnectedComp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/ConnectedComp.dir/clean

CMakeFiles/ConnectedComp.dir/depend:
	cd /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/TissueMask/HoleFilling/build/CMakeFiles/ConnectedComp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/ConnectedComp.dir/depend

