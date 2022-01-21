import 'package:shop_all_fe/common/core/sys/base_repository.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/core/sys/base_response.dart';
import 'package:shop_all_fe/system/model/sign_in.dart';
import 'package:shop_all_fe/system/model/user_information.dart';

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
