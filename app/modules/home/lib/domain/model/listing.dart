import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:home/domain/model/serializers.dart';

part 'listing.g.dart';

abstract class Listing implements Built<Listing, ListingBuilder> {

  Listing._();

  factory Listing([void Function(ListingBuilder) updates]) = _$Listing;

  factory Listing.fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;

  static Serializer<Listing> get serializer => _$listingSerializer;

  String get title;
  String? get description;
  String? get imageBase64;
  int? get id;

  int? get pricePerRent;
  int? get baseRentDays;
  int? get pricePerAdditionalDay;
  int? get addedByUserId;

  @BuiltValueField(wireName: 'videoGameRentalTier')
  RentalTier get rentalTier;

  GamePlatform? get platform;
}

class RentalTier extends EnumClass {

  static Serializer<RentalTier> get serializer => _$rentalTierSerializer;

  @BuiltValueEnumConst(wireName: 'REGULAR')
  static const RentalTier regular = _$regular;
  @BuiltValueEnumConst(wireName: 'OLD')
  static const RentalTier old = _$old;

  const RentalTier._(super.name);

  static BuiltSet<RentalTier> get values => _$listingTypeValues;
  static RentalTier valueOf(String name) => _$listingTypeValueOf(name);

  @override
  String get name {
    switch (this) {
      case RentalTier.regular:
        return 'Regular';
      case RentalTier.old:
        return 'Old';
    }
    return super.name;
  }

  String get wireName {
    switch (this) {
      case RentalTier.regular:
        return 'REGULAR';
      case RentalTier.old:
        return 'OLD';
    }
    return super.name;
  }
}

class GamePlatform extends EnumClass {

  static Serializer<GamePlatform> get serializer => _$gamePlatformSerializer;

  @BuiltValueEnumConst(wireName: 'PS3')
  static const GamePlatform ps3 = _$ps3;

  @BuiltValueEnumConst(wireName: 'PS4')
  static const GamePlatform ps4 = _$ps4;

  @BuiltValueEnumConst(wireName: 'PS5')
  static const GamePlatform ps5 = _$ps5;

  @BuiltValueEnumConst(wireName: 'PC')
  static const GamePlatform pc = _$pc;

  @BuiltValueEnumConst(wireName: 'XBOX_360')
  static const GamePlatform xbox360 = _$xbox360;

  @BuiltValueEnumConst(wireName: 'XBOX_ONE')
  static const GamePlatform xboxOne = _$xboxOne;

  @BuiltValueEnumConst(wireName: 'XBOX_SERIES_X')
  static const GamePlatform xboxSeriesX = _$xboxSeriesX;

  const GamePlatform._(super.name);

  static BuiltSet<GamePlatform> get values => _$gamePlatformValues;
  static GamePlatform valueOf(String name) => _$gamePlatformValueOf(name);

  @override
  String get name {
    switch (this) {
      case GamePlatform.ps3:
        return 'PlayStation 3';
      case GamePlatform.ps4:
        return 'PlayStation 4';
      case GamePlatform.ps5:
        return 'PlayStation 5';
      case GamePlatform.pc:
        return 'PC';
      case GamePlatform.xbox360:
        return 'Xbox 360';
      case GamePlatform.xboxOne:
        return 'Xbox One';
      case GamePlatform.xboxSeriesX:
        return 'Xbox Series X';
    }
    return super.name;
  }

  Color get chipColor {
    switch (this) {
      case GamePlatform.ps3:
      case GamePlatform.ps4:
      case GamePlatform.ps5:
        return const Color(0xFF0072C6); // PlayStation Blue
      case GamePlatform.pc:
        return const Color(0xFF841617); // Amd Red
      case GamePlatform.xbox360:
      case GamePlatform.xboxOne:
      case GamePlatform.xboxSeriesX:
        return const Color(0xFF107C10); // Xbox Green
    }
    return const Color(0xFF808080); // Grey
  }

  String get wireName {
    switch (this) {
      case GamePlatform.ps3:
        return 'PS3';
      case GamePlatform.ps4:
        return 'PS4';
      case GamePlatform.ps5:
        return 'PS5';
      case GamePlatform.pc:
        return 'PC';
      case GamePlatform.xbox360:
        return 'XBOX_360';
      case GamePlatform.xboxOne:
        return 'XBOX_ONE';
      case GamePlatform.xboxSeriesX:
        return 'XBOX_SERIES_X';
    }
    return super.name;
  }
}