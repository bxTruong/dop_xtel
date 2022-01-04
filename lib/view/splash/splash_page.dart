import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/splash/splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {
  SplashPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseResponsive(
        mediumScreen: Obx(
          () => BaseSmartRefresh(
            controller: controller.baseRefreshController,
            itemCount: controller.listTest.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  controller.listTest[index],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
