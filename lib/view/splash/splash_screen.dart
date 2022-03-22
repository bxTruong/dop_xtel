import 'package:app_shopee_lite/view/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController>{

  SplashScreen({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(()=> SplashController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}