import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: root
    visible: true
    width: Qt.platform.os == "Android" ? Screen.width : 480
    height: Qt.platform.os == "Android" ? Screen.height : 640
    title: qsTr("Qt Android Demo")

    property int dpi: Screen.pixelDensity * 25.4


    ColumnLayout {

        anchors.fill: parent
        spacing: 10

        Rectangle {
            id: appBar
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 80
            color : "#40C0FF"
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 0
                verticalOffset: 0
            }
            Text {
                anchors.fill: parent
                anchors.leftMargin: 10
                text: qsTr("Qt Android Demo ")
                font.pixelSize: 40
                color:"white"
                verticalAlignment: Text.AlignVCenter
            }
        }

        Flickable {
            id: flickArea
           Layout.fillHeight: true
           Layout.fillWidth: true
        }
    }

    Image {
        id: fab
        anchors.bottom: parent.bottom
        anchors.right : parent.right
        anchors.margins: 20
        source: "qrc:/heart.png"
        width: 96; height: 96
        fillMode: Image.PreserveAspectFit
        //or use Rectangle
        //        radius: 32
        //        color: "yellow"
        //        height: 64
        //        width: 64
        MouseArea {
            anchors.fill: fab

            onClicked: {
                console.log("fab clicked")
                toast.show("Show some message")
            }
        }
    }
    DropShadow {
        anchors.fill: fab
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "gray"
        source: fab
    }
    Toast {
        id: toast
        anchors.bottom: parent.bottom
    }

}
