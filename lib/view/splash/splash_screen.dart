import 'package:dop_xtel/view/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashController>{

  SplashScreen({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(()=> SplashController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}