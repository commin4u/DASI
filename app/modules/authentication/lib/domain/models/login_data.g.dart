// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginData> _$loginDataSerializer = _$LoginDataSerializer();

class _$LoginDataSerializer implements StructuredSerializer<LoginData> {
  @override
  final Iterable<Type> types = const [LoginData, _$LoginData];
  @override
  final String wireName = 'LoginData';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    LoginData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('accessToken')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.expiresIn;
    if (value != null) {
      result
        ..add('expires_in')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  LoginData deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = LoginDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accessToken':
          result.accessToken =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'expires_in':
          result.expiresIn =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginData extends LoginData {
  @override
  final String? accessToken;
  @override
  final int? expiresIn;

  factory _$LoginData([void Function(LoginDataBuilder)? updates]) =>
      (LoginDataBuilder()..update(updates))._build();

  _$LoginData._({this.accessToken, this.expiresIn}) : super._();
  @override
  LoginData rebuild(void Function(LoginDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginDataBuilder toBuilder() => LoginDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginData &&
        accessToken == other.accessToken &&
        expiresIn == other.expiresIn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, expiresIn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginData')
          ..add('accessToken', accessToken)
          ..add('expiresIn', expiresIn))
        .toString();
  }
}

class LoginDataBuilder implements Builder<LoginData, LoginDataBuilder> {
  _$LoginData? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  int? _expiresIn;
  int? get expiresIn => _$this._expiresIn;
  set expiresIn(int? expiresIn) => _$this._expiresIn = expiresIn;

  LoginDataBuilder();

  LoginDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _expiresIn = $v.expiresIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginData other) {
    _$v = other as _$LoginData;
  }

  @override
  void update(void Function(LoginDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginData build() => _build();

  _$LoginData _build() {
    final _$result =
        _$v ?? _$LoginData._(accessToken: accessToken, expiresIn: expiresIn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
