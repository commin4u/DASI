import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/model/listing.dart';

part 'listing_details_state.freezed.dart';

@freezed
abstract class ListingDetailsState with _$ListingDetailsState {
  factory ListingDetailsState.initial() = ListingDetailsStateInitial;

  factory ListingDetailsState.loading() = ListingDetailsStateLoading;

  factory ListingDetailsState.loaded({
    required Listing data,
  }) = ListingDetailsStateLoaded;

  factory ListingDetailsState.error(String message) = ListingDetailsStateError;
}