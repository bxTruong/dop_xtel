import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/export_this.dart';

ThemeData appTheme = ThemeManager.getInstance().getTheme();

class ThemeManager {
  ThemeData? _themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorResource.primary,
      primaryColorDark: ColorResource.primary,
      primaryColorLight: ColorResource.primary,
      cardColor: Colors.white,
      indicatorColor: ColorResource.primary,
      textTheme: TextTheme());

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
