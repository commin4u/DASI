import 'package:core/data_result.dart';
import 'package:home/domain/model/listing.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'listing_service.g.dart';

@RestApi(baseUrl: 'api/video-game')
abstract class ListingService {
  factory ListingService(Dio dio) = _ListingService;

  @GET('/all')
  Future<List<Listing>> fetchListings();

  @GET('/{videoGameId}')
  Future<Listing> fetchListingDetails(@Path('videoGameId') int videoGameId);
}