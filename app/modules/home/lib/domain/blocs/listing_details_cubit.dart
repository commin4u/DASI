import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/data/listing_repository.dart';
import 'package:home/domain/blocs/listing_details_state.dart';
import 'package:home/domain/blocs/listing_state.dart';
import 'package:home/domain/model/listing.dart';

class ListingDetailsCubit extends Cubit<ListingDetailsState> {
  ListingDetailsCubit({
    required ListingRepository listingRepository,
  }) : _listingRepository = listingRepository,
        super(ListingDetailsState.initial());

  final ListingRepository _listingRepository;

  Future<void> get(int id) async {
    emit(ListingDetailsState.loading());
    final data = await _listingRepository.fetchListingDetails(id);
    emit(ListingDetailsState.loaded(data: data));
  }
}