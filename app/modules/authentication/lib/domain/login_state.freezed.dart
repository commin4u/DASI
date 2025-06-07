// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// @nodoc


class LoginStateFormData implements LoginState {
  const LoginStateFormData({this.email, this.password});
  

 final  String? email;
 final  String? password;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateFormDataCopyWith<LoginStateFormData> get copyWith => _$LoginStateFormDataCopyWithImpl<LoginStateFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateFormData&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'LoginState.formData(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginStateFormDataCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginStateFormDataCopyWith(LoginStateFormData value, $Res Function(LoginStateFormData) _then) = _$LoginStateFormDataCopyWithImpl;
@useResult
$Res call({
 String? email, String? password
});




}
/// @nodoc
class _$LoginStateFormDataCopyWithImpl<$Res>
    implements $LoginStateFormDataCopyWith<$Res> {
  _$LoginStateFormDataCopyWithImpl(this._self, this._then);

  final LoginStateFormData _self;
  final $Res Function(LoginStateFormData) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? password = freezed,}) {
  return _then(LoginStateFormData(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LoginStateLoading implements LoginState {
  const LoginStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class LoginStateSuccess implements LoginState {
  const LoginStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.success()';
}


}




/// @nodoc


class LoginStateError implements LoginState {
  const LoginStateError(this.message);
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateErrorCopyWith<LoginStateError> get copyWith => _$LoginStateErrorCopyWithImpl<LoginStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LoginState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginStateErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginStateErrorCopyWith(LoginStateError value, $Res Function(LoginStateError) _then) = _$LoginStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginStateErrorCopyWithImpl<$Res>
    implements $LoginStateErrorCopyWith<$Res> {
  _$LoginStateErrorCopyWithImpl(this._self, this._then);

  final LoginStateError _self;
  final $Res Function(LoginStateError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
