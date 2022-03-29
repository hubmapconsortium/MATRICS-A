# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg;/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_ALL "")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/bin/cmake/share/cmake-3.17/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "NiftyReg built using CMake")
set(CPACK_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_HELP_LINK "https:/sourceforge.net/projects/niftyreg/")
set(CPACK_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp\$;\\.#;/#")
set(CPACK_INSTALLED_DIRECTORIES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg;/")
set(CPACK_INSTALL_CMAKE_PROJECTS "")
set(CPACK_INSTALL_PREFIX "/usr/local")
set(CPACK_MODULE_PATH "")
set(CPACK_NSIS_DISPLAY_NAME "CMake .")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "CMake .")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "m.modat@ucl.ac.uk")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/README.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "NiftyReg: Tools for efficient medical image registration.")
set(CPACK_PACKAGE_FILE_NAME "NiftyReg-1.3.9-Source")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "CMake .")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "CMake .")
set(CPACK_PACKAGE_NAME "NiftyReg")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Marc Modat (UCL)")
set(CPACK_PACKAGE_VERSION "1.3.9")
set(CPACK_PACKAGE_VERSION_MAJOR "1")
set(CPACK_PACKAGE_VERSION_MINOR "3")
set(CPACK_PACKAGE_VERSION_PATCH "9")
set(CPACK_RESOURCE_FILE_LICENSE "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/LICENSE.txt")
set(CPACK_RESOURCE_FILE_README "/usr/bin/cmake/share/cmake-3.17/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/bin/cmake/share/cmake-3.17/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_PACKAGE_SOURCES "ON")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp\$;\\.#;/#")
set(CPACK_SOURCE_INSTALLED_DIRECTORIES "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg;/")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "NiftyReg-1.3.9-Source")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_STRIP_FILES "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TOPLEVEL_TAG "Linux-x86_64--Source")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_STRIP_FILES "OFF")
set(CPACK_SYSTEM_NAME "Linux-x86_64-")
set(CPACK_TOPLEVEL_TAG "Linux-x86_64--Source")
set(CPACK_URL_INFO_ABOUT "https:/sourceforge.net/projects/niftyreg/")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/data_no_backup/de713126/SCRIPTS/Hubmap/Hubmap_Docker/PROG/NiftyReg/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
