import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQuick.Particles 2.0

import "create-component.js" as CreateObject


Button {
    id: root
    text: ""
    width: 50

    height: inRect.height
    anchors.top: parent.top
    property color color: "blue"
    property color backColor: "light blue"
    property string list
    property bool particles2

    //onParticles2Changed: {
    //console.log(particles2)
    //}

    //onListChanged: console.log(list)



    //    onListChanged: {
    //        console.log("list changed")
    //    }

    //onShowParticlesChanged: ok()

    function ok() {
        //console.log("ok")
    }

    Accessible.name: "My button"

    contentItem: Text {
        id: buttonText
        text: root.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: { if ( (parent.width * parent.height / 200) > 20) parent.width * parent.height / 200
            else
                20}
        color: root.color
        anchors.fill: parent
        antialiasing: true
    }

    //    background:  Rectangle {
    //        //anchors.centerIn: parent.Center
    //        implicitHeight: inRect.height
    //        radius: 10
    //        border.color: root.color
    //        color: root.backColor
    //        border.width: 5
    //    }

    background:
        Image {
        source: "qrc:/resources/images/personal_note.png"
        anchors.fill: parent
    }

    onClicked: {
        //root.clearItems()
        //console.log("clicked")

        if (list === "in") {


            //            CreateObject.create("MyComponent.qml", outRect.row, mainRect.itemAdded2,
            //                                text, "out", true)
            mainRect.test(text)
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
            buttonRect.undoButton.enabled = true
            mainRect.checkAnswer()
        }
    }

    ParticleSystem {
        id: particleSystem
    }

    Emitter {
        id: emitter
        //anchors.centerIn: parent
        //width: 160; height: 80
        anchors.fill: parent
        system: particleSystem
        emitRate: 150
        lifeSpan: 500
        lifeSpanVariation: 50
        size: 16
        endSize: 32
        enabled: particles2
        //Tracer { color: 'green' }
    }

    ImageParticle {
        source: "qrc:/resources/images/star.png"
        system: particleSystem
        color: '#FFD700'
        colorVariation: 0.2
        rotation: 0
        rotationVariation: 45
        rotationVelocity: 15
        rotationVelocityVariation: 15
        entryEffect: ImageParticle.Scale
    }
}


