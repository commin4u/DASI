import 'package:dio/dio.dart';
import 'package:home/domain/model/listing.dart';
import 'package:retrofit/retrofit.dart';

part 'listing_service.g.dart';

@RestApi(baseUrl: 'api/')
abstract class ListingService {
  factory ListingService(Dio dio) = _ListingService;

  @GET('video-game/all')
  Future<List<Listing>> fetchListings();

  @GET('video-game/{videoGameId}')
  Future<Listing> fetchListingDetails(@Path('videoGameId') int videoGameId);
}
