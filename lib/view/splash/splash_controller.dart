import 'package:dop_xtel/common/core/base_controller.dart';
import 'package:dop_xtel/common/core/page_manager/key_page.dart';
import 'package:get/get.dart';

import '../../common/local_storage/hive_module.dart';

class SplashController extends BaseController {
  @override
  Future initialData() async {
    super.initialData();
    await Future.delayed(const Duration(milliseconds: 500));
    await HiveModule.install();
    Get.offAndToNamed(KeyPage.main_game_page);
  }
}
