import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:dop_xtel/common/resource/enum_resource.dart';
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
    bool checkInternet = await isConnecting;
    if(!checkInternet){
      log('No Internet');
      return;
    }
  }

  Future<bool> get isConnecting async => await getConnection();

  Future<bool> getConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return (result.isNotEmpty && result[0].rawAddress.isNotEmpty);
    } on SocketException catch (_) {
      setStatus(Status.noConnection);
      return false;
    }
  }

  void setStatus(Status s) {
    status.value = s;
  }

  void setMessage(String s) {
    message.value = s;
  }
}
