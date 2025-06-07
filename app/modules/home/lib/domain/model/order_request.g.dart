// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderRequest> _$orderRequestSerializer = _$OrderRequestSerializer();

class _$OrderRequestSerializer implements StructuredSerializer<OrderRequest> {
  @override
  final Iterable<Type> types = const [OrderRequest, _$OrderRequest];
  @override
  final String wireName = 'OrderRequest';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    OrderRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'listingId',
      serializers.serialize(
        object.listingId,
        specifiedType: const FullType(String),
      ),
      'startDate',
      serializers.serialize(
        object.startDate,
        specifiedType: const FullType(String),
      ),
      'numberOfDays',
      serializers.serialize(
        object.numberOfDays,
        specifiedType: const FullType(int),
      ),
    ];

    return result;
  }

  @override
  OrderRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'listingId':
          result.listingId =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'startDate':
          result.startDate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'numberOfDays':
          result.numberOfDays =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderRequest extends OrderRequest {
  @override
  final String listingId;
  @override
  final String startDate;
  @override
  final int numberOfDays;

  factory _$OrderRequest([void Function(OrderRequestBuilder)? updates]) =>
      (OrderRequestBuilder()..update(updates))._build();

  _$OrderRequest._({
    required this.listingId,
    required this.startDate,
    required this.numberOfDays,
  }) : super._();
  @override
  OrderRequest rebuild(void Function(OrderRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderRequestBuilder toBuilder() => OrderRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderRequest &&
        listingId == other.listingId &&
        startDate == other.startDate &&
        numberOfDays == other.numberOfDays;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, listingId.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, numberOfDays.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderRequest')
          ..add('listingId', listingId)
          ..add('startDate', startDate)
          ..add('numberOfDays', numberOfDays))
        .toString();
  }
}

class OrderRequestBuilder
    implements Builder<OrderRequest, OrderRequestBuilder> {
  _$OrderRequest? _$v;

  String? _listingId;
  String? get listingId => _$this._listingId;
  set listingId(String? listingId) => _$this._listingId = listingId;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  int? _numberOfDays;
  int? get numberOfDays => _$this._numberOfDays;
  set numberOfDays(int? numberOfDays) => _$this._numberOfDays = numberOfDays;

  OrderRequestBuilder();

  OrderRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _listingId = $v.listingId;
      _startDate = $v.startDate;
      _numberOfDays = $v.numberOfDays;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderRequest other) {
    _$v = other as _$OrderRequest;
  }

  @override
  void update(void Function(OrderRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderRequest build() => _build();

  _$OrderRequest _build() {
    final _$result =
        _$v ??
        _$OrderRequest._(
          listingId: BuiltValueNullFieldError.checkNotNull(
            listingId,
            r'OrderRequest',
            'listingId',
          ),
          startDate: BuiltValueNullFieldError.checkNotNull(
            startDate,
            r'OrderRequest',
            'startDate',
          ),
          numberOfDays: BuiltValueNullFieldError.checkNotNull(
            numberOfDays,
            r'OrderRequest',
            'numberOfDays',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
