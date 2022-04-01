import 'dart:developer';

import 'package:dop_xtel/system/model/drawn_line.dart';
import 'package:flutter/material.dart';

class DrawRegion extends CustomPainter {
  List truePoint = [];
  Offset positionImage;
  List<DrawnLine> lines = [];

  DrawRegion(this.truePoint, this.positionImage, this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(positionImage.dx - 20, positionImage.dy - 20);
    Paint paintRed = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.yellow;

    List xList = <double>[];
    List yList = <double>[];
    for (var element in truePoint) {
      Offset A = element[0];
      Offset B = element[1];

      xList.add(A.dx);
      xList.add(B.dx);

      yList.add(A.dy);
      yList.add(B.dy);
    }

    double yMax = yList[0];
    double yMin = yList[0];
    double xMax = xList[0];
    double xMin = xList[0];

    for (var element in xList) {
      if (element > xMax) {
        xMax = element;
      }
      if (xMin > element) {
        xMin = element;
      }
    }
    for (var element in yList) {
      if (element > yMax) {
        yMax = element;
      }
      if (yMin > element) {
        yMin = element;
      }
    }

    Rect square =
        Rect.fromLTWH(xMin, yMin, (xMax - xMin) + 40, (yMax - yMin) + 40);

    canvas.drawRect(square, paintRed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
