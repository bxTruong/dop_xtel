import 'package:dop_xtel/common/core/draw/draw_hint.dart';
import 'package:dop_xtel/common/core/draw/draw_true_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_game_controller.dart';

class DrawTruePointComponent extends GetWidget<MainGameController> {
  const DrawTruePointComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          children: [
            CustomPaint(
              painter: DrawTruePoint(
                controller.truePointDraw,
                controller.offsetImage.value,
              ),
            ),
            controller.isShowHint.value
                ? CustomPaint(
                    painter: DrawHint(
                      controller.truePointDraw,
                      controller.offsetImage.value,
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
