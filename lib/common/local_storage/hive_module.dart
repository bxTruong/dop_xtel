import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveModule {
  static const String boxName = 'local.data';

  static Future<void> install() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox(boxName);
  }

  static Future<void> putValue(String key, dynamic value) async {
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
      return null;
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
