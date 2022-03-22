import 'dart:io';

import 'package:app_shopee_lite/common/constant.dart';
import 'package:app_shopee_lite/common/core/page_manager/key_page.dart';
import 'package:app_shopee_lite/common/core/page_manager/page_manager.dart';
import 'package:app_shopee_lite/common/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'common/core/language/localization_service.dart';

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
      supportedLocales: LocalizationService.locales,
      debugShowCheckedModeBanner: false,
      title: Constant.app_name,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: LocalizationService(),
      initialRoute: KeyPage.initial_page,
      getPages: listPage,
      theme: appTheme,
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
