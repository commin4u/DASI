// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState()';
}


}

/// @nodoc
class $OrderDetailsStateCopyWith<$Res>  {
$OrderDetailsStateCopyWith(OrderDetailsState _, $Res Function(OrderDetailsState) __);
}


/// @nodoc


class OrderDetailsStateInitial implements OrderDetailsState {
  const OrderDetailsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState.initial()';
}


}




/// @nodoc


class OrderDetailsStateLoading implements OrderDetailsState {
  const OrderDetailsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrderDetailsState.loading()';
}


}




/// @nodoc


class OrderDetailsStateLoaded implements OrderDetailsState {
  const OrderDetailsStateLoaded({required this.data, required this.listing});
  

 final  Order data;
 final  Listing? listing;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsStateLoadedCopyWith<OrderDetailsStateLoaded> get copyWith => _$OrderDetailsStateLoadedCopyWithImpl<OrderDetailsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsStateLoaded&&(identical(other.data, data) || other.data == data)&&(identical(other.listing, listing) || other.listing == listing));
}


@override
int get hashCode => Object.hash(runtimeType,data,listing);

@override
String toString() {
  return 'OrderDetailsState.loaded(data: $data, listing: $listing)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsStateLoadedCopyWith<$Res> implements $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateLoadedCopyWith(OrderDetailsStateLoaded value, $Res Function(OrderDetailsStateLoaded) _then) = _$OrderDetailsStateLoadedCopyWithImpl;
@useResult
$Res call({
 Order data, Listing? listing
});




}
/// @nodoc
class _$OrderDetailsStateLoadedCopyWithImpl<$Res>
    implements $OrderDetailsStateLoadedCopyWith<$Res> {
  _$OrderDetailsStateLoadedCopyWithImpl(this._self, this._then);

  final OrderDetailsStateLoaded _self;
  final $Res Function(OrderDetailsStateLoaded) _then;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? listing = freezed,}) {
  return _then(OrderDetailsStateLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Order,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}


}

/// @nodoc


class OrderDetailsStateError implements OrderDetailsState {
  const OrderDetailsStateError(this.message);
  

 final  String message;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailsStateErrorCopyWith<OrderDetailsStateError> get copyWith => _$OrderDetailsStateErrorCopyWithImpl<OrderDetailsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'OrderDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderDetailsStateErrorCopyWith<$Res> implements $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateErrorCopyWith(OrderDetailsStateError value, $Res Function(OrderDetailsStateError) _then) = _$OrderDetailsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OrderDetailsStateErrorCopyWithImpl<$Res>
    implements $OrderDetailsStateErrorCopyWith<$Res> {
  _$OrderDetailsStateErrorCopyWithImpl(this._self, this._then);

  final OrderDetailsStateError _self;
  final $Res Function(OrderDetailsStateError) _then;

/// Create a copy of OrderDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OrderDetailsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
