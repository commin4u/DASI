import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_data.g.dart';

abstract class LoginData implements Built<LoginData, LoginDataBuilder> {
  static Serializer<LoginData> get serializer => _$loginDataSerializer;

  String? get email;
  String? get password;

  LoginData._();

  factory LoginData([void Function(LoginDataBuilder) updates]) = _$LoginData;
}