import 'package:flutter/material.dart';

class DrawTruePoint extends CustomPainter {
  List truePoint = [];
  Offset positionImage;

  DrawTruePoint(this.truePoint, this.positionImage);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(positionImage.dx, positionImage.dy);
    Paint paintRed = Paint()
      ..style = PaintingStyle.fill
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
