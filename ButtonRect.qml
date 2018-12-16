import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Item {
    id: buttonRect
    anchors.top: inRect.bottom
    anchors.topMargin: Window.height / 20
    anchors.bottomMargin: Window.height / 20
    width: Window.width * 8 / 10
    //anchors.leftMargin: Window.width / 10
    //anchors.rightMargin: Window.width / 10
    anchors.horizontalCenter: parent.horizontalCenter

    property alias hintButton: hintButton
    property alias clearButton: clearButton
    property alias undoButton: undoButton

    Row {
        id: row
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: parent.width / 8
        width: parent.width
        HintButton {
            id: hintButton
            width: parent.width / 4
        }
        ClearButton {
            id: clearButton
            width: parent.width / 4
        }
        UndoButton {
            id: undoButton
            width: parent.width / 4
        }
    }
}
