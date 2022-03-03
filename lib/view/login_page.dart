import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/widget/base_textformfield.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());
  final _key = GlobalKey();

  @override
  Widget buildSuccess() {
    return Container(
      child: Center(
        child: Column(
          children: [
            // Text(
            //   'Đăng nhập thành công',
            //   style: appStyle.textTheme.headline1,
            // ),
            // BaseElevatedButton(
            //   onTab: () {},
            //   title: 'Elevate Button',
            //   borderRadiusValue: 8,
            // ),
            // BaseTextButton(
            //   onTab: () {},
            //   title: 'Text Button',
            // ),
            // BaseOutlinedButton(
            //   onTab: () {},
            //   title: 'Outlined Button',
            //   borderRadiusValue: 30,
            // ),
            // BaseInkWell(
            //   title: 'Click me',
            //   borderRadiusValue: 10,
            //   dottedDecoration: DottedDecoration(
            //     shape: Shape.box,
            //     dash: <int>[1, 4],
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   onTab: () {},
            // ),
            // BaseImage.asserts(
            //     width: 240,
            //     height: 240,
            //     path: ImageResource.abc,
            //     borderRadiusValue: 8,
            //     boxFit: BoxFit.cover),
            BaseTextFormField(
              editingController: TextEditingController(),

            ),
          ],
        ),
      ),
    );
  }
}
