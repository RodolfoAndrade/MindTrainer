import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.2
import Mnmonic 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout {
        id: mainWindowLayout
        anchors.left: parent.left; anchors.right: parent.right
        spacing: 0
        Button {
            id: button1
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Mnemonic Technique"
            onClicked: {
                popup.open()
                digits.text = mnmonic.generateDigits(1)
            }
        }
        Button {
            id: button2
            anchors.left: parent.left
            anchors.right: parent.right
            text: "Mental Math"
            //onClicked: popup.open()
        }
    }

    Mnmonic {
        id: mnmonic
    }

    Popup {
        id: popup
        width: 200
        height: 300
        modal: true
        focus: true
        anchors.centerIn: parent
        ColumnLayout {
            width: parent.width
            Label {
                Layout.fillWidth: true
                text: "Memorize this sequence of digits using Dominic O'Brien Mnemonic Technique:"
                wrapMode: Text.WordWrap
            }
            TextArea {
                id: digits
                text: "1234"
            }
            Button {
                id: okButton
                text: "OK"
                onClicked: {
                    digits.clear()
                    okButton.visible = false
                    checkButton.visible = true
                    result.text = ""
                    //mnemonicTrainer.close()
                }
            }
            Button {
                id: checkButton
                text: "Check"
                visible: false
                onClicked: {
                    result.text = mnmonic.checkDigits(digits.text) ? "Correct! Play it again!" : "Wrong! Try again!"
                    digits.text = mnmonic.generateDigits(1)
                    okButton.visible = true
                    checkButton.visible = false
                }
            }
            Label {
                id: result
            }
        }
    }
}
