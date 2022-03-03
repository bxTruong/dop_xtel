import 'package:flutter/material.dart';

class ColorResource {
  // color default của chữ
  static const Color primary = Colors.red;
  // color  appbar, button, effect của button mặc định
  static const MaterialColor primarySwatch = Colors.green;
  // color effect của Inkwell
  static  Color colorSplash = primarySwatch.withAlpha(100);
  // color effect background của Inkwell
  static  Color colorHighLight= primarySwatch.withAlpha(50);
}
