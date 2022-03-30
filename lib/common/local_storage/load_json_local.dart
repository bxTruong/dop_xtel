import 'package:flutter/services.dart' show rootBundle;

class LoadJsonLocal{

 static Future<String> getJson({required String localJson}) {
    return rootBundle.loadString(localJson);
  }

}