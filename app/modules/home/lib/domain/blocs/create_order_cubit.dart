import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/blocs/create_order_state.dart';
import 'package:home/domain/model/order_request.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit() : super(CreateOrderState.initial());

  void submitOrderRequest(OrderRequest order) {
  }
}