import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils {
  static Widget space(double w, double h) => SizedBox(width: w, height: h);

  static void hideKeyboard({BuildContext? context}) =>
      FocusScope.of(context ?? Get.context!).unfocus();
}
