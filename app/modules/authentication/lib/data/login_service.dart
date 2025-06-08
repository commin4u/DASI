import 'package:authentication/domain/models/login_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

abstract class LoginService {
  Future<LoginData> submitLogin(String data);
}

@RestApi(baseUrl: 'authentication/')
abstract class ApiLoginService extends LoginService {
  factory ApiLoginService(Dio dio) = _ApiLoginService;

  @override
  @POST('login')
  Future<LoginData> submitLogin(@Header('Authorization') String request);
}