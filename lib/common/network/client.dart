import 'package:dio/dio.dart';
import 'package:shop_all_fe/common/network/service.dart';

class Client {
  static String baseUrl = '';

  static Service getClient() {
    Dio dio =
        Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: 10, receiveTimeout: 10, headers: {}));
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
    ));
    return Service(dio);
  }
}
