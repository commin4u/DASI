// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'domain_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DomainResult<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainResult<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DomainResult<$T>()';
}


}

/// @nodoc
class $DomainResultCopyWith<T,$Res>  {
$DomainResultCopyWith(DomainResult<T> _, $Res Function(DomainResult<T>) __);
}


/// @nodoc


class DomainSuccess<T> implements DomainResult<T> {
  const DomainSuccess(this.data);
  

 final  T data;

/// Create a copy of DomainResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainSuccessCopyWith<T, DomainSuccess<T>> get copyWith => _$DomainSuccessCopyWithImpl<T, DomainSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DomainResult<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $DomainSuccessCopyWith<T,$Res> implements $DomainResultCopyWith<T, $Res> {
  factory $DomainSuccessCopyWith(DomainSuccess<T> value, $Res Function(DomainSuccess<T>) _then) = _$DomainSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$DomainSuccessCopyWithImpl<T,$Res>
    implements $DomainSuccessCopyWith<T, $Res> {
  _$DomainSuccessCopyWithImpl(this._self, this._then);

  final DomainSuccess<T> _self;
  final $Res Function(DomainSuccess<T>) _then;

/// Create a copy of DomainResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(DomainSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class DomainError<T> implements DomainResult<T> {
  const DomainError(this.error);
  

 final  String error;

/// Create a copy of DomainResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DomainErrorCopyWith<T, DomainError<T>> get copyWith => _$DomainErrorCopyWithImpl<T, DomainError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DomainResult<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DomainErrorCopyWith<T,$Res> implements $DomainResultCopyWith<T, $Res> {
  factory $DomainErrorCopyWith(DomainError<T> value, $Res Function(DomainError<T>) _then) = _$DomainErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DomainErrorCopyWithImpl<T,$Res>
    implements $DomainErrorCopyWith<T, $Res> {
  _$DomainErrorCopyWithImpl(this._self, this._then);

  final DomainError<T> _self;
  final $Res Function(DomainError<T>) _then;

/// Create a copy of DomainResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DomainError<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DomainLoading<T> implements DomainResult<T> {
  const DomainLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DomainLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DomainResult<$T>.loading()';
}


}




// dart format on
