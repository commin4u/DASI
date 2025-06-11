// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_listing_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddListingState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddListingState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddListingState()';
}


}

/// @nodoc
class $AddListingStateCopyWith<$Res>  {
$AddListingStateCopyWith(AddListingState _, $Res Function(AddListingState) __);
}


/// @nodoc


class AddListingStateFormData with DiagnosticableTreeMixin implements AddListingState {
   AddListingStateFormData({this.title, this.rentalTier, this.platform, this.image});
  

 final  String? title;
 final  RentalTier? rentalTier;
 final  GamePlatform? platform;
 final  File? image;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddListingStateFormDataCopyWith<AddListingStateFormData> get copyWith => _$AddListingStateFormDataCopyWithImpl<AddListingStateFormData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddListingState.formData'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('rentalTier', rentalTier))..add(DiagnosticsProperty('platform', platform))..add(DiagnosticsProperty('image', image));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingStateFormData&&(identical(other.title, title) || other.title == title)&&(identical(other.rentalTier, rentalTier) || other.rentalTier == rentalTier)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.image, image) || other.image == image));
}


@override
int get hashCode => Object.hash(runtimeType,title,rentalTier,platform,image);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddListingState.formData(title: $title, rentalTier: $rentalTier, platform: $platform, image: $image)';
}


}

/// @nodoc
abstract mixin class $AddListingStateFormDataCopyWith<$Res> implements $AddListingStateCopyWith<$Res> {
  factory $AddListingStateFormDataCopyWith(AddListingStateFormData value, $Res Function(AddListingStateFormData) _then) = _$AddListingStateFormDataCopyWithImpl;
@useResult
$Res call({
 String? title, RentalTier? rentalTier, GamePlatform? platform, File? image
});




}
/// @nodoc
class _$AddListingStateFormDataCopyWithImpl<$Res>
    implements $AddListingStateFormDataCopyWith<$Res> {
  _$AddListingStateFormDataCopyWithImpl(this._self, this._then);

  final AddListingStateFormData _self;
  final $Res Function(AddListingStateFormData) _then;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? rentalTier = freezed,Object? platform = freezed,Object? image = freezed,}) {
  return _then(AddListingStateFormData(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,rentalTier: freezed == rentalTier ? _self.rentalTier : rentalTier // ignore: cast_nullable_to_non_nullable
as RentalTier?,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as GamePlatform?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

/// @nodoc


class AddListingStateLoading with DiagnosticableTreeMixin implements AddListingState {
   AddListingStateLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddListingState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddListingState.loading()';
}


}




/// @nodoc


class AddListingStateSuccess with DiagnosticableTreeMixin implements AddListingState {
   AddListingStateSuccess();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddListingState.success'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddListingState.success()';
}


}




/// @nodoc


class AddListingStateError with DiagnosticableTreeMixin implements AddListingState {
   AddListingStateError(this.message);
  

 final  String message;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddListingStateErrorCopyWith<AddListingStateError> get copyWith => _$AddListingStateErrorCopyWithImpl<AddListingStateError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AddListingState.error'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddListingStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AddListingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddListingStateErrorCopyWith<$Res> implements $AddListingStateCopyWith<$Res> {
  factory $AddListingStateErrorCopyWith(AddListingStateError value, $Res Function(AddListingStateError) _then) = _$AddListingStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddListingStateErrorCopyWithImpl<$Res>
    implements $AddListingStateErrorCopyWith<$Res> {
  _$AddListingStateErrorCopyWithImpl(this._self, this._then);

  final AddListingStateError _self;
  final $Res Function(AddListingStateError) _then;

/// Create a copy of AddListingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddListingStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
