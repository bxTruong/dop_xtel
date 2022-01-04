import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shop_all_fe/model/sign_in.dart';
import 'package:shop_all_fe/model/user_information.dart';

part 'service.g.dart';

@RestApi()
abstract class Service {
  factory Service(Dio dio) = _Service;

  @POST('/user/login')
  Future<UserInformation?> login(@Body() SignIn u);
}
