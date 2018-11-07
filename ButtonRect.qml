import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Rectangle {
    id: buttonRect
    anchors.top: outRect.bottom
    anchors.margins: 100
    width: Screen.width

    property alias hintButton: hintButton
    property alias clearButton: clearButton

    Row {
        id: row
        anchors.centerIn: parent
        spacing: 20
        HintButton {
            id: hintButton
        }
        ClearButton {
            id: clearButton
        }
    }
}
