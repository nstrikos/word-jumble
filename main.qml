import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtMultimedia 5.9
import "create-component.js" as CreateObject

Window {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")

    Timer {
        id: timer
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
            for (var i = 0; i < outList.count; i++) {
                var obj = outList.get(i).obj
                obj.particles2 = false
            }
        }
    }

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
        anchors.fill: parent

        function test(text)
        {
            console.log("test")

            CreateObject.create("MyComponent.qml", outRect.row, itemAdded2,
                                text, "out", true)
        }

        Image {
            source: "qrc:/resources/images/backdrop-background-orange-132197.jpg"
            anchors.fill: parent
        }

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

        OutRect {
            id: outRect
            anchors.top: backButton.bottom
        }

        InRect {
            id: inRect
            //anchors.top: backButton.bottom
        }

        ButtonRect {
            id: buttonRect
        }

        SoundEffect {
            id: soundEffect
            source: "qrc:/resources/sounds/success.wav"
        }

        SoundEffect {
            id: soundEffect2
            source: "qrc:/resources/sounds/right.wav"
        }


        function addButton() {
            targetString = myClass.jumble
            word = myClass.word
            hintsAvail = word.length
            hintsUsed = 0
            buttonRect.hintButton.enabled = true
            buttonRect.undoButton.enabled = false
            for (counter = 0; counter < targetString.length; counter++) {
                CreateObject.create("MyComponent.qml", inRect.row, itemAdded,
                                    targetString.charAt(counter), "in", false)
            }
        }

        function itemAdded(obj, source, text, hint, list, particles) {
            inList.append({"obj": obj, "source": source, "text": text, "list": list, "particles": particles})
            obj.list = "in"
            //obj.particles = false
        }

        function itemAdded2(obj, source, text, hint, list, particles) {
            outList.append({"obj": obj, "source": source, "text": text, "list": list, "particles": particles})
            obj.list = "out"
            //obj.color = "red"
            //obj.backColor = "light yellow"
            //obj.particles = false
            if (hintsUsed < hintsAvail - 1)
                buttonRect.hintButton.enabled = true
            else
                buttonRect.hintButton.enabled = false


            buttonRect.clearButton.enabled = true
        }

        function itemAdded3(obj, source, text, hint, list) {
            inList.insert(0, {"obj": obj, "source": source, "text": text, "list": list})
            obj.list = "in"
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
            buttonRect.undoButton.enabled = false
        }

        function undo() {
            if (outList.count > hintsUsed) {
                var letter = outList.get(outList.count - 1).obj.text;
                outList.get(outList.count - 1).obj.destroy();
                outList.remove(outList.count - 1)

                CreateObject.create("MyComponent.qml", inRect.row, itemAdded3,
                                    letter, "in")
            }
            if (outList.count <= hintsUsed) {
                buttonRect.undoButton.enabled = false
                buttonRect.clearButton.enabled = false
            }
        }

        function checkAnswer() {

            var obj = outList.get(outList.count - 1).obj
            var letter = obj.text
            var test = word[outList.count - 1]
            if (letter === test) {
                soundEffect2.play()
                obj.particles2 = true
                timer.start()
            }



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
                    soundEffect.play()
                    buttonRect.clearButton.enabled = false
                    addButton()
                }
            }
        }

        Component.onCompleted: addButton()
    }
}
