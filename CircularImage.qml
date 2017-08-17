//Qml Circle Image
//CREDIT: https://codegists.com/code/qml-circle-image/

import QtQuick 2.0
import QtGraphicalEffects 1.0
 
Image {
    id: control
 
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: control.width
            height: control.height
            Rectangle {
                anchors.centerIn: parent
                height: Math.min(control.width, control.height)
                width: height
                radius: Math.min(width, height)
            }
        }
    }
}