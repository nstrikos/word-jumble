import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

//Item {
//    id: rect2

//    property alias row: row

////    anchors.top: inRect.bottom
//    anchors.top: parent.top
//    anchors.margins: Window.height / 20
//    width: Screen.width
//    height: Window.height * 2 / 10
//    //border.color: "blue"
//    //color: "pink"
//    Row {
//        id: row
//        width: parent.width
//        anchors.centerIn: parent
//        spacing: 10
//    }
//}

Item {
    id: rect2

    property alias row: row

    anchors.top: parent.top
    anchors.margins: Window.height / 20
    width: Window.width
    height: Window.height * 2 / 10
    Row {
        id: row
        anchors.centerIn: parent
        spacing: Window.width / 100
    }
}
