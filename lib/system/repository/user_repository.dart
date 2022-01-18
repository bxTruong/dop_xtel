import 'package:shop_all_fe/common/core/base_repository.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/system/model/base_response.dart';
import 'package:shop_all_fe/system/model/sign_in.dart';

class UserRepository<T extends BaseController> extends BaseRepository<T> {
  Future<BaseResponse?>? login(SignIn u) async {
    try {
      BaseResponse? baseResponse = await Client.getClient().login(u);
      return baseResponse;
    } catch (exception) {
      catchException(exception);
    }
    return null;
  }
}
