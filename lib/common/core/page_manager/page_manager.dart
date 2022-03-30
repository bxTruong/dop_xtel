import 'package:dop_xtel/common/core/page_manager/key_page.dart';
import 'package:dop_xtel/view/main_game/main_game_page.dart';
import 'package:dop_xtel/view/splash/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage> listPage = [
  GetPage(name: KeyPage.initial_page, page: () => SplashScreen()),
  GetPage(name: KeyPage.main_game_page, page: () => MainGamePage()),
];
