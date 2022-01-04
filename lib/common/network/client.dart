import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/network/service.dart';

class Client {
  static String _BASE_URL = 'https://api.clinic.vietsing.xteldev.com/app';
  static const int _CONNECT_TIMEOUT = 1000;
  static const int _RECEIVE_TIMEOUT = 1000;
  static const String _CONTENT_TYPE = 'application/json';
  static Dio? _dio;
  static Service? _service;

  static Service getClient() {
    return _service ??= Service(_configDio());
  }

  static Dio _configDio() {
    _dio ??= Dio(BaseOptions(
        baseUrl: _BASE_URL,
        connectTimeout: _CONNECT_TIMEOUT,
        receiveTimeout: _RECEIVE_TIMEOUT,
        headers: {},
        contentType: _CONTENT_TYPE));
    _dio!.interceptors.add(PrettyDioLogger(
      error: true,
      logPrint: (v) => showDioLog(v.toString()),
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
    return _dio!;
  }

  void setUrl(String? url) {
    if (url != null) {
      _BASE_URL = url;
    }
  }
}
