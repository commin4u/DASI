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
  String? get imageUrl;
  String? get id;

  int? get pricePerRent;
  int? get baseRentDays;
  int? get pricePerAdditionalDay;

  @BuiltValueField(wireName: 'videoGameRentalTier')
  RentalTier get rentalTier;

  Platform? get platform;
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
}

class Platform extends EnumClass {

  static Serializer<Platform> get serializer => _$platformSerializer;

  static const Platform ps3 = _$ps3;
  static const Platform ps4 = _$ps4;
  static const Platform ps5 = _$ps5;
  static const Platform pc = _$pc;
  static const Platform xbox360 = _$xbox360;
  static const Platform xboxOne = _$xboxOne;
  static const Platform xboxSeriesX = _$xboxSeriesX;

  const Platform._(super.name);

  static BuiltSet<Platform> get values => _$platformValues;
  static Platform valueOf(String name) => _$platformValueOf(name);
}