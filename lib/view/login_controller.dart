import 'package:shop_all_fe/common/constant.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/module/notification_module.dart';
import 'package:shop_all_fe/system/model/base_response.dart';
import 'package:shop_all_fe/system/model/sign_in.dart';
import 'package:shop_all_fe/system/model/user_information.dart';
import 'package:shop_all_fe/system/repository/user_repository.dart';

class LoginController extends BaseController {
  final _userRepository = UserRepository<LoginController>();
  var user = UserInformation().obs;

  @override
  Future initialData() async {
    await Future.delayed(const Duration(seconds: 1));
    fetchData();
  }

  @override
  Future<void> fetchData() async {
    BaseResponse? baseResponse =
        await _userRepository.login(SignIn(password: '123456', userName: 'adminapp'));
    if (!checkError(baseResponse)) {
      setMessage(baseResponse?.error?.message ?? 'Đã có lỗi xảy ra');
      setStatus(Status.error);
      return;
    }
    user.value = UserInformation.fromJson(baseResponse?.data);
    setStatus(Status.success);
  }

  void showNotification() {
    NotificationModule.instance.show(hashCode, Constant.app_name, '1 thông báo mới');
  }
}
