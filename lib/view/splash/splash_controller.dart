import 'package:dio/dio.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_all_fe/common/core/base_controller.dart';
import 'package:shop_all_fe/common/core/base_function.dart';
import 'package:shop_all_fe/common/core/base_refresh_controller.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/module/sql_module.dart';
import 'package:shop_all_fe/model/sign_in.dart';
import 'package:shop_all_fe/model/user_information.dart';
import 'package:dio/dio.dart' as dio;

class SplashController extends BaseController {
  var listTest = <String>[].obs;
  BaseRefreshController? baseRefreshController;

  @override
  Future initialData() async {
    baseRefreshController =
        BaseRefreshController(controller: RefreshController(), callData: () => fetchData());
    await fetchData();
  }

  @override
  Future callData() async {
    if (baseRefreshController!.getRefreshing()) listTest.clear();
    for (int i = 0; i < 50; i++) {
      listTest.add(i.toString());
    }
    baseRefreshController?.setEndPoint(false);
    UserInformation? uf =
        await Client.getClient().login(SignIn(password: '123456', userName: 'adminapp'));
  }
}
