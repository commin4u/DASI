import 'package:home/data/listing_service.dart';
import 'package:home/domain/model/listing.dart';

abstract class ListingRepository {

  Future<List<Listing>> fetchListings();

  Future<Listing> fetchListingDetails(int listingId);

  Future<void> saveListing(Listing listing);

  Future<void> deleteListing(String listingId);
}

class ListingRepositoryImpl implements ListingRepository {

  ListingRepositoryImpl({
    required ListingService listingService
  }) : _listingService = listingService;

  final ListingService _listingService;

  @override
  Future<List<Listing>> fetchListings() async {
    final result = await _listingService.fetchListings();
    return result;
  }

  @override
  Future<Listing> fetchListingDetails(int listingId) async {
    final result = await _listingService.fetchListingDetails(listingId);
    return result;
  }

  @override
  Future<void> saveListing(Listing listing) async {
    return Future.error(
      'Method not implemented. Please implement fetchListingDetails in ListingRepositoryImpl.',
    );
  }

  @override
  Future<void> deleteListing(String listingId) async {
    return Future.error(
      'Method not implemented. Please implement fetchListingDetails in ListingRepositoryImpl.',
    );
  }
}