import 'package:dop_xtel/common/export_this.dart';
import 'package:dop_xtel/view/main_game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:outlined_text/outlined_text.dart';

class TextLevelComponent extends GetWidget<MainGameController> {
  const TextLevelComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Positioned(
      top: 56,
      right: 0,
      left: 0,
      child: Center(
        child: OutlinedText(
          text: Text(
            controller.gameLoad.value.nameLevel,
            style: const TextStyle(
              color: ColorResource.yellow_text,
              fontSize: 30,
              fontFamily: 'FredokaOne',
              letterSpacing: 1.4,
            ),
          ),
          strokes: [
            OutlinedTextStroke(color: ColorResource.black_text, width: 3),
          ],
        ),
      ),
    ));
  }
}
