import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/base_function.dart';
import 'package:shop_all_fe/common/resource/enum_resource.dart';
import 'package:shop_all_fe/system/model/base_response.dart';

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

  Future<void> fetchData() async {}

  void setStatus(Status s) {
    if (status.value != Status.error) {
      status.value = s;
    }
  }

  void setMessage(String s) {
    message.value = s;
  }
}
