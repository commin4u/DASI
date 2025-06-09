import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:core/data_result.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/domain/model/order.dart';
import 'package:home/domain/model/order_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  Listing,
  Order,
  OrderRequest,
  DataResult,
  RentalTier,
  Platform,
])
final Serializers serializers = ( _$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
).build();