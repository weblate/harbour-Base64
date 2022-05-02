TARGET = harbour-base64

CONFIG += sailfishapp

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

SOURCES += \
    src/main.cpp

OTHER_FILES += \
    qml/cover/CoverPage.qml \
    qml/Base64.qml \
    qml/pages/MainPage.qml \
    harbour-base64.desktop \
    rpm/harbour-base64.changes \
    rpm/harbour-base64.spec \
    rpm/harbour-base64.yaml \
    translations/*.ts

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/harbour-base64-de.ts \
    translations/harbour-base64-eo.ts \
    translations/harbour-base64-et.ts \
    translations/harbour-base64-fi.ts \
    translations/harbour-base64-fr.ts \
    translations/harbour-base64-gl.ts \
    translations/harbour-base64-he.ts \
    translations/harbour-base64-hr.ts \
    translations/harbour-base64-it.ts \
    translations/harbour-base64-nb_NO.ts \
    translations/harbour-base64-pl.ts \
    translations/harbour-base64-sr.ts \
    translations/harbour-base64-sv.ts \
    translations/harbour-base64-tr.ts \
    translations/harbour-base64-zh_Hans.ts \
    translations/harbour-base64-zh_Hant.ts
