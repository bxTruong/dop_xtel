import 'package:dop_xtel/common/export_this.dart';
import 'package:dop_xtel/common/module/ad_helper.dart';
import 'package:dop_xtel/view/main_game/component/draw_component.dart';
import 'package:dop_xtel/view/main_game/component/draw_hint_component.dart';
import 'package:dop_xtel/view/main_game/component/text_level_component.dart';
import 'package:dop_xtel/view/main_game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';

import '../../common/core/base_view.dart';
import 'component/button_componnet.dart';
import 'component/image_component.dart';
import 'component/setting_button_component.dart';

class MainGamePage extends GetWidget<MainGameController> {
  final _controller = Get.lazyPut(() => MainGameController());

  MainGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.background,
      body: BaseView(
        onSuccess: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  const ImageComponent(),
                  const DrawTruePointComponent(),
                  confetti(),
                  Positioned(top: Get.width / 4, right: 32, child: complete()),
                  const DrawComponent(),
                  const TextLevelComponent(),
                  const ButtonComponent(),
                  const SettingButtonComponent(),
                  Obx(() => controller.isLoadAds.value
                      ? Positioned(
                          bottom: 0,
                          child: SizedBox(
                              width: AdHelper.bannerAd!.size.width.toDouble(),
                              height: AdHelper.bannerAd!.size.height.toDouble(),
                              child: AdWidget(ad: AdHelper.bannerAd!)),
                        )
                      : Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget confetti() {
    return Obx(() => Visibility(
          visible: controller.isShowConfetti.value,
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Lottie.asset('assets/ani/confetti.json'),
          ),
        ));
  }

  Widget complete() {
    return Obx(() => Visibility(
          visible: controller.isShowComplete.value,
          child: SizedBox(
            width: Get.width / 2,
            height: Get.height / 2,
            child: Lottie.asset('assets/ani/complete.json'),
          ),
        ));
  }
}
