import 'package:app_shopee_lite/common/core/base_controller.dart';
import 'package:app_shopee_lite/common/core/sys/base_repository.dart';
import 'package:app_shopee_lite/common/core/sys/base_response.dart';
import 'package:app_shopee_lite/common/network/client.dart';
import 'package:app_shopee_lite/system/model/sign_in.dart';

import 'package:app_shopee_lite/system/model/user_information.dart';

class UserRepository<T extends BaseController> extends BaseRepository<T> {
  Future<UserInformation?>? login(SignIn u) async {
    try {
      BaseResponse? baseResponse = await Client.getClient().login(u);
      if (catchServerError(baseResponse)) {
        return UserInformation.fromJson(baseResponse?.data);
      }
    } catch (exception) {
      catchException(exception);
    }
  }
}
