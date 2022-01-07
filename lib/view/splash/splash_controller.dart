import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_all_fe/common/core/base_controller.dart';
import 'package:shop_all_fe/common/core/base_function.dart';
import 'package:shop_all_fe/common/core/base_refresh_controller.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/model/sign_in.dart';
import 'package:shop_all_fe/model/user_information.dart';
import 'package:web_socket_channel/io.dart';

class SplashController extends BaseController {
  var listTest = <String>[].obs;
  BaseRefreshController? baseRefreshController;
  var channel;
  @override
  Future initialData() async {
    channel = IOWebSocketChannel.connect(Uri.parse('wss://websocket-echo.glitch.me'));

    channel.stream.listen((message) {
      showError(message);
    });

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

  sentData() {
    channel.sink.add('received!123123');
  }
}
