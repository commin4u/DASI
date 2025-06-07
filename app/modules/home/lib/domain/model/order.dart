import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order.g.dart';

abstract class Order implements Built<Order, OrderBuilder> {
  Order._();

  factory Order([void Function(OrderBuilder) updates]) = _$Order;

  static Serializer<Order> get serializer => _$orderSerializer;

  String get id;
  String get videoGameId;
  double get rentalPrice;
  String get startDate;
  String get endDate;

  OrderStatus get status;
}

class OrderStatus extends EnumClass {
  static const OrderStatus created = _$created;
  static const OrderStatus inProgress = _$inProgress;
  static const OrderStatus closed = _$closed;

  const OrderStatus._(super.name);

  static BuiltSet<OrderStatus> get values => _$orderStatusValues;
  static OrderStatus valueOf(String name) => _$orderStatusValueOf(name);
}