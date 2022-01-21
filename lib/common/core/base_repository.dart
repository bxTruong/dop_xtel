import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/constant.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/system/model/base_response.dart';

class BaseRepository<T extends BaseController> {
  void catchException(Object exception) {
    setStatus(Status.error);
    showError(exception.toString());
    if (exception is FormatException) {
      return _formatException(exception);
    } else if (exception is DioError) {
      if (exception.response?.statusCode == HttpStatus.unauthorized) {
        return _refreshToken(exception);
      } else if (exception.response?.statusCode == HttpStatus.forbidden) {
        return _forbiddenException(exception);
      } else if (exception.response?.statusCode == HttpStatus.notFound) {
        return _notFoundException(exception);
      } else if (exception.response?.statusCode == HttpStatus.badGateway) {
        return _badRequestException(exception);
      } else if (exception.type == DioErrorType.connectTimeout) {
        return _timeOutException(exception);
      } else if (exception.type == DioErrorType.receiveTimeout) {
        return _receiveTimeOutException(exception);
      } else {
        return _otherException(exception);
      }
    }
  }

  void _refreshToken(DioError exception) {
    setMessage(Constant.tokenExpired);
  }

  void _forbiddenException(DioError exception) {
    setMessage(Constant.forbidden);
  }

  void _notFoundException(DioError exception) {
    setMessage(Constant.notFound);
  }

  void _badRequestException(DioError exception) {
    setMessage(Constant.unknown);
  }

  void _timeOutException(DioError exception) {
    setMessage(Constant.connectTimeOut);
  }

  void _receiveTimeOutException(DioError exception) {
    setMessage(Constant.retrieveTimeOut);
  }

  void _notConnectException(SocketException exception) {
    setMessage(Constant.notConnectError);
    setStatus(Status.noConnection);
  }

  void _formatException(FormatException exception) {}

  void _otherException(DioError exception) {
    if (exception.error is SocketException) {
      _notConnectException(exception.error);
      return;
    }
    setMessage(Constant.unknown);
    return;
  }

  void setStatus(Status s) {
    final controller = Get.find<T>();
    controller.setStatus(Status.error);
  }

  void setMessage(String? s) {
    final controller = Get.find<T>();
    controller.setMessage(s ?? Constant.unknown);
  }

  bool catchServerError(BaseResponse? baseResponse) {
    if (baseResponse != null && baseResponse.error?.code != 0) {
      setStatus(Status.error);
      setMessage(baseResponse.error?.message);
      return false;
    }
    return true;
  }
}
