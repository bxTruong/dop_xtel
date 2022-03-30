import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:device_info/device_info.dart';

class DeviceModule {
  static Future getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.model;
    }
  }

  static Future getIpv4() async {
    final ipv4 = await Ipify.ipv4();
    return ipv4;
  }
}
