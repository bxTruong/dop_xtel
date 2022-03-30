import 'package:dop_xtel/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController>{

  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(()=> LoginController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}