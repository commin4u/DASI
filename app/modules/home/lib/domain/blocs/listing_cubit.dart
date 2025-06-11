import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/data/order_service.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/domain/model/order.dart';
import 'package:collection/collection.dart';

class ListingCubit extends Cubit<ListingState> {
  ListingCubit({
    required ListingRepository listingRepository,
    required OrderService orderService,
  }) : _listingRepository = listingRepository,
        _orderService = orderService,
        super(ListingState.initial());

  final ListingRepository _listingRepository;
  final OrderService _orderService;

  Future<void> loadListings(int? userId) async {
    emit(ListingState.loading());
    final data = await _listingRepository.fetchListings();
    final orders = await _orderService.getAllUserOrders();

    // map orders to VideoGameWIthOrderDto
    final myOrders = orders.map((order) {
      final videoGame = data.firstWhereOrNull((Listing listing) => listing.id == order.videoGameId);
      if (videoGame == null) {
        return null; // Skip orders with no matching video game
      }
      return VideoGameWIthOrderDto(videoGame: videoGame, order: order);
    }).toList();
    // Filter out null values
    final filteredOrders = myOrders.nonNulls.toList();

    emit(ListingState.loaded(
      myOrders: filteredOrders,
      carouselListings: data.take(5).toList(),
      fullListListings: data,
      myGames: data.where((listing) => listing.addedByUserId == userId).toList(),
    ));
  }
}

class VideoGameWIthOrderDto {
  VideoGameWIthOrderDto({
    required this.videoGame,
    required this.order,
  });

  final Listing videoGame;
  final Order order;
}