import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_request.g.dart';

abstract class OrderRequest implements Built<OrderRequest, OrderRequestBuilder> {
  OrderRequest._();

  factory OrderRequest([void Function(OrderRequestBuilder) updates]) = _$OrderRequest;

  static Serializer<OrderRequest> get serializer => _$orderRequestSerializer;

  String get listingId;
  String get startDate;
  int get numberOfDays;
}