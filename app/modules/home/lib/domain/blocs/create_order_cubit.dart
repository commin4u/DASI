import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/data/order_service.dart';
import 'package:home/domain/blocs/create_order_state.dart';
import 'package:home/domain/model/order_request.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  final OrderService orderService;

  CreateOrderCubit({
    required this.orderService,
  }) : super(CreateOrderState.initial());

  void submitOrderRequest({
    required int listingId,
    required String startDate,
    required int numberOfDays,
  }) {
    emit(CreateOrderState.loading());

    final order = OrderRequest(
        (OrderRequestBuilder b) => b
          ..startDate = startDate
          ..numberOfDays = numberOfDays
    );

    orderService.placeOrder(listingId, order).then((_) {
      emit(CreateOrderState.placed());
    }).catchError((error) {
      emit(CreateOrderState.error(error.toString()));
    });
  }
}