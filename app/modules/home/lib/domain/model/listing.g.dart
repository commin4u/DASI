// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RentalTier _$game = const RentalTier._('game');
const RentalTier _$accessory = const RentalTier._('accessory');
const RentalTier _$console = const RentalTier._('console');

RentalTier _$listingTypeValueOf(String name) {
  switch (name) {
    case 'game':
      return _$game;
    case 'accessory':
      return _$accessory;
    case 'console':
      return _$console;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RentalTier> _$listingTypeValues = BuiltSet<RentalTier>(
  const <RentalTier>[_$game, _$accessory, _$console],
);

const Platform _$ps3 = const Platform._('ps3');
const Platform _$ps4 = const Platform._('ps4');
const Platform _$ps5 = const Platform._('ps5');
const Platform _$pc = const Platform._('pc');
const Platform _$xbox360 = const Platform._('xbox360');
const Platform _$xboxOne = const Platform._('xboxOne');
const Platform _$xboxSeriesX = const Platform._('xboxSeriesX');

Platform _$platformValueOf(String name) {
  switch (name) {
    case 'ps3':
      return _$ps3;
    case 'ps4':
      return _$ps4;
    case 'ps5':
      return _$ps5;
    case 'pc':
      return _$pc;
    case 'xbox360':
      return _$xbox360;
    case 'xboxOne':
      return _$xboxOne;
    case 'xboxSeriesX':
      return _$xboxSeriesX;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<Platform> _$platformValues = BuiltSet<Platform>(const <Platform>[
  _$ps3,
  _$ps4,
  _$ps5,
  _$pc,
  _$xbox360,
  _$xboxOne,
  _$xboxSeriesX,
]);

Serializer<Listing> _$listingSerializer = _$ListingSerializer();

class _$ListingSerializer implements StructuredSerializer<Listing> {
  @override
  final Iterable<Type> types = const [Listing, _$Listing];
  @override
  final String wireName = 'Listing';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Listing object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'title',
      serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      ),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'videoGameRentalTier',
      serializers.serialize(
        object.rentalTier,
        specifiedType: const FullType(RentalTier),
      ),
      'platform',
      serializers.serialize(
        object.platform,
        specifiedType: const FullType(Platform),
      ),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('imageUrl')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.pricePerRent;
    if (value != null) {
      result
        ..add('pricePerRent')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.baseRentDays;
    if (value != null) {
      result
        ..add('baseRentDays')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pricePerAdditionalDay;
    if (value != null) {
      result
        ..add('pricePerAdditionalDay')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Listing deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListingBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'description':
          result.description =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'imageUrl':
          result.imageUrl =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'id':
          result.id =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'pricePerRent':
          result.pricePerRent =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'baseRentDays':
          result.baseRentDays =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'pricePerAdditionalDay':
          result.pricePerAdditionalDay =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'videoGameRentalTier':
          result.rentalTier =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(RentalTier),
                  )!
                  as RentalTier;
          break;
        case 'platform':
          result.platform =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Platform),
                  )!
                  as Platform;
          break;
      }
    }

    return result.build();
  }
}

class _$Listing extends Listing {
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? imageUrl;
  @override
  final String id;
  @override
  final int? pricePerRent;
  @override
  final int? baseRentDays;
  @override
  final int? pricePerAdditionalDay;
  @override
  final RentalTier rentalTier;
  @override
  final Platform platform;

  factory _$Listing([void Function(ListingBuilder)? updates]) =>
      (ListingBuilder()..update(updates))._build();

  _$Listing._({
    required this.title,
    this.description,
    this.imageUrl,
    required this.id,
    this.pricePerRent,
    this.baseRentDays,
    this.pricePerAdditionalDay,
    required this.rentalTier,
    required this.platform,
  }) : super._();
  @override
  Listing rebuild(void Function(ListingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListingBuilder toBuilder() => ListingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Listing &&
        title == other.title &&
        description == other.description &&
        imageUrl == other.imageUrl &&
        id == other.id &&
        pricePerRent == other.pricePerRent &&
        baseRentDays == other.baseRentDays &&
        pricePerAdditionalDay == other.pricePerAdditionalDay &&
        rentalTier == other.rentalTier &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, imageUrl.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pricePerRent.hashCode);
    _$hash = $jc(_$hash, baseRentDays.hashCode);
    _$hash = $jc(_$hash, pricePerAdditionalDay.hashCode);
    _$hash = $jc(_$hash, rentalTier.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Listing')
          ..add('title', title)
          ..add('description', description)
          ..add('imageUrl', imageUrl)
          ..add('id', id)
          ..add('pricePerRent', pricePerRent)
          ..add('baseRentDays', baseRentDays)
          ..add('pricePerAdditionalDay', pricePerAdditionalDay)
          ..add('rentalTier', rentalTier)
          ..add('platform', platform))
        .toString();
  }
}

class ListingBuilder implements Builder<Listing, ListingBuilder> {
  _$Listing? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _pricePerRent;
  int? get pricePerRent => _$this._pricePerRent;
  set pricePerRent(int? pricePerRent) => _$this._pricePerRent = pricePerRent;

  int? _baseRentDays;
  int? get baseRentDays => _$this._baseRentDays;
  set baseRentDays(int? baseRentDays) => _$this._baseRentDays = baseRentDays;

  int? _pricePerAdditionalDay;
  int? get pricePerAdditionalDay => _$this._pricePerAdditionalDay;
  set pricePerAdditionalDay(int? pricePerAdditionalDay) =>
      _$this._pricePerAdditionalDay = pricePerAdditionalDay;

  RentalTier? _rentalTier;
  RentalTier? get rentalTier => _$this._rentalTier;
  set rentalTier(RentalTier? rentalTier) => _$this._rentalTier = rentalTier;

  Platform? _platform;
  Platform? get platform => _$this._platform;
  set platform(Platform? platform) => _$this._platform = platform;

  ListingBuilder();

  ListingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _imageUrl = $v.imageUrl;
      _id = $v.id;
      _pricePerRent = $v.pricePerRent;
      _baseRentDays = $v.baseRentDays;
      _pricePerAdditionalDay = $v.pricePerAdditionalDay;
      _rentalTier = $v.rentalTier;
      _platform = $v.platform;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Listing other) {
    _$v = other as _$Listing;
  }

  @override
  void update(void Function(ListingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Listing build() => _build();

  _$Listing _build() {
    final _$result =
        _$v ??
        _$Listing._(
          title: BuiltValueNullFieldError.checkNotNull(
            title,
            r'Listing',
            'title',
          ),
          description: description,
          imageUrl: imageUrl,
          id: BuiltValueNullFieldError.checkNotNull(id, r'Listing', 'id'),
          pricePerRent: pricePerRent,
          baseRentDays: baseRentDays,
          pricePerAdditionalDay: pricePerAdditionalDay,
          rentalTier: BuiltValueNullFieldError.checkNotNull(
            rentalTier,
            r'Listing',
            'rentalTier',
          ),
          platform: BuiltValueNullFieldError.checkNotNull(
            platform,
            r'Listing',
            'platform',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
