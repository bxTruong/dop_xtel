import 'package:app_shopee_lite/common/core/widget/base_textformfield.dart';
import 'package:app_shopee_lite/common/core/widget/button/base_text_button.dart';
import 'package:app_shopee_lite/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController>{

  LoginScreen({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(()=> LoginController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseTextFormField(editingController: controller.userName,hint: 'Tài khoản',),
        BaseTextFormField(editingController: controller.userName,hint: 'Mật khẩu',),
        BaseTextButton(title: 'Đăng nhập',onTab: ()=> null,)
      ],
    );
  }

}