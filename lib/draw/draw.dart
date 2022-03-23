import 'package:flutter/material.dart';

import '../model/drawn_line.dart';

class Draw extends CustomPainter {
  List<DrawnLine> lines = [];

  Draw({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
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
