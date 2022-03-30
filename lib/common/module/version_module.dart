import 'package:package_info_plus/package_info_plus.dart';
import 'package:shop_all_fe/common/core/base_function.dart';

class VersionModule {
  static VersionModule? _versionModule;
  static PackageInfo? _packageInfo;

  static Future<void> installModule() async {
    _packageInfo ??= await PackageInfo.fromPlatform();
    _versionModule ??= VersionModule();
  }

  static VersionModule getInstance() {
    return _versionModule ??= VersionModule();
  }

  String getAppName() {
    showLog('App name: ' + (_packageInfo?.appName ?? ''));
    return _packageInfo?.appName ?? '';
  }

  String getPackageName() {
    showLog('Package name: ' + (_packageInfo?.packageName ?? ''));
    return _packageInfo?.packageName ?? '';
  }

  String getVersionName() {
    showLog('Version name: ' + (_packageInfo?.version ?? ''));
    return _packageInfo?.version ?? '';
  }

  String getVersionCode() {
    showLog('Version code: ' + (_packageInfo?.buildNumber ?? ''));
    return _packageInfo?.buildNumber ?? '';
  }
}
