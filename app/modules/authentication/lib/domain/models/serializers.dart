import 'package:built_value/serializer.dart';
import 'package:authentication/domain/models/login_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  LoginRequest,
])
final Serializers serializers = _$serializers;