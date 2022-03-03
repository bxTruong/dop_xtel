import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/widget/main_view.dart';
import 'package:shop_all_fe/common/export_this.dart';

import 'login_controller.dart';


class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainView(
        title: controller.user.value?.user?.fullName,
        body: BaseView(
          status: controller.status.value,
          content: controller.message.value,
          onSuccess: Center(
            child: Column(
              children: [
                Text(
                  'Đăng nhập thành công',
                  style: appStyle.textTheme.headline1,
                ),
                BaseElevatedButton(
                  onTab: () {},
                  title: 'Elevate Button',
                  borderRadiusValue: 8,
                ),
                BaseTextButton(
                  onTab: () {},
                  title: 'Text Button',
                ),
                BaseOutlinedButton(
                  onTab: () {},
                  title: 'Outlined Button',
                  borderRadiusValue: 30,
                ),
                BaseInkWell(
                  title: 'Click me',
                  borderRadiusValue: 10,
                  onTab: () {},
                ),
                BaseImage.asserts(
                  width: 240,
                  height: 240,
                  path: ImageResource.abc,
                  borderRadiusValue: 8,
                  boxFit: BoxFit.cover
                ),
                const BaseIndicator(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
