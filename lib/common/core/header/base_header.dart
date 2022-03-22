import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_shopee_lite/common/core/base_image.dart';
import 'package:app_shopee_lite/common/core/header/base_header_controller.dart';
import 'package:app_shopee_lite/common/export_this.dart';

class BaseHeader extends GetWidget<BaseHeaderController> {
  final _controller = Get.lazyPut(() => BaseHeaderController());
  @override
  Widget build(BuildContext context) {
    return BaseResponsive(
      largeScreen: Column(
        children: [
          banner0(),
          row0(),
        ],
      ),
    );
  }

  Widget banner0() {
    return Obx(
      () => Visibility(
        visible: controller.visibleBanner0.value,
        child: Container(
          decoration: const BoxDecoration(color: ColorResource.primary),
          child: Stack(
            children: [
              BaseImage.network(),
              Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: () => controller.visibleBanner0.value = false,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.clear, color: Colors.white, size: 8),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget row0() {
    return Row(
      children: [],
    );
  }
}
