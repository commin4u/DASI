import 'package:authentication/domain/models/login_data.dart';
import 'package:built_value/serializer.dart';
import 'package:authentication/domain/models/login_request.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor([
  LoginRequest,
  LoginData,
])
final Serializers serializers = (
    _$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
).build();
