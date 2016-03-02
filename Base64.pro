TARGET = harbour-base64

CONFIG += sailfishapp

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

TRANSLATIONS += translations/harbour-base64-it.ts
