import 'package:dio/dio.dart';
import 'package:home/domain/model/order_request.dart';
import 'package:retrofit/retrofit.dart';


part 'order_service.g.dart';

@RestApi(baseUrl: 'api/order')
abstract class OrderService {
  factory OrderService(Dio dio) = _OrderService;

  @POST('/{listingId}')
  Future<void> placeOrder(
    @Path('listingId') int listingId,
    @Body() OrderRequest orderData,
  );
}
