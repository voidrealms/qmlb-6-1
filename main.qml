import QtQuick 2.12
import QtQuick.Window 2.12

//Transformations, its about transforming the objects appearance through changes

//Positioning X / Y
// https://doc.qt.io/qt-5/qml-qtquick-propertyanimation.html

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    id: root

    Rectangle {
        id: myShape
        color: "red"
        width: 100
        height: 100
        x: 0
        y: (parent.height / 2) - (height / 2)

        PropertyAnimation {
            id: animationRight
            target: myShape
            property: "x"
            to: root.width - myShape.width
            duration: 2000
        }

        PropertyAnimation {
            id: animationLeft
            target: myShape
            property: "x"
            to: 0
            duration: 1000
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(myShape.x === 0) {
                    animationRight.start()
                } else {
                    animationLeft.start()
                }
            }
        }
    }
}
