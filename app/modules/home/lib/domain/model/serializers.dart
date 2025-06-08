import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:home/domain/model/data_result.dart';
import 'package:home/domain/model/listing.dart';
import 'package:home/domain/model/order.dart';
import 'package:home/domain/model/order_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  Listing,
  Order,
  OrderRequest,
  DataResult,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(DataResult, [FullType(String)]),
        () => DataResultBuilder<String>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      ))
    .build();
