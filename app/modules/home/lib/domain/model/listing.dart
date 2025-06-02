import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'listing.g.dart';

abstract class Listing implements Built<Listing, ListingBuilder> {

  Listing._();

  factory Listing([void Function(ListingBuilder) updates]) = _$Listing;

  static Serializer<Listing> get serializer => _$listingSerializer;

  String get title;
  String? get description;
  String? get imageUrl;
  String get id;

  ListingType get type;

  Platform get platform;
}

class ListingType extends EnumClass {
  static const ListingType game = _$game;
  static const ListingType accessory = _$accessory;
  static const ListingType console = _$console;

  const ListingType._(super.name);

  static BuiltSet<ListingType> get values => _$listingTypeValues;
  static ListingType valueOf(String name) => _$listingTypeValueOf(name);
}

class Platform extends EnumClass {
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