import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_all_fe/common/core/base_controller.dart';
import 'package:shop_all_fe/common/core/base_function.dart';
import 'package:shop_all_fe/common/core/base_refresh_controller.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/module/sql_module.dart';

class SplashController extends BaseController {
  var listTest = <String>[].obs;
  BaseRefreshController? baseRefreshController;

  @override
  Future initialData() async {
    baseRefreshController =
        BaseRefreshController(controller: RefreshController(), callData: () => fetchData());
    await fetchData();
    // SQLModule sqlModule = SQLModule.getInstance();
    // sqlModule.setDatabaseName('my-db.sql');
    // await sqlModule.installDatabase();
    // await sqlModule
    //     .getDatabase()
    //     .execute('CREATE TABLE if not exists users (name TEXT, age INTEGER)');
    // await sqlModule.getDatabase().insert('users', {'name': 'admin', 'age': 12});
    // var s = await sqlModule.getDatabase().rawQuery('select * from users');
    // showLog(s.toString());
  }

  @override
  Future callData() async {
    if (baseRefreshController!.getRefreshing()) listTest.clear();
    for (int i = 0; i < 50; i++) {
      listTest.add(i.toString());
    }
    baseRefreshController?.setEndPoint(false);
  }
}
