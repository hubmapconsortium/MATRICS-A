# CMake generated Testfile for 
# Source directory: /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test
# Build directory: /data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/reg-test
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(interpolation_3D_NN "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_3D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_3D.nii.gz" "0" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_3D_NN.nii.gz")
set_tests_properties(interpolation_3D_NN PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;9;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(interpolation_3D_LIN "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_3D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_3D.nii.gz" "1" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_3D_LIN.nii.gz")
set_tests_properties(interpolation_3D_LIN PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;12;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(interpolation_3D_SPL "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_3D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_3D.nii.gz" "3" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_3D_SPL.nii.gz")
set_tests_properties(interpolation_3D_SPL PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;15;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(interpolation_2D_NN "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_2D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_2D.nii.gz" "0" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_2D_NN.nii.gz")
set_tests_properties(interpolation_2D_NN PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;18;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(interpolation_2D_LIN "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_2D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_2D.nii.gz" "1" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_2D_LIN.nii.gz")
set_tests_properties(interpolation_2D_LIN PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;21;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(interpolation_2D_SPL "reg_test_interp" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/brainweb_2D.nii.gz" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_DEF_BW_2D.nii.gz" "3" "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/reg-test-data/test_warped_BW_2D_SPL.nii.gz")
set_tests_properties(interpolation_2D_SPL PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;24;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")
add_test(mat44_operations "reg_test_mat44_operations")
set_tests_properties(mat44_operations PROPERTIES  _BACKTRACE_TRIPLES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;33;add_test;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/reg-test/CMakeLists.txt;0;")