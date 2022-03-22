import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:app_shopee_lite/model/sign_in.dart';
import 'package:app_shopee_lite/model/user_information.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio) = _Service;

  @POST('/user/login')
  Future<UserInformation?> login(@Body() SignIn u);
}
