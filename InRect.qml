import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Item {
    id: rect1

    property alias row: row

    anchors.top: outRect.bottom
    anchors.margins: Window.height / 20
    width: Window.width
    height: Window.height * 2 / 10

    Row {
        id: row
        anchors.centerIn: parent
        spacing: Window.width / 100
    }
}
