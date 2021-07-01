QT += gui widgets

TEMPLATE = lib
DEFINES += LP_PLUGIN_SINGA_PC_LIBRARY

CONFIG += c++17

QMAKE_POST_LINK=$(MAKE) install

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    lp_plugin_singa_pc.cpp

HEADERS += \
    LP_Plugin_Singa_PC_global.h \
    lp_plugin_singa_pc.h\

# Default rules for deployment.
target.path = $$OUT_PWD/../App/plugins/$$TARGET
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Functional/release/ -lFunctional
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Functional/debug/ -lFunctional
else:unix:!macx: LIBS += -L$$OUT_PWD/../Functional/ -lFunctional

INCLUDEPATH += $$PWD/../Functional
DEPENDPATH += $$PWD/../Functional

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../OpenMesh/lib/ -lOpenMeshCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../OpenMesh/lib/ -lOpenMeshCored
else:unix:!macx: LIBS += -L$$PWD/../../OpenMesh/lib/ -lOpenMeshCore

INCLUDEPATH += $$PWD/../../OpenMesh/include
DEPENDPATH += $$PWD/../../OpenMesh/include

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Model/release/ -lModel
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Model/debug/ -lModel
else:unix:!macx: LIBS += -L$$OUT_PWD/../Model/ -lModel

INCLUDEPATH += $$PWD/../Model
DEPENDPATH += $$PWD/../Model


INCLUDEPATH += D:/PCL1.11.1/include/pcl-1.11
INCLUDEPATH += D:/PCL1.11.1/3rdParty/Boost/include/boost-1_74
INCLUDEPATH += D:/PCL1.11.1/3rdParty/Eigen/eigen3
INCLUDEPATH += D:/PCL1.11.1/3rdParty/FLANN/include
INCLUDEPATH += D:/PCL1.11.1/3rdParty/OpenNI2/Include
INCLUDEPATH += D:/PCL1.11.1/3rdParty/Qhull/include
INCLUDEPATH += D:/PCL1.11.1/3rdParty/VTK/include/vtk-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_common
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_commond
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_common

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_features
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_featuresd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_features

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_filters
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_filtersd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_filters

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_io
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_iod
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_io

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_io_ply
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_io_plyd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_io_ply

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_kdtree
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_kdtreed
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_kdtree

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_keypoints
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_keypointsd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_keypoints

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_ml
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_mld
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_ml

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_octree
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_octreed
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_octree

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_outofcore
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_outofcored
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_outofcore

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_people
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_peopled
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_people

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_recognition
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_recognitiond
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_recognition

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_registration
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_registrationd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_registration

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_sample_consensus
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_sample_consensusd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_sample_consensus

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_search
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_searchd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_search

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_segmentation
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_segmentationd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_segmentation

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_stereo
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_stereod
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_stereo

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_surface
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_surfaced
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_surface

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_tracking
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_trackingd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_tracking

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_visualization
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/lib/ -lpcl_visualizationd
else:unix: LIBS += -LD:/PCL1.11.1/lib/ -lpcl_visualization

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_atomic-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_atomic-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_atomic-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_bzip2-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_bzip2-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_bzip2-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_chrono-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_chrono-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_chrono-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_container-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_container-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_container-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_context-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_context-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_context-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_contract-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_contract-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_contract-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_coroutine-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_coroutine-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_coroutine-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_date_time-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_date_time-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_date_time-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_exception-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_exception-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_exception-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_fiber-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_fiber-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_fiber-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_filesystem-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_filesystem-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_filesystem-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph_parallel-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph_parallel-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_graph_parallel-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_iostreams-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_iostreams-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_iostreams-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_locale-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_locale-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_locale-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log_setup-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log_setup-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_log_setup-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99f-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99f-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99f-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99l-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99l-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_c99l-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1f-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1f-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1f-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1l-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1l-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_math_tr1l-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_mpi-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_mpi-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_mpi-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_nowide-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_nowide-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_nowide-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_numpy38-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_numpy38-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_numpy38-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_prg_exec_monitor-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_prg_exec_monitor-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_prg_exec_monitor-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_program_options-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_program_options-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_program_options-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_python38-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_python38-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_python38-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_random-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_random-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_random-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_regex-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_regex-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_regex-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_serialization-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_serialization-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_serialization-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_noop-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_noop-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_noop-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg_cached-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg_cached-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_stacktrace_windbg_cached-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_system-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_system-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_system-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_test_exec_monitor-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_test_exec_monitor-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_test_exec_monitor-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_thread-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_thread-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_thread-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_timer-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_timer-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_timer-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_type_erasure-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_type_erasure-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_type_erasure-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_unit_test_framework-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_unit_test_framework-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_unit_test_framework-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wave-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wave-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wave-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wserialization-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wserialization-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_wserialization-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_zlib-vc142-mt-x64-1_74
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_zlib-vc142-mt-gd-x64-1_74
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Boost/lib/ -llibboost_zlib-vc142-mt-x64-1_74

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp_s
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp_s-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_cpp_s

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_s
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_s-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/FLANN/lib/ -lflann_s

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullcpp
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullcpp_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullcpp

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic_r
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic_r_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhullstatic_r

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_p
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_p_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_p

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_r
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_r_d
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/Qhull/lib/ -lqhull_r

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkChartsCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkChartsCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkChartsCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonColor-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonColor-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonColor-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonComputationalGeometry-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonComputationalGeometry-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonComputationalGeometry-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonDataModel-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonDataModel-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonDataModel-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonExecutionModel-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonExecutionModel-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonExecutionModel-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMath-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMath-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMath-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMisc-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMisc-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonMisc-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonSystem-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonSystem-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonSystem-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonTransforms-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonTransforms-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkCommonTransforms-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDICOMParser-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDICOMParser-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDICOMParser-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistry-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistry-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistry-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistryOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistryOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkDomainsChemistryOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkdoubleconversion-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkdoubleconversion-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkdoubleconversion-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexodusII-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexodusII-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexodusII-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexpat-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexpat-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkexpat-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersAMR-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersAMR-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersAMR-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersExtraction-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersExtraction-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersExtraction-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersFlowPaths-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersFlowPaths-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersFlowPaths-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneral-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneral-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneral-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneric-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneric-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeneric-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeometry-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeometry-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersGeometry-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHybrid-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHybrid-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHybrid-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHyperTree-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHyperTree-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersHyperTree-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersImaging-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersImaging-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersImaging-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersModeling-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersModeling-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersModeling-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallel-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallel-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallel-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallelImaging-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallelImaging-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersParallelImaging-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersPoints-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersPoints-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersPoints-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersProgrammable-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersProgrammable-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersProgrammable-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSelection-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSelection-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSelection-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSMP-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSMP-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSMP-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSources-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSources-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersSources-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersStatistics-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersStatistics-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersStatistics-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTexture-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTexture-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTexture-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTopology-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTopology-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersTopology-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersVerdict-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersVerdict-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkFiltersVerdict-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkfreetype-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkfreetype-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkfreetype-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGeovisCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGeovisCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGeovisCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkgl2ps-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkgl2ps-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkgl2ps-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkglew-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkglew-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkglew-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGUISupportMFC-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGUISupportMFC-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkGUISupportMFC-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5_hl-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5_hl-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkhdf5_hl-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingColor-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingColor-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingColor-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingFourier-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingFourier-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingFourier-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingGeneral-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingGeneral-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingGeneral-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingHybrid-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingHybrid-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingHybrid-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMath-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMath-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMath-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMorphological-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMorphological-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingMorphological-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingSources-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingSources-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingSources-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStatistics-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStatistics-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStatistics-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStencil-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStencil-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkImagingStencil-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisLayout-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisLayout-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInfovisLayout-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionImage-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionImage-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionImage-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionStyle-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionStyle-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionStyle-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionWidgets-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionWidgets-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkInteractionWidgets-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAMR-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAMR-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAMR-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAsynchronous-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAsynchronous-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOAsynchronous-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCityGML-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCityGML-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCityGML-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOEnSight-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOEnSight-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOEnSight-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExodus-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExodus-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExodus-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExport-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExport-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExport-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportPDF-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportPDF-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOExportPDF-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOGeometry-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOGeometry-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOGeometry-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImage-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImage-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImage-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImport-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImport-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOImport-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOInfovis-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOInfovis-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOInfovis-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLegacy-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLegacy-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLegacy-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLSDyna-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLSDyna-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOLSDyna-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMINC-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMINC-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMINC-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMovie-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMovie-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOMovie-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIONetCDF-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIONetCDF-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIONetCDF-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallel-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallel-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallel-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallelXML-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallelXML-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOParallelXML-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOPLY-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOPLY-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOPLY-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSegY-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSegY-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSegY-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSQL-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSQL-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOSQL-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOTecplotTable-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOTecplotTable-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOTecplotTable-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVeraOut-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVeraOut-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVeraOut-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVideo-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVideo-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOVideo-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXML-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXML-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXML-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXMLParser-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXMLParser-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkIOXMLParser-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjpeg-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjpeg-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjpeg-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjsoncpp-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjsoncpp-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkjsoncpp-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibharu-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibharu-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibharu-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibxml2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibxml2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklibxml2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklz4-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklz4-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklz4-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklzma-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklzma-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtklzma-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkmetaio-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkmetaio-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkmetaio-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkNetCDF-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkNetCDF-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkNetCDF-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkogg-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkogg-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkogg-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkParallelCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkParallelCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkParallelCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpng-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpng-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpng-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkproj-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkproj-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkproj-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpugixml-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpugixml-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkpugixml-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingAnnotation-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingAnnotation-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingAnnotation-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContext2D-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContext2D-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContext2D-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContextOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContextOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingContextOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingExternal-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingExternal-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingExternal-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingFreeType-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingFreeType-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingFreeType-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingGL2PSOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingGL2PSOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingGL2PSOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingImage-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingImage-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingImage-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLabel-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLabel-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLabel-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLOD-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLOD-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingLOD-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolume-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolume-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolume-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolumeOpenGL2-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolumeOpenGL2-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkRenderingVolumeOpenGL2-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksqlite-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksqlite-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksqlite-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksys-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksys-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtksys-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktheora-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktheora-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktheora-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktiff-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktiff-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtktiff-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkverdict-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkverdict-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkverdict-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsContext2D-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsContext2D-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsContext2D-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsCore-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsCore-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsCore-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsInfovis-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsInfovis-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkViewsInfovis-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkzlib-8.2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkzlib-8.2-gd
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/VTK/lib/ -lvtkzlib-8.2

win32:CONFIG(release, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/OpenNI2/Lib/ -lOpenNI2
else:win32:CONFIG(debug, debug|release): LIBS += -LD:/PCL1.11.1/3rdParty/OpenNI2/Lib/ -lOpenNI2
else:unix: LIBS += -LD:/PCL1.11.1/3rdParty/OpenNI2/Lib/ -lOpenNI2

