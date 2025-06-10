import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:home/domain/model/serializers.dart';

part 'order.g.dart';

abstract class Order implements Built<Order, OrderBuilder> {
  Order._();

  factory Order([void Function(OrderBuilder) updates]) = _$Order;

  factory Order.fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;

  static Serializer<Order> get serializer => _$orderSerializer;

  int? get id;
  int? get videoGameId;
  double get rentalPrice;
  String get startDate;
  String get endDate;

  OrderStatus get orderStatus;
}

class OrderStatus extends EnumClass {
  static Serializer<OrderStatus> get serializer => _$orderStatusSerializer;
  @BuiltValueEnumConst(wireName: 'CREATED')
  static const OrderStatus created = _$created;
  @BuiltValueEnumConst(wireName: 'IN_PROGRESS')
  static const OrderStatus inProgress = _$inProgress;
  @BuiltValueEnumConst(wireName: 'CLOSED')
  static const OrderStatus closed = _$closed;

  const OrderStatus._(super.name);

  static BuiltSet<OrderStatus> get values => _$orderStatusValues;
  static OrderStatus valueOf(String name) => _$orderStatusValueOf(name);
}