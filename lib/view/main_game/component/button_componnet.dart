import 'package:dop_xtel/common/resource/image_resource.dart';
import 'package:dop_xtel/view/main_game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../common/export_this.dart';

class ButtonComponent extends GetWidget<MainGameController> {
  const ButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
          visible: !controller.isShowComplete.value,
          child: Positioned(
            bottom: 88,
            right: 0,
            left: 0,
            child: InkWell(
                onTap: () {
                  // controller.isWin.value = !controller.isWin.value;
                  !controller.isWin.value
                      ? controller.showHint()
                      : !controller.isShowComplete.value
                          ? controller.nextLevel()
                          : null;
                },
                child: AnimatedSwitcher(
                  reverseDuration: const Duration(milliseconds: 200),
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, anim) => FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(anim),
                    child: FadeTransition(opacity: anim, child: child),
                  ),
                  child: !controller.isWin.value
                      ? BaseImage.svg(
                          path: ImageResource.ic_button_hint,
                          width: 260,
                          height: 80,
                          key: const ValueKey('icon3'),
                        )
                      : BaseImage.svg(
                          path: ImageResource.ic_button_next,
                          width: 260,
                          height: 80,
                        ),
                )),
          ),
        ));
  }
}
