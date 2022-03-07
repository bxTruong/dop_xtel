import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/constant.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/module/notification_module.dart';
import 'package:shop_all_fe/system/model/user_information.dart';
import 'package:shop_all_fe/system/repository/user_repository.dart';


class LoginController extends BaseController {
  final _userRepository = UserRepository<LoginController>();
  Rx<UserInformation?> user = UserInformation().obs;
  var ted1=TextEditingController();
  var ted2=TextEditingController();

  @override
  Future initialData() async {
    await Future.delayed(const Duration(seconds: 1));
    await fetchData();
  }

  @override
  Future<void> fetchData() async {
    // var response = await _userRepository.login(SignIn(password: '123456', userName: 'adminapp'));
    // if (response.isNulled) return;
    // user.value = response;
    setStatus(Status.success);
    // UserInformation? userInformation1 =
    //     await _userRepository.login(SignIn(password: '123456', userName: 'adminap'));
  }

  void showNotification() {
    NotificationModule.instance.show(hashCode, Constant.app_name, '1 thông báo mới');
  }
}
