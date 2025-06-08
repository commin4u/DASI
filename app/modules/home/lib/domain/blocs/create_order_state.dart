import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/model/order.dart';

part 'create_order_state.freezed.dart';

@freezed
abstract class CreateOrderState with _$CreateOrderState {
  factory CreateOrderState.initial() = CreateOrderStateInitial;

  factory CreateOrderState.loading() = CreateOrderStateLoading;

  factory CreateOrderState.placed(List<Order> orders) = CreateOrderStatePlaced;

  factory CreateOrderState.error(String message) = CreateOrderStateError;
}