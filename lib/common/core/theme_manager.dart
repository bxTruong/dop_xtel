import 'package:flutter/material.dart';

ThemeData theme = ThemeManager.getInstance().getTheme();

class ThemeManager {
  static MaterialColor? _primaryColor;

  ThemeData? _themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: _primaryColor,
      primaryColorDark: _primaryColor,
      primaryColorLight: _primaryColor,
      cardColor: Colors.white,
      indicatorColor: _primaryColor,
      textTheme: TextTheme());

  static ThemeManager? _themeManager;

  static ThemeManager getInstance() {
    _primaryColor = Colors.red;
    return _themeManager ??= ThemeManager();
  }

  getTheme() {
    return _themeData;
  }

  setTheme({ThemeData? customTheme}) {
    _themeData = customTheme;
  }
}
