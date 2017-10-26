/*
  The MIT License (MIT)

  Copyright (c) 2016 Andrea Scarpino <me@andreascarpino.it>

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    property bool textTo64: true

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu {

            MenuItem {
                text: qsTr("Copy to clipboard")

                onClicked: {
                    Clipboard.text = output.text;
                }
            }

            MenuItem {
                text: qsTr("Clear")

                onClicked: clear()
            }

            MenuItem {
                id: convertMenuItem
                text: qsTr("Base64 to Text")

                onClicked: switchConversion()
            }
        }

        Column {
            id: column
            x: Theme.horizontalPageMargin
            width: parent.width - Theme.horizontalPageMargin * 2

            PageHeader {
                id: header
                title: qsTr("Text to Base64")
            }

            TextArea {
                id: data
                width: parent.width
                placeholderText: qsTr("Any text…")

                EnterKey.enabled: data.text.length > 0
                EnterKey.onClicked: convert();
            }

            Button {
                id: convertButton
                text: qsTr("Encode")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    if (data.text.length > 0) {
                        convert();
                    }
                }
            }

            Text {
                id: output
                width: parent.width
                color: Theme.secondaryColor
                wrapMode: Text.Wrap
            }
        }

        VerticalScrollDecorator {}
    }

    function convert() {
        if (textTo64) {
            output.text = Qt.btoa(data.text);
        } else {
            output.text = Qt.atob(data.text);
        }
    }

    function clear() {
        data.text = "";
        data.forceActiveFocus();
        output.text = "";
    }

    function switchConversion() {
        var previous = header.title;
        header.title = convertMenuItem.text;
        convertMenuItem.text = previous;

        textTo64 = !textTo64;
        if (textTo64) {
            convertButton.text = qsTr("Encode");
        } else {
            convertButton.text = qsTr("Decode");
        }
    }
}
