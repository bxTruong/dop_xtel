import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/view/login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());
  final _key = GlobalKey();

  @override
  Widget buildSuccess() {
    return Container(
      child: Text('Thành công'),
    );
  }
}
