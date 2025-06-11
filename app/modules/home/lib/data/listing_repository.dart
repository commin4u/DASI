import 'package:dio/dio.dart';
import 'package:home/data/listing_service.dart';
import 'package:home/domain/model/listing.dart';

abstract class ListingRepository {

  Future<List<Listing>> fetchListings();

  Future<Listing> fetchListingDetails(int listingId);

  Future<void> saveListing({
    required MultipartFile image,
    required String title,
    required String rentalTier,
    required String platform,
  });

  Future<void> deleteListing(String listingId);
}

class ListingRepositoryImpl implements ListingRepository {

  ListingRepositoryImpl({
    required ListingService listingService,
    required this.dio,
  }) : _listingService = listingService;

  final ListingService _listingService;

  final Dio dio;

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
  Future<void> saveListing({
    required MultipartFile image,
    required String title,
    required String rentalTier,
    required String platform,
  }) async {
    try {
      await dio.post(
        '/api/video-game',
        data: FormData.fromMap({
          'image': image,
          'title': title,
          'rentalTier': rentalTier,
          'platform': platform,
        }),
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        )
      );
    } catch (e) {
      return Future.error('Failed to save listing: $e');
    }
  }

  @override
  Future<void> deleteListing(String listingId) async {
    return Future.error(
      'Method not implemented. Please implement fetchListingDetails in ListingRepositoryImpl.',
    );
  }
}