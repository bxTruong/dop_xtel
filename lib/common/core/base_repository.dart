import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';

class BaseRepository<T extends BaseController> {
  void catchException(Object exception) {
    setStatus(Status.error);
    showError('Exception: ' + exception.toString());
    if (exception is DioError) {
      if (exception.response?.statusCode == 401) {
        return _refreshToken(exception);
      } else if (exception.response?.statusCode == 403) {
        return _forbiddenException(exception);
      } else if (exception.response?.statusCode == 404) {
        return _notFoundException(exception);
      } else if (exception.response?.statusCode == 502) {
        return _badRequestException(exception);
      } else if (exception.type == DioErrorType.connectTimeout) {
        return _timeOutException(exception);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        return _receiveTimeOutException(exception);
      } else {
        return _otherException(exception);
      }
    } else if (exception is SocketException) {
      return _notConnectException(exception);
    } else if (exception is FormatException) {
      return _formatException(exception);
    }
  }

  void _refreshToken(DioError exception) {}

  void _forbiddenException(DioError exception) {}

  void _notFoundException(DioError exception) {}

  void _badRequestException(DioError exception) {}

  void _timeOutException(DioError exception) {}

  void _receiveTimeOutException(DioError exception) {}

  void _notConnectException(SocketException exception) {}

  void _formatException(FormatException exception) {}

  void _otherException(DioError exception) {}

  void setStatus(Status s) {
    final controller = Get.find<T>();
    controller.status.value = s;
  }
}
