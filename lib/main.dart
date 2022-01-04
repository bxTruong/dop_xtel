import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/page_manager/key_page.dart';
import 'package:shop_all_fe/common/core/page_manager/page_manager.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';

import 'common/core/language/localization_service.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laptop VN',
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute: KeyPage.initial_page,
      getPages: listPage,
      theme: ThemeManager.lightTheme,
      enableLog: true,
      defaultTransition: Transition.size,
      debugShowMaterialGrid: false);
}
