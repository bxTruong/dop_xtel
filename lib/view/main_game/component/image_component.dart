import 'package:dop_xtel/view/main_game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageComponent extends GetWidget<MainGameController> {
  const ImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: controller.isWin.value ? 1 : 0,
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: buildImageSuccess(),
              ),
            ),
          ),
          Center(
            child: Visibility(
              visible: !controller.isWin.value,
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: buildImageFail(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageSuccess() {
    return Image.asset(controller.gameLoad.value.imageSuccess);
  }

  Widget buildImageFail() {
    return Container(
        key: controller.keyImage,
        child: Image.asset(
          controller.gameLoad.value.imageFail,
          fit: BoxFit.fitWidth,
        ));
  }
}
