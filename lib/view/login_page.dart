import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/base_view.dart';
import 'package:shop_all_fe/common/core/main_view.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';
import 'package:shop_all_fe/view/login_controller.dart';

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
                TextButton(
                  onPressed: controller.showNotification,
                  child: Text(
                    'Click me',
                    style: appStyle.textTheme.headline4,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
