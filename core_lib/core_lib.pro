#-------------------------------------------------
#
# Pencil2D core library
#
#-------------------------------------------------

! include( ../common.pri ) { error( Could not find the common.pri file! ) }

QT += core widgets gui xml xmlpatterns multimedia svg

TEMPLATE = lib
CONFIG += qt staticlib console

RESOURCES += ../pencil.qrc

# i18n
TRANSLATIONS += ../pencil.ts \
                ../pencil2d_it.ts

isEmpty(QMAKE_LRELEASE) {
    win32:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]\lrelease.exe
    else:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease
}
updateqm.input = TRANSLATIONS
updateqm.output = ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qm
isEmpty(vcproj):updateqm.variable_out = PRE_TARGETDEPS
updateqm.commands = $$QMAKE_LRELEASE ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_PATH}/${QMAKE_FILE_BASE}.qm
updateqm.CONFIG += no_link
QMAKE_EXTRA_COMPILERS += updateqm
PRE_TARGETDEPS += compiler_updateqm_make_all


INCLUDEPATH += \
    graphics \
    graphics/bitmap \
    graphics/vector \
    interface \
    structure \
    tool \
    util \
    ui \
    managers

# Input
HEADERS +=  \
    graphics/bitmap/bitmapimage.h \
    graphics/vector/bezierarea.h \
    graphics/vector/beziercurve.h \
    graphics/vector/colourref.h \
    graphics/vector/vectorimage.h \
    graphics/vector/vectorselection.h \
    graphics/vector/vertexref.h \
    interface/backupelement.h \
    interface/colorbox.h \
    interface/colorgrid.h \
    interface/colorgriditem.h \
    interface/colorinspector.h \
    interface/colorpalettewidget.h \
    interface/colorwheel.h \
    interface/displayoptiondockwidget.h \
    interface/editor.h \
    interface/flowlayout.h \
    interface/keycapturelineedit.h \
    interface/mainwindow2.h \
    interface/popupcolorpalettewidget.h \
    interface/preferences.h \
    interface/recentfilemenu.h \
    interface/scribblearea.h \
    interface/shortcutspage.h \
    interface/spinslider.h \
    interface/timecontrols.h \
    interface/timeline.h \
    interface/timelinecells.h \
    interface/toolbox.h \
    interface/tooloptiondockwidget.h \
    managers/basemanager.h \
    managers/colormanager.h \
    managers/layermanager.h \
    managers/toolmanager.h \
    structure/camera.h \
    structure/keyframe.h \
    structure/layer.h \
    structure/layerbitmap.h \
    structure/layercamera.h \
    structure/layerimage.h \
    structure/layersound.h \
    structure/layervector.h \
    structure/object.h \
    structure/objectsaveloader.h \
    tool/basetool.h \
    tool/brushtool.h \
    tool/buckettool.h \
    tool/erasertool.h \
    tool/eyedroppertool.h \
    tool/handtool.h \
    tool/movetool.h \
    tool/penciltool.h \
    tool/pentool.h \
    tool/polylinetool.h \
    tool/selecttool.h \
    tool/smudgetool.h \
    tool/strokemanager.h \
    tool/stroketool.h \
    util/blitrect.h \
    util/fileformat.h \
    util/pencildef.h \
    util/pencilerror.h \
    util/pencilsettings.h \
    util/util.h

SOURCES +=  graphics/bitmap/bitmapimage.cpp \
    graphics/vector/bezierarea.cpp \
    graphics/vector/beziercurve.cpp \
    graphics/vector/colourref.cpp \
    graphics/vector/vectorimage.cpp \
    graphics/vector/vectorselection.cpp \
    graphics/vector/vertexref.cpp \
    interface/backupelement.cpp \
    interface/colorbox.cpp \
    interface/colorgrid.cpp \
    interface/colorgriditem.cpp \
    interface/colorinspector.cpp \
    interface/colorpalettewidget.cpp \
    interface/colorwheel.cpp \
    interface/displayoptiondockwidget.cpp \
    interface/editor.cpp \
    interface/flowlayout.cpp \
    interface/keycapturelineedit.cpp \
    interface/mainwindow2.cpp \
    interface/popupcolorpalettewidget.cpp \
    interface/preferences.cpp \
    interface/recentfilemenu.cpp \
    interface/scribblearea.cpp \
    interface/shortcutspage.cpp \
    interface/spinslider.cpp \
    interface/timecontrols.cpp \
    interface/timeline.cpp \
    interface/timelinecells.cpp \
    interface/toolbox.cpp \
    interface/tooloptiondockwidget.cpp \
    managers/basemanager.cpp \
    managers/colormanager.cpp \
    managers/layermanager.cpp \
    managers/toolmanager.cpp \
    structure/camera.cpp \
    structure/keyframe.cpp \
    structure/layer.cpp \
    structure/layerbitmap.cpp \
    structure/layercamera.cpp \
    structure/layerimage.cpp \
    structure/layersound.cpp \
    structure/layervector.cpp \
    structure/object.cpp \
    structure/objectsaveloader.cpp \
    tool/basetool.cpp \
    tool/brushtool.cpp \
    tool/buckettool.cpp \
    tool/erasertool.cpp \
    tool/eyedroppertool.cpp \
    tool/handtool.cpp \
    tool/movetool.cpp \
    tool/penciltool.cpp \
    tool/pentool.cpp \
    tool/polylinetool.cpp \
    tool/selecttool.cpp \
    tool/smudgetool.cpp \
    tool/strokemanager.cpp \
    tool/stroketool.cpp \
    util/blitrect.cpp \
    util/fileformat.cpp \
    util/pencilerror.cpp \
    util/pencilsettings.cpp

FORMS += \
    interface/mainwindow2.ui \
    interface/shortcutspage.ui \
    interface/colorinspector.ui


win32 {
    SOURCES += external/win32/win32.cpp
    INCLUDEPATH += external/win32
    RC_FILE = ../pencil.rc
}

macx {
    INCLUDEPATH +=  external/macosx
    INCLUDEPATH += . libmacosx
    SOURCES += external/macosx/macosx.cpp
    RC_FILE = ../pencil.icns
}

linux-* {
    INCLUDEPATH += external/linux
    SOURCES += external/linux/linux.cpp
    LIBS += -Lliblinux -lpng -lz
    LIBS += -L/usr/local/zlib/lib
    INCLUDEPATH+=/usr/local/zlib/include
}

# QuaZip
DEFINES += QUAZIP_STATIC
include(external/quazip.pri)
