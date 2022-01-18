import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shop_all_fe/system/model/base_response.dart';
import 'package:shop_all_fe/system/model/sign_in.dart';
import 'package:shop_all_fe/system/model/user_information.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio) = _Service;

  @POST('/user/login')
  Future<BaseResponse?> login(@Body() SignIn u);
}
