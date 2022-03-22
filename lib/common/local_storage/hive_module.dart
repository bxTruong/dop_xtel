import 'dart:convert';

import 'package:hive/hive.dart';

class HiveModule {
  static const String boxName = 'local.data';

  static void install() {
    Hive.openBox(boxName);
  }

  static void putValue(String key, dynamic value) async {
    final Box box = Hive.box(boxName);

    switch (value) {
      case String:
      case double:
      case bool:
      case int:
        await box.put(key, value);
        break;
      default:
        await box.put(key, jsonEncode(value));
        break;
    }
  }

  static dynamic getValue(String key, dynamic defaultValue) {
    final Box box = Hive.box(boxName);
    if (!box.containsKey(key)) {
      throw '$boxName don\'t has $key. Please check $key again';
    }
    switch (defaultValue) {
      case String:
      case double:
      case bool:
      case int:
        return box.get(key, defaultValue: defaultValue);
      default:
        return jsonDecode(box.get(key));
    }
  }
}
