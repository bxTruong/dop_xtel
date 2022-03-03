import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/widget/base_image.dart';
import 'package:shop_all_fe/common/core/widget/base_indicator.dart';
import 'package:shop_all_fe/common/core/widget/button/base_elevate_button.dart';
import 'package:shop_all_fe/common/core/widget/base_ink_well.dart';
import 'package:shop_all_fe/common/core/widget/base_view.dart';
import 'package:shop_all_fe/common/core/widget/button/base_outlined_button.dart';
import 'package:shop_all_fe/common/core/widget/button/base_text_button.dart';
import 'package:shop_all_fe/common/core/widget/main_view.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';
import 'package:shop_all_fe/common/resource/image_resource.dart';
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
