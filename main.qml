import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import "create-component.js" as CreateObject

Window {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")

    Rectangle {
        id: introRect
        anchors.fill: parent
        color: "light yellow"
        opacity: 1.0
        Button {
            //text: "Play"
            anchors.centerIn: parent
            onClicked: {
                introRect.enabled = false
                mainRect.enabled = true
                introRect.opacity = 0
                mainRect.opacity = 1
            }

            contentItem: Text {
                //id:
                text: "Play"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25
                color: "blue"
                anchors.fill: parent
                antialiasing: true
            }

            background: Rectangle {
                //anchors.centerIn: parent.Center
                implicitHeight: 100
                implicitWidth: 100
                radius: 10
                border.color: "blue"
                color: "light blue"
                border.width: 5
            }
        }

        Behavior on opacity {
            NumberAnimation { duration: 800 }
        }
    }

    Rectangle {
        id: mainRect
        //visible: false
        enabled: false
        opacity: 0

        property string targetString : "lets do it"
        property string word
        property string answer
        property string letter
        property int counter : 0
        property int hintsAvail
        property int hintsUsed

        Behavior on opacity {
            NumberAnimation { duration: 800 }
        }

        ListModel {
            id: inList
        }

        ListModel {
            id: outList
        }

        Button {
            id: backButton
            text: "Back"
            onClicked: {
                mainRect.opacity = 0
                introRect.opacity = 1
                mainRect.enabled = false
                introRect.enabled = true
            }

            contentItem: Text {
                //id:
                text: "Back"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25
                color: "blue"
                anchors.fill: parent
                antialiasing: true
            }

            background: Rectangle {
                //anchors.centerIn: parent.Center
                implicitHeight: 100
                implicitWidth: 100
                radius: 10
                border.color: "blue"
                color: "light blue"
                border.width: 5
            }
        }

        InRect {
            id: inRect
            anchors.top: backButton.bottom
        }

        OutRect {
            id: outRect
        }

        ButtonRect {
            id: buttonRect
        }


        function addButton() {
            targetString = myClass.jumble
            word = myClass.word
            hintsAvail = word.length
            hintsUsed = 0
            buttonRect.hintButton.enabled = true
            for (counter = 0; counter < targetString.length; counter++) {
                CreateObject.create("MyComponent.qml", inRect.row, itemAdded,
                                    targetString.charAt(counter))
            }
        }

        function itemAdded(obj, source, text, hint) {
            inList.append({"obj": obj, "source": source, "text": text})
        }

        function itemAdded2(obj, source, text, hint) {
            outList.append({"obj": obj, "source": source, "text": text})
            obj.color = "red"
            obj.backColor = "light yellow"
            if (hintsUsed < hintsAvail - 1)
                buttonRect.hintButton.enabled = true
            else
                buttonRect.hintButton.enabled = false


            buttonRect.clearButton.enabled = true
        }

        function clearItems() {
            while(outList.count > hintsUsed) {
                outList.get(outList.count - 1).obj.destroy();
                outList.remove(outList.count - 1);
            }
            while(inList.count > 0) {
                inList.get(0).obj.destroy();
                inList.remove(0);
            }
            hintsAvail = word.length
            if (hintsUsed < hintsAvail)
                buttonRect.hintButton.enabled = true
            else
                buttonRect.hintButton.enabled = false
            for (counter = 0; counter < targetString.length; counter++) {
                CreateObject.create("MyComponent.qml", inRect.row, itemAdded,
                                    targetString.charAt(counter))
            }

            buttonRect.clearButton.enabled = false
        }

        function checkAnswer() {
            if (outList.count === word.length) {
                console.log("Length is equal!")

                answer = ""
                for (counter = 0; counter < outList.count; counter++) {
                    answer = answer.concat(outList.get(counter).text)
                }

                if (answer === word) {
                    //firstButton.enabled = true
                    buttonRect.hintButton.enabled = false
                    console.log("Ok")
                    while(outList.count > 0) {
                        outList.get(0).obj.destroy();
                        outList.remove(0);
                    }
                    while(inList.count > 0) {
                        inList.get(0).obj.destroy();
                        inList.remove(0);
                    }
                    buttonRect.clearButton.enabled = false
                    addButton()
                }
            }
        }

        Component.onCompleted: addButton()
    }
}
