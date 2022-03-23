import 'dart:developer';

import 'package:dop_xtel/draw/draw.dart';
import 'package:dop_xtel/draw/draw_hint.dart';
import 'package:dop_xtel/view/draw_componet.dart';
import 'package:dop_xtel/view/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/drawn_line.dart';

class MainGamePage extends GetWidget<MainGameController> {
  final _controller = Get.lazyPut(() => MainGameController());

  MainGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            // AnimatedOpacity(
            //     duration: const Duration(milliseconds: 0),
            //     opacity: controller.isWin.value ? 1 : 0,
            //     child: Center(child: buildImageSuccess())),
            // //Center(child: buildImageHint()),
            // Visibility(
            //     visible: !controller.isWin.value,
            //     child: Center(child: buildImageFail())),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: DrawHint(),
              ),
            ),
            //buildAllPath(),
            Visibility( visible: !controller.isWin.value,child: const DrawComponent()),
          ],
        ),
      ),
    );
  }

  Widget buildImageSuccess() {
    return Image.asset('assets/image/anh2.jpg');
  }

  Widget buildImageFail() {
    return Image.asset('assets/image/anh1.jpg');
  }

  Widget buildImageHint() {
    return Image.asset('assets/image/2.jpg');
  }


}
