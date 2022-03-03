import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/export_this.dart';

ThemeData appStyle = ThemeManager.getInstance().getTheme();

class ThemeManager {
  ThemeData? _themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorResource.primary,
    primaryColorDark: ColorResource.primary,
    primaryColorLight: ColorResource.primary,
    cardColor: Colors.white,
    indicatorColor: ColorResource.primary,
    textTheme: const TextTheme(
      headline6: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 14),
      headline5: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 16),
      headline4: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 18),
      headline3: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 20),
      headline2: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 22),
      headline1: TextStyle(fontWeight: FontWeight.w900, color: ColorResource.primary, fontSize: 24),
      bodyText1: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 14),
      bodyText2: TextStyle(fontWeight: FontWeight.w400, color: Colors.black54, fontSize: 16),
    ),
  );

  static ThemeManager? _themeManager;

  static ThemeManager getInstance() {
    return _themeManager ??= ThemeManager();
  }

  getTheme() {
    return _themeData;
  }

  setTheme({ThemeData? customTheme}) {
    _themeData = customTheme;
  }
}
