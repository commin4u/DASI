// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RentalTier _$regular = const RentalTier._('regular');
const RentalTier _$old = const RentalTier._('old');

RentalTier _$listingTypeValueOf(String name) {
  switch (name) {
    case 'regular':
      return _$regular;
    case 'old':
      return _$old;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RentalTier> _$listingTypeValues = BuiltSet<RentalTier>(
  const <RentalTier>[_$regular, _$old],
);

const GamePlatform _$ps3 = const GamePlatform._('ps3');
const GamePlatform _$ps4 = const GamePlatform._('ps4');
const GamePlatform _$ps5 = const GamePlatform._('ps5');
const GamePlatform _$pc = const GamePlatform._('pc');
const GamePlatform _$xbox360 = const GamePlatform._('xbox360');
const GamePlatform _$xboxOne = const GamePlatform._('xboxOne');
const GamePlatform _$xboxSeriesX = const GamePlatform._('xboxSeriesX');

GamePlatform _$gamePlatformValueOf(String name) {
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

final BuiltSet<GamePlatform> _$gamePlatformValues = BuiltSet<GamePlatform>(
  const <GamePlatform>[
    _$ps3,
    _$ps4,
    _$ps5,
    _$pc,
    _$xbox360,
    _$xboxOne,
    _$xboxSeriesX,
  ],
);

Serializer<Listing> _$listingSerializer = _$ListingSerializer();
Serializer<RentalTier> _$rentalTierSerializer = _$RentalTierSerializer();
Serializer<GamePlatform> _$gamePlatformSerializer = _$GamePlatformSerializer();

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
      'videoGameRentalTier',
      serializers.serialize(
        object.rentalTier,
        specifiedType: const FullType(RentalTier),
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
    value = object.imageBase64;
    if (value != null) {
      result
        ..add('imageBase64')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
    value = object.addedByUserId;
    if (value != null) {
      result
        ..add('addedByUserId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.platform;
    if (value != null) {
      result
        ..add('platform')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(GamePlatform),
          ),
        );
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
        case 'imageBase64':
          result.imageBase64 =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'id':
          result.id =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
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
        case 'addedByUserId':
          result.addedByUserId =
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
                    specifiedType: const FullType(GamePlatform),
                  )
                  as GamePlatform?;
          break;
      }
    }

    return result.build();
  }
}

class _$RentalTierSerializer implements PrimitiveSerializer<RentalTier> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'regular': 'REGULAR',
    'old': 'OLD',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'REGULAR': 'regular',
    'OLD': 'old',
  };

  @override
  final Iterable<Type> types = const <Type>[RentalTier];
  @override
  final String wireName = 'RentalTier';

  @override
  Object serialize(
    Serializers serializers,
    RentalTier object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RentalTier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RentalTier.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$GamePlatformSerializer implements PrimitiveSerializer<GamePlatform> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ps3': 'PS3',
    'ps4': 'PS4',
    'ps5': 'PS5',
    'pc': 'PC',
    'xbox360': 'XBOX_360',
    'xboxOne': 'XBOX_ONE',
    'xboxSeriesX': 'XBOX_SERIES_X',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'PS3': 'ps3',
    'PS4': 'ps4',
    'PS5': 'ps5',
    'PC': 'pc',
    'XBOX_360': 'xbox360',
    'XBOX_ONE': 'xboxOne',
    'XBOX_SERIES_X': 'xboxSeriesX',
  };

  @override
  final Iterable<Type> types = const <Type>[GamePlatform];
  @override
  final String wireName = 'GamePlatform';

  @override
  Object serialize(
    Serializers serializers,
    GamePlatform object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  GamePlatform deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => GamePlatform.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Listing extends Listing {
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? imageBase64;
  @override
  final int? id;
  @override
  final int? pricePerRent;
  @override
  final int? baseRentDays;
  @override
  final int? pricePerAdditionalDay;
  @override
  final int? addedByUserId;
  @override
  final RentalTier rentalTier;
  @override
  final GamePlatform? platform;

  factory _$Listing([void Function(ListingBuilder)? updates]) =>
      (ListingBuilder()..update(updates))._build();

  _$Listing._({
    required this.title,
    this.description,
    this.imageBase64,
    this.id,
    this.pricePerRent,
    this.baseRentDays,
    this.pricePerAdditionalDay,
    this.addedByUserId,
    required this.rentalTier,
    this.platform,
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
        imageBase64 == other.imageBase64 &&
        id == other.id &&
        pricePerRent == other.pricePerRent &&
        baseRentDays == other.baseRentDays &&
        pricePerAdditionalDay == other.pricePerAdditionalDay &&
        addedByUserId == other.addedByUserId &&
        rentalTier == other.rentalTier &&
        platform == other.platform;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, imageBase64.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, pricePerRent.hashCode);
    _$hash = $jc(_$hash, baseRentDays.hashCode);
    _$hash = $jc(_$hash, pricePerAdditionalDay.hashCode);
    _$hash = $jc(_$hash, addedByUserId.hashCode);
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
          ..add('imageBase64', imageBase64)
          ..add('id', id)
          ..add('pricePerRent', pricePerRent)
          ..add('baseRentDays', baseRentDays)
          ..add('pricePerAdditionalDay', pricePerAdditionalDay)
          ..add('addedByUserId', addedByUserId)
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

  String? _imageBase64;
  String? get imageBase64 => _$this._imageBase64;
  set imageBase64(String? imageBase64) => _$this._imageBase64 = imageBase64;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

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

  int? _addedByUserId;
  int? get addedByUserId => _$this._addedByUserId;
  set addedByUserId(int? addedByUserId) =>
      _$this._addedByUserId = addedByUserId;

  RentalTier? _rentalTier;
  RentalTier? get rentalTier => _$this._rentalTier;
  set rentalTier(RentalTier? rentalTier) => _$this._rentalTier = rentalTier;

  GamePlatform? _platform;
  GamePlatform? get platform => _$this._platform;
  set platform(GamePlatform? platform) => _$this._platform = platform;

  ListingBuilder();

  ListingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _imageBase64 = $v.imageBase64;
      _id = $v.id;
      _pricePerRent = $v.pricePerRent;
      _baseRentDays = $v.baseRentDays;
      _pricePerAdditionalDay = $v.pricePerAdditionalDay;
      _addedByUserId = $v.addedByUserId;
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
          imageBase64: imageBase64,
          id: id,
          pricePerRent: pricePerRent,
          baseRentDays: baseRentDays,
          pricePerAdditionalDay: pricePerAdditionalDay,
          addedByUserId: addedByUserId,
          rentalTier: BuiltValueNullFieldError.checkNotNull(
            rentalTier,
            r'Listing',
            'rentalTier',
          ),
          platform: platform,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
