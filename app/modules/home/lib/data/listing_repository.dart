import 'package:home/data/listing_service.dart';
import 'package:home/domain/model/data_result.dart';
import 'package:home/domain/model/listing.dart';

abstract class ListingRepository {

  Future<List<Listing>> fetchListings();

  Future<Listing> fetchListingDetails(String listingId);

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
    final data = result.data?.expand((i) => i!).toList();
    return data ?? Future.error(
      'Failed to fetch listings: ${result.error ?? 'Unknown error'}',
    );
  }

  @override
  Future<Listing> fetchListingDetails(String listingId) async {
    return Future.error(
      'Method not implemented. Please implement fetchListingDetails in ListingRepositoryImpl.',
    );
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