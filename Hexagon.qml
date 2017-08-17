import QtQuick 2.7

Item {
    id: root
    property color bordercolor: "black"
    property color fillcolor: "gray"
    Canvas {
        id:canvas
        anchors.fill: parent
        antialiasing: true
        property real r : canvas.width/2

        onPaint:{
            var ctx = canvas.getContext('2d');
            ctx.beginPath();
            ctx.lineWidth = 2;
            ctx.strokeStyle = bordercolor;
            drawHexagon(ctx, r, r, r, 6, Math.PI / 2);
            ctx.fillStyle = fillcolor;
            ctx.fill();
            ctx.stroke()
        }
    }

    function drawHexagon(ctx, x, y, radius, sides, startAngle, anticlockwise) {
        if (sides < 3) return;
        var a = (Math.PI * 2)/sides;
        a = anticlockwise?-a:a;
        ctx.save();
        ctx.translate(x,y);
        ctx.rotate(startAngle);
        ctx.moveTo(radius,0);
        for (var i = 1; i < sides; i++) {
            ctx.lineTo(radius*Math.cos(a*i),radius*Math.sin(a*i));
        }
        ctx.closePath();
        ctx.restore();
    }

    Component.onCompleted: {
        canvas.requestPaint()
        //console.log("painted")
    }

    //  MouseArea {
    //      x: 0
    //      y: r - Math.sin((Math.PI * 2) / 8) * r
    //      width: parent.width
    //      height: r * 2 - y
    //  }

}
