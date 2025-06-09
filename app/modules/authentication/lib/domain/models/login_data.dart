import 'package:authentication/domain/models/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_data.g.dart';

abstract class LoginData implements Built<LoginData, LoginDataBuilder> {

  factory LoginData([void Function(LoginDataBuilder) updates]) = _$LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;

  static Serializer<LoginData> get serializer => _$loginDataSerializer;

  String? get accessToken;

  @BuiltValueField(wireName: 'expires_in')
  int? get expiresIn;

  LoginData._();
}