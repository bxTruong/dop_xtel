import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio) = _Service;
}
