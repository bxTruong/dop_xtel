import 'package:shop_all_fe/common/core/base_controller.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  var a = 'Không nhận được dữ liệu';

  @override
  Future initialData() async {
    a = Get.parameters['phone'] ?? '';
  }
}
