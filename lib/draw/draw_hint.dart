import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawHint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    List truePoint = [];

    for (int i = 0; i < 4; i++) {
      truePoint.add(<Offset>[
        Offset((i * 40) + 100, (i * 40) + 170),
        Offset((i * 40) + 130, (i * 40) + 200)
      ]);
    }

    for (int i = 0; i < 4; i++) {
      truePoint.add(<Offset>[
        Offset(170 - (i * 40), (i * 40) + 330),
        Offset(200 - (i * 40), (i * 40) + 360)
      ]);
    }

    Paint paintRed = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 3
      ..color = Colors.red;

    for (int i = 0; i < truePoint.length; i++) {
      Path path = Path();
      Offset x1 = truePoint[i][0];
      Offset y1 = truePoint[i][1];
      path.moveTo(x1.dx, x1.dy);
      path.lineTo(y1.dx, x1.dy);
      path.lineTo(y1.dx, y1.dy);
      path.lineTo(x1.dx, y1.dy);
      canvas.drawPath(path, paintRed);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
