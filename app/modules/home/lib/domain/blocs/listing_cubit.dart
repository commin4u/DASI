import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart';

class ListingCubit extends Cubit<ListingState> {
  ListingCubit({
    required ListingRepository listingRepository,
  }) : _listingRepository = listingRepository,
        super(ListingState.initial());

  final ListingRepository _listingRepository;

  Future<void> loadListings() async {
    emit(ListingState.loading());
    final data = await _listingRepository.fetchListings();
    emit(ListingState.loaded(
      carouselListings: data.take(5).toList(),
      fullListListings: data,
    ));
  }
}