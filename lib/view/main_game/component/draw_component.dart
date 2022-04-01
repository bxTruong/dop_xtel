import 'dart:developer';

import 'package:dop_xtel/common/core/draw/draw.dart';
import 'package:dop_xtel/system/model/drawn_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../main_game_controller.dart';

class DrawComponent extends GetWidget<MainGameController> {
  const DrawComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCurrentPath();
  }

  Widget buildCurrentPath() {
    return Obx(() => Visibility(
      visible: !controller.isWin.value,
      child: GestureDetector(
            onPanStart: onPanStart,
            onPanUpdate: onPanUpdate,
            onPanEnd: onPanEnd,
            child: RepaintBoundary(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: CustomPaint(painter: Draw(lines: [controller.line.value])),
              ),
            ),
          ),
    ));
  }

  void onPanStart(DragStartDetails details) {
    RenderBox? box = Get.context!.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);
    controller.line.value = DrawnLine(
      path: [point],
      color: Colors.black,
      width: 5,
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = Get.context!.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

      List<Offset> path = List.from(controller.line.value.path!)
        ..add(point);
      controller.line.value =
          DrawnLine(path: path, color: Colors.black, width: 5);

     controller.checkListCollide(point);
    log('UPDATE $point');
  }

  void onPanEnd(DragEndDetails details) {
    controller.lines.value = List.from(controller.lines)
      ..add(controller.line.value);
    controller.checkWin();
    controller.clearDraw();

    log('END ${controller.lines.value}');
  }
}
