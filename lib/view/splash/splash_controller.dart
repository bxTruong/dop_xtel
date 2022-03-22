import 'package:app_shopee_lite/common/core/base_controller.dart';
import 'package:app_shopee_lite/common/core/page_manager/key_page.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  Future initialData() async {
    super.initialData();
    Get.offAndToNamed(KeyPage.login_page);
  }
}
