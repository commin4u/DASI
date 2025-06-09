import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:home/domain/model/serializers.dart';

part 'order_request.g.dart';

abstract class OrderRequest implements Built<OrderRequest, OrderRequestBuilder> {
  OrderRequest._();

  factory OrderRequest([void Function(OrderRequestBuilder) updates]) = _$OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) => serializers.deserializeWith(serializer, json)!;

  static Serializer<OrderRequest> get serializer => _$orderRequestSerializer;

  String get startDate;
  int get numberOfDays;
}