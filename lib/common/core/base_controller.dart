import 'package:get/get.dart';
import 'package:shop_all_fe/common/resource/enum_resource.dart';

class BaseController extends GetxController {
  var status = Status.loading.obs;
  var message = ''.obs;

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();
  }

  Future<void> initialData() async {
    await fetchData();
  }

  Future<void> fetchData() async {

  }

  void setStatus(Status s) {
    status.value = s;
  }

  void setMessage(String s) {
    message.value = s;
  }
}

