import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Button {
    id: root
    width: 200
    //anchors.top: clearButton.bottom
    text: "Hint"
    enabled: false
    onClicked: hintClicked()

    contentItem: Text {
        id: buttonText
        text: root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 25
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
        border.width: 5
    }

    function hintClicked() {
        mainRect.clearItems()
        mainRect.letter = mainRect.word.charAt(mainRect.hintsUsed)
        mainRect.hintsUsed++
        //console.log("Hints used: ", hintsUsed)
        //console.log("Hints available: ", hintsAvail)
        //if (hintsUsed < hintsAvail - 2)
        //    hintButton.enabled = true
        //else
        //    hintButton.enabled = false
        var done = false
        mainRect.counter = 0
        while (!done && mainRect.counter <= inList.count) {
            if (inList.get(mainRect.counter).text === mainRect.letter) {
                inList.get(mainRect.counter).obj.destroy();
                inList.remove(mainRect.counter);
                CreateObject.create("MyComponent.qml", outRect.row, mainRect.itemAdded2,
                                    mainRect.letter)
                done = true
            }
            mainRect.counter++
        }
        var position = mainRect.targetString.indexOf(mainRect.letter)
        mainRect.targetString = mainRect.targetString.slice(0, position) +
                mainRect.targetString.slice(position + 1, mainRect.targetString.length)
        //console.log(targetString)
        mainRect.checkAnswer()
        clearButton.enabled = false
    }
}
