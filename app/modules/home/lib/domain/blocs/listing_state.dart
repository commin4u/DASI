import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/blocs/listing_cubit.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/domain/model/order.dart';

part 'listing_state.freezed.dart';

@freezed
abstract class ListingState with _$ListingState {
  factory ListingState.initial() = ListingStateInitial;

  factory ListingState.loading() = ListingStateLoading;

  factory ListingState.loaded({
    required List<VideoGameWIthOrderDto> myOrders,
    required List<Listing> carouselListings,
    required List<Listing> fullListListings,
  }) = ListingStateLoaded;

  factory ListingState.error(String message) = ListingStateError;
}