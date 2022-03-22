import 'dart:collection';
import 'dart:io';

import 'package:app_shopee_lite/common/resource/enum_resource.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<Status> status = Status.loading.obs;
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

