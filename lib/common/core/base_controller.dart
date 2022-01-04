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

  Future<void> initialData() async {
    await fetchData();
  }

  Future<void> callData() async {}

  void refreshToken(DioError exception) {}

  void forbiddenException(DioError exception) {}

  void notFoundException(DioError exception) {}

  void badRequestException(DioError exception) {}

  void noConnectException() {}

  void timeOutException(DioError exception) {}

  void receiveTimeOutException(DioError exception) {}

  void otherException(DioError exception) {}

  Future<void> fetchData() async {
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
    showError('Exception: ' + exception.toString());
    if (exception is DioError) {
      if (exception.response?.statusCode == 401) {
        refreshToken(exception);
      } else if (exception.response?.statusCode == 403) {
        forbiddenException(exception);
      } else if (exception.response?.statusCode == 404) {
        notFoundException(exception);
      } else if (exception.response?.statusCode == 502) {
        badRequestException(exception);
      } else if (exception.type == DioErrorType.connectTimeout) {
        timeOutException(exception);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        receiveTimeOutException(exception);
      } else {
        otherException(exception);
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
