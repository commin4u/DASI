import 'package:authentication/domain/models/login_data.dart';
import 'package:authentication/domain/models/login_request.dart';
import 'package:core/domain_result.dart';

abstract class LoginService {
  Future<DomainResult<LoginData>> submitLogin(LoginRequest data);
}

class MockLoginService implements LoginService {
  @override
  Future<DomainResult<LoginData>> submitLogin(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));

    return DomainSuccess(LoginData(
          (b) => b
        ..email = request.email
        ..password = request.password,
    ));
  }
}
