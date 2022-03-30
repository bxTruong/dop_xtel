import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/page_manager/key_page.dart';
import 'package:shop_all_fe/view/login/login_page.dart';
import 'package:shop_all_fe/view/splash/splash_page.dart';

List<GetPage> listPage = [
  GetPage(name: KeyPage.initial_page, page: () => SplashPage()),
  GetPage(name: KeyPage.login_page, page: () => LoginPage()),
];
