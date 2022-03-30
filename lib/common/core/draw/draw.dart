import 'package:dop_xtel/system/model/drawn_line.dart';
import 'package:flutter/material.dart';


class Draw extends CustomPainter {
  List<DrawnLine> lines = [];

  Draw({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0;

    for (int i = 0; i < lines.length; i++) {
      if (lines[i] == null) continue;
      if (lines[i].path != null) {
        for (int j = 0; j < lines[i].path!.length - 1; j++) {
          if (lines[i].path![j] != null &&
              lines[i].path![j + 1] != null) {
            canvas.drawLine(
                lines[i].path![j], lines[i].path![j + 1], paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
