import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject


Button {
    id: root
    text: ""
    width: 100

    height: inRect.height
    anchors.top: parent.top
    property color color: "blue"
    property color backColor: "light blue"

    Accessible.name: "My button"

    contentItem: Text {
        id: buttonText
        text: root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 25
        color: root.color
        anchors.fill: parent
        antialiasing: true
    }

    background: Rectangle {
        //anchors.centerIn: parent.Center
        implicitHeight: inRect.height
        radius: 10
        border.color: root.color
        color: root.backColor
        border.width: 5
    }



    onClicked: {
        //root.clearItems()
        CreateObject.create("MyComponent.qml", outRect.row, mainRect.itemAdded2,
                            text)


        var done = false
        var counter = 0
        var letter = text
        while (!done && counter <= inList.count) {
            if (inList.get(counter).text === letter) {
                inList.get(counter).obj.destroy();
                inList.remove(counter);
                done = true
            }
            counter++
        }

        //destroy()
        buttonRect.clearButton.enabled = true
        mainRect.checkAnswer()
    }
}
