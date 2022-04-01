import 'package:flutter/material.dart';

class DrawHint extends CustomPainter {
  List truePoint = [];
  Offset positionImage;

  DrawHint(this.truePoint, this.positionImage);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(positionImage.dx, positionImage.dy);
    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;



    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.black;

    for (int i = 0; i < truePoint.length; i++) {
      Path path = Path();
      Offset A = truePoint[i][0];
      Offset B = truePoint[i][1];
      path.moveTo((A.dx + B.dx) / 2, (A.dy + B.dy) / 2);
      path.addOval(
        Rect.fromCircle(
          center: Offset((A.dx + B.dx) / 2, (A.dy + B.dy) / 2),
          radius: 7,
        ),
      );
      canvas.drawPath(path, paintFill);
      canvas.drawPath(path, paintStroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
