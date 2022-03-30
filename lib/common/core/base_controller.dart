import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/base_function.dart';

class BaseController extends GetxController {
  Map<String, dynamic> parameters = HashMap();

  @override
  Future<void> onInit() async {
    await initialData();
    super.onInit();
  }

  Future initialData() async {}

  Future callData() async {}

  void refreshToken() {}

  void forbiddenException() {}

  void notFoundException() {}

  void noConnectException() {}

  Future fetchData() async {
    bool hasConnection = await hasConnect();
    showWarning('Internet connection: ' + hasConnection.toString());
    if (hasConnection) {
      try {
        await callData();
      } catch (exception) {
        catchException(exception);
      }
    } else {
      noConnectException();
    }
  }

  Future<bool> hasConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  void catchException(Object exception) {
    if (exception is DioError) {
      if (exception.response?.statusCode == 401) {
        refreshToken();
      } else if (exception.response?.statusCode == 403) {
        forbiddenException();
      } else if (exception.response?.statusCode == 404) {
        notFoundException();
      } else if (exception.response?.statusCode == 502) {
        noConnectException();
      }
    }
  }

  void setParameter() {}

  Map<String, dynamic> getParameter() {
    return parameters;
  }

  Object getBody() {
    return Object();
  }
}
