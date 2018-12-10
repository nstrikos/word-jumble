import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Item {
    id: rect1

    property alias row: row

    anchors.top: outRect.bottom
    anchors.margins: 50
    width: Screen.width
    height: 100
    Row {
        id: row
        anchors.centerIn: parent
        spacing: 10
    }
}
