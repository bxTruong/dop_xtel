import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/page_manager/key_page.dart';
import 'package:shop_all_fe/common/core/page_manager/page_manager.dart';
import 'package:shop_all_fe/common/export_this.dart';

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      supportedLocales: const <Locale>[Locale('vi', 'VN'), Locale('en', 'EN')],
      debugShowCheckedModeBanner: false,
      title: 'Base flutter',
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute: KeyPage.initial_page,
      getPages: listPage,
      theme: theme,
      enableLog: true,
      defaultTransition: Transition.size,
      debugShowMaterialGrid: false);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
