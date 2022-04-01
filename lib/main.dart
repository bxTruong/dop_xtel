import 'dart:io';

import 'package:dop_xtel/common/constant.dart';
import 'package:dop_xtel/common/core/page_manager/key_page.dart';
import 'package:dop_xtel/common/core/page_manager/page_manager.dart';
import 'package:dop_xtel/common/core/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'common/core/language/localization_service.dart';

Future<void> main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
  // full man hinh
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
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
            defaultTransition: Transition.fade,
            debugShowMaterialGrid: false),
      );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
