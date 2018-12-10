import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Item {
    id: rect2

    property alias row: row

//    anchors.top: inRect.bottom
    anchors.top: parent.top
    anchors.margins: 50
    width: Screen.width
    height: 100
    //border.color: "blue"
    //color: "pink"
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 10
    }
}
