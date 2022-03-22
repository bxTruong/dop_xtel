import 'package:app_shopee_lite/common/core/page_manager/key_page.dart';
import 'package:app_shopee_lite/view/login/login_screen.dart';
import 'package:app_shopee_lite/view/splash/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> listPage = [
  GetPage(name: KeyPage.initial_page, page: () => SplashScreen()),
  GetPage(name: KeyPage.login_page, page: () => LoginScreen()),
];
