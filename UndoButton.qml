import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Button {
    id: root
    width: 200
    height: Window.height / 10
    //anchors.top: clearButton.bottom
    anchors.verticalCenter: parent.verticalCenter
    text: "Undo"
    enabled: false
    onClicked: undoClicked()

    contentItem: Text {
        id: buttonText
        text: root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: root.height * root.width / 250
        color: {
            if (enabled === true)
                return "blue"
            else
                return "grey"
        }
        anchors.fill: parent
        antialiasing: true
    }

    background: Rectangle {
        implicitHeight: 100
        radius: 10
        border.color:   {          if (enabled === true)
                return "blue"
            else
                return "grey"
        }
        color:  {          if (enabled === true)
                return "light blue"
            else
                return "light grey"
        }
        border.width: Window.height / 200
    }

    function undoClicked() {
        mainRect.undo()
    }
}
