import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/drawn_line.dart';

class MainGameController extends GetxController {
  var isWin = false.obs;
  var line = DrawnLine().obs;
  var lines = <DrawnLine>[].obs;

  List collisionList = [];
  List truePoint = [];

  @override
  void onInit() {
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
    super.onInit();
  }

  List checkCollide(Offset x) {
    for (int i = 0; i < truePoint.length; i++) {
      List z = truePoint[i];
      if ((x.dy >= z[0].dy) &&
          (x.dx >= z[0].dx) &&
          (x.dx <= z[1].dx) &&
          (x.dy <= z[1].dy)) {
        return z;
      }
    }
    return [];
  }

  void collideWithTruePoint() {
    List maskReverse = truePoint.reversed.toList();

    if (const IterableEquality().equals(collisionList, truePoint) ||
        const IterableEquality().equals(collisionList, maskReverse)) {
      print('Win');
    }
  }

  void clearDraw(){
    Timer(const Duration(milliseconds: 300), () {
      lines.clear();
      line.value=DrawnLine();
    });

  }
}
