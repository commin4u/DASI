// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListingDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingDetailsState()';
}


}

/// @nodoc
class $ListingDetailsStateCopyWith<$Res>  {
$ListingDetailsStateCopyWith(ListingDetailsState _, $Res Function(ListingDetailsState) __);
}


/// @nodoc


class ListingDetailsStateInitial implements ListingDetailsState {
   ListingDetailsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingDetailsStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingDetailsState.initial()';
}


}




/// @nodoc


class ListingDetailsStateLoading implements ListingDetailsState {
   ListingDetailsStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingDetailsStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingDetailsState.loading()';
}


}




/// @nodoc


class ListingDetailsStateLoaded implements ListingDetailsState {
   ListingDetailsStateLoaded({required this.data});
  

 final  Listing data;

/// Create a copy of ListingDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingDetailsStateLoadedCopyWith<ListingDetailsStateLoaded> get copyWith => _$ListingDetailsStateLoadedCopyWithImpl<ListingDetailsStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingDetailsStateLoaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ListingDetailsState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $ListingDetailsStateLoadedCopyWith<$Res> implements $ListingDetailsStateCopyWith<$Res> {
  factory $ListingDetailsStateLoadedCopyWith(ListingDetailsStateLoaded value, $Res Function(ListingDetailsStateLoaded) _then) = _$ListingDetailsStateLoadedCopyWithImpl;
@useResult
$Res call({
 Listing data
});




}
/// @nodoc
class _$ListingDetailsStateLoadedCopyWithImpl<$Res>
    implements $ListingDetailsStateLoadedCopyWith<$Res> {
  _$ListingDetailsStateLoadedCopyWithImpl(this._self, this._then);

  final ListingDetailsStateLoaded _self;
  final $Res Function(ListingDetailsStateLoaded) _then;

/// Create a copy of ListingDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ListingDetailsStateLoaded(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Listing,
  ));
}


}

/// @nodoc


class ListingDetailsStateError implements ListingDetailsState {
   ListingDetailsStateError(this.message);
  

 final  String message;

/// Create a copy of ListingDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingDetailsStateErrorCopyWith<ListingDetailsStateError> get copyWith => _$ListingDetailsStateErrorCopyWithImpl<ListingDetailsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingDetailsStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ListingDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ListingDetailsStateErrorCopyWith<$Res> implements $ListingDetailsStateCopyWith<$Res> {
  factory $ListingDetailsStateErrorCopyWith(ListingDetailsStateError value, $Res Function(ListingDetailsStateError) _then) = _$ListingDetailsStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ListingDetailsStateErrorCopyWithImpl<$Res>
    implements $ListingDetailsStateErrorCopyWith<$Res> {
  _$ListingDetailsStateErrorCopyWithImpl(this._self, this._then);

  final ListingDetailsStateError _self;
  final $Res Function(ListingDetailsStateError) _then;

/// Create a copy of ListingDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ListingDetailsStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
