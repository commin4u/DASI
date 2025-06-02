// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateOrderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateOrderState()';
}


}

/// @nodoc
class $CreateOrderStateCopyWith<$Res>  {
$CreateOrderStateCopyWith(CreateOrderState _, $Res Function(CreateOrderState) __);
}


/// @nodoc


class CreateOrderStateInitial implements CreateOrderState {
   CreateOrderStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateOrderState.initial()';
}


}




/// @nodoc


class CreateOrderStateLoading implements CreateOrderState {
   CreateOrderStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateOrderState.loading()';
}


}




/// @nodoc


class CreateOrderStatePlaced implements CreateOrderState {
   CreateOrderStatePlaced(final  List<Order> orders): _orders = orders;
  

 final  List<Order> _orders;
 List<Order> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of CreateOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderStatePlacedCopyWith<CreateOrderStatePlaced> get copyWith => _$CreateOrderStatePlacedCopyWithImpl<CreateOrderStatePlaced>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderStatePlaced&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'CreateOrderState.placed(orders: $orders)';
}


}

/// @nodoc
abstract mixin class $CreateOrderStatePlacedCopyWith<$Res> implements $CreateOrderStateCopyWith<$Res> {
  factory $CreateOrderStatePlacedCopyWith(CreateOrderStatePlaced value, $Res Function(CreateOrderStatePlaced) _then) = _$CreateOrderStatePlacedCopyWithImpl;
@useResult
$Res call({
 List<Order> orders
});




}
/// @nodoc
class _$CreateOrderStatePlacedCopyWithImpl<$Res>
    implements $CreateOrderStatePlacedCopyWith<$Res> {
  _$CreateOrderStatePlacedCopyWithImpl(this._self, this._then);

  final CreateOrderStatePlaced _self;
  final $Res Function(CreateOrderStatePlaced) _then;

/// Create a copy of CreateOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,}) {
  return _then(CreateOrderStatePlaced(
null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<Order>,
  ));
}


}

/// @nodoc


class CreateOrderStateError implements CreateOrderState {
   CreateOrderStateError(this.message);
  

 final  String message;

/// Create a copy of CreateOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOrderStateErrorCopyWith<CreateOrderStateError> get copyWith => _$CreateOrderStateErrorCopyWithImpl<CreateOrderStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOrderStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateOrderState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CreateOrderStateErrorCopyWith<$Res> implements $CreateOrderStateCopyWith<$Res> {
  factory $CreateOrderStateErrorCopyWith(CreateOrderStateError value, $Res Function(CreateOrderStateError) _then) = _$CreateOrderStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CreateOrderStateErrorCopyWithImpl<$Res>
    implements $CreateOrderStateErrorCopyWith<$Res> {
  _$CreateOrderStateErrorCopyWithImpl(this._self, this._then);

  final CreateOrderStateError _self;
  final $Res Function(CreateOrderStateError) _then;

/// Create a copy of CreateOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CreateOrderStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
