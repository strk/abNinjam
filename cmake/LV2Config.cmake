set (LV2PLUGIN_VERSION_MINOR   1)
set (LV2PLUGIN_VERSION_MICRO   0)
set (LV2PLUGIN_NAME            "abNinjam")
set (LV2PLUGIN_COMMENT         "NINJAM client")
set (LV2PLUGIN_URI             "http://hippie.lt/lv2/abNinjam")
set (LV2PLUGIN_REPOSITORY      "https://github.com/antanasbruzas/abNinjam")
set (LV2PLUGIN_AUTHOR          "Antanas Bruzas")
set (LV2PLUGIN_EMAIL           "antanas@hippie.lt")
if (ABNINJAM_USE_NJCLIENT)
    set (LV2PLUGIN_SPDX_LICENSE_ID "GPL-2.0-or-later")
else()
    set (LV2PLUGIN_SPDX_LICENSE_ID "ISC")
endif()

include("cmake/modules/SetupLV2LibraryDefaultPath.cmake")

# here you can define the lv2 plug-ins folder (it will be created)
setup_default_lv2_path()
if ("${DEFAULT_LV2_FOLDER}" STREQUAL "")
    set (DEFAULT_LV2_FOLDER "${CMAKE_INSTALL_PREFIX}")
endif()
if (NOT LV2PLUGIN_INSTALL_DIR)
    set(LV2PLUGIN_INSTALL_DIR "${DEFAULT_LV2_FOLDER}")
endif()
if (NOT ${LV2PLUGIN_INSTALL_DIR} STREQUAL "")
    file(MAKE_DIRECTORY ${LV2PLUGIN_INSTALL_DIR})
    if(EXISTS ${LV2PLUGIN_INSTALL_DIR})
        message(STATUS "LV2PLUGIN_INSTALL_DIR is set to : " ${LV2PLUGIN_INSTALL_DIR})
    else()
        message(STATUS "LV2PLUGIN_INSTALL_DIR is not set!")
    endif()
endif()
