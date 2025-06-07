// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingState()';
}


}

/// @nodoc
class $ListingStateCopyWith<$Res>  {
$ListingStateCopyWith(ListingState _, $Res Function(ListingState) __);
}


/// @nodoc


class ListingStateInitial implements ListingState {
   ListingStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingState.initial()';
}


}




/// @nodoc


class ListingStateLoading implements ListingState {
   ListingStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListingState.loading()';
}


}




/// @nodoc


class ListingStateLoaded implements ListingState {
   ListingStateLoaded(final  List<Listing> listings): _listings = listings;
  

 final  List<Listing> _listings;
 List<Listing> get listings {
  if (_listings is EqualUnmodifiableListView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listings);
}


/// Create a copy of ListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingStateLoadedCopyWith<ListingStateLoaded> get copyWith => _$ListingStateLoadedCopyWithImpl<ListingStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingStateLoaded&&const DeepCollectionEquality().equals(other._listings, _listings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_listings));

@override
String toString() {
  return 'ListingState.loaded(listings: $listings)';
}


}

/// @nodoc
abstract mixin class $ListingStateLoadedCopyWith<$Res> implements $ListingStateCopyWith<$Res> {
  factory $ListingStateLoadedCopyWith(ListingStateLoaded value, $Res Function(ListingStateLoaded) _then) = _$ListingStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<Listing> listings
});




}
/// @nodoc
class _$ListingStateLoadedCopyWithImpl<$Res>
    implements $ListingStateLoadedCopyWith<$Res> {
  _$ListingStateLoadedCopyWithImpl(this._self, this._then);

  final ListingStateLoaded _self;
  final $Res Function(ListingStateLoaded) _then;

/// Create a copy of ListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? listings = null,}) {
  return _then(ListingStateLoaded(
null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as List<Listing>,
  ));
}


}

/// @nodoc


class ListingStateError implements ListingState {
   ListingStateError(this.message);
  

 final  String message;

/// Create a copy of ListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingStateErrorCopyWith<ListingStateError> get copyWith => _$ListingStateErrorCopyWithImpl<ListingStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ListingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ListingStateErrorCopyWith<$Res> implements $ListingStateCopyWith<$Res> {
  factory $ListingStateErrorCopyWith(ListingStateError value, $Res Function(ListingStateError) _then) = _$ListingStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ListingStateErrorCopyWithImpl<$Res>
    implements $ListingStateErrorCopyWith<$Res> {
  _$ListingStateErrorCopyWithImpl(this._self, this._then);

  final ListingStateError _self;
  final $Res Function(ListingStateError) _then;

/// Create a copy of ListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ListingStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
