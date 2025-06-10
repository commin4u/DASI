// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const OrderStatus _$created = const OrderStatus._('created');
const OrderStatus _$inProgress = const OrderStatus._('inProgress');
const OrderStatus _$closed = const OrderStatus._('closed');

OrderStatus _$orderStatusValueOf(String name) {
  switch (name) {
    case 'created':
      return _$created;
    case 'inProgress':
      return _$inProgress;
    case 'closed':
      return _$closed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<OrderStatus> _$orderStatusValues = BuiltSet<OrderStatus>(
  const <OrderStatus>[_$created, _$inProgress, _$closed],
);

Serializer<Order> _$orderSerializer = _$OrderSerializer();
Serializer<OrderStatus> _$orderStatusSerializer = _$OrderStatusSerializer();

class _$OrderSerializer implements StructuredSerializer<Order> {
  @override
  final Iterable<Type> types = const [Order, _$Order];
  @override
  final String wireName = 'Order';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Order object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'rentalPrice',
      serializers.serialize(
        object.rentalPrice,
        specifiedType: const FullType(double),
      ),
      'startDate',
      serializers.serialize(
        object.startDate,
        specifiedType: const FullType(String),
      ),
      'endDate',
      serializers.serialize(
        object.endDate,
        specifiedType: const FullType(String),
      ),
      'orderStatus',
      serializers.serialize(
        object.orderStatus,
        specifiedType: const FullType(OrderStatus),
      ),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoGameId;
    if (value != null) {
      result
        ..add('videoGameId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Order deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'videoGameId':
          result.videoGameId =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int?;
          break;
        case 'rentalPrice':
          result.rentalPrice =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )!
                  as double;
          break;
        case 'startDate':
          result.startDate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'endDate':
          result.endDate =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'orderStatus':
          result.orderStatus =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(OrderStatus),
                  )!
                  as OrderStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderStatusSerializer implements PrimitiveSerializer<OrderStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'created': 'CREATED',
    'inProgress': 'IN_PROGRESS',
    'closed': 'CLOSED',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'CREATED': 'created',
    'IN_PROGRESS': 'inProgress',
    'CLOSED': 'closed',
  };

  @override
  final Iterable<Type> types = const <Type>[OrderStatus];
  @override
  final String wireName = 'OrderStatus';

  @override
  Object serialize(
    Serializers serializers,
    OrderStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  OrderStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => OrderStatus.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$Order extends Order {
  @override
  final int? id;
  @override
  final int? videoGameId;
  @override
  final double rentalPrice;
  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final OrderStatus orderStatus;

  factory _$Order([void Function(OrderBuilder)? updates]) =>
      (OrderBuilder()..update(updates))._build();

  _$Order._({
    this.id,
    this.videoGameId,
    required this.rentalPrice,
    required this.startDate,
    required this.endDate,
    required this.orderStatus,
  }) : super._();
  @override
  Order rebuild(void Function(OrderBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderBuilder toBuilder() => OrderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
        id == other.id &&
        videoGameId == other.videoGameId &&
        rentalPrice == other.rentalPrice &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        orderStatus == other.orderStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, videoGameId.hashCode);
    _$hash = $jc(_$hash, rentalPrice.hashCode);
    _$hash = $jc(_$hash, startDate.hashCode);
    _$hash = $jc(_$hash, endDate.hashCode);
    _$hash = $jc(_$hash, orderStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Order')
          ..add('id', id)
          ..add('videoGameId', videoGameId)
          ..add('rentalPrice', rentalPrice)
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('orderStatus', orderStatus))
        .toString();
  }
}

class OrderBuilder implements Builder<Order, OrderBuilder> {
  _$Order? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _videoGameId;
  int? get videoGameId => _$this._videoGameId;
  set videoGameId(int? videoGameId) => _$this._videoGameId = videoGameId;

  double? _rentalPrice;
  double? get rentalPrice => _$this._rentalPrice;
  set rentalPrice(double? rentalPrice) => _$this._rentalPrice = rentalPrice;

  String? _startDate;
  String? get startDate => _$this._startDate;
  set startDate(String? startDate) => _$this._startDate = startDate;

  String? _endDate;
  String? get endDate => _$this._endDate;
  set endDate(String? endDate) => _$this._endDate = endDate;

  OrderStatus? _orderStatus;
  OrderStatus? get orderStatus => _$this._orderStatus;
  set orderStatus(OrderStatus? orderStatus) =>
      _$this._orderStatus = orderStatus;

  OrderBuilder();

  OrderBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _videoGameId = $v.videoGameId;
      _rentalPrice = $v.rentalPrice;
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _orderStatus = $v.orderStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Order other) {
    _$v = other as _$Order;
  }

  @override
  void update(void Function(OrderBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Order build() => _build();

  _$Order _build() {
    final _$result =
        _$v ??
        _$Order._(
          id: id,
          videoGameId: videoGameId,
          rentalPrice: BuiltValueNullFieldError.checkNotNull(
            rentalPrice,
            r'Order',
            'rentalPrice',
          ),
          startDate: BuiltValueNullFieldError.checkNotNull(
            startDate,
            r'Order',
            'startDate',
          ),
          endDate: BuiltValueNullFieldError.checkNotNull(
            endDate,
            r'Order',
            'endDate',
          ),
          orderStatus: BuiltValueNullFieldError.checkNotNull(
            orderStatus,
            r'Order',
            'orderStatus',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
