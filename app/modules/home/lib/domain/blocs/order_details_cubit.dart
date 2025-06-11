import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/data/order_service.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/domain/model/order.dart';

part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit({
    required OrderService orderService,
    required ListingRepository listingRepository,
  }) : _orderService = orderService,
        _listingRepository = listingRepository,
        super(OrderDetailsState.initial());

  final OrderService _orderService;
  final ListingRepository _listingRepository;

  Future<void> get(int id) async {
    emit(OrderDetailsState.loading());
    final data = await _orderService.getOrderDetails(id);
    if (data.videoGameId != null) {
      final listing = await _listingRepository.fetchListingDetails(data.videoGameId!);

      emit( OrderDetailsState.loaded(data: data, listing: listing) );
    }
  }
}

@freezed
abstract class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState.initial() = OrderDetailsStateInitial;
  const factory OrderDetailsState.loading() = OrderDetailsStateLoading;
  const factory OrderDetailsState.loaded({
    required Order data,
    required Listing? listing,
  }) = OrderDetailsStateLoaded;
  const factory OrderDetailsState.error(String message) = OrderDetailsStateError;
}