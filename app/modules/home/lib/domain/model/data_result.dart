import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:home/domain/model/serializers.dart';

part 'data_result.g.dart';

abstract class DataResult<T> implements Built<DataResult<T>, DataResultBuilder<T>> {
  DataResult._();

  static Serializer<DataResult> get serializer => _$dataResultSerializer;

  factory DataResult([void Function(DataResultBuilder<T>) updates]) = _$DataResult<T>;

  static DataResult<T> fromJson<T>(Map<String, dynamic> json) => serializers.deserialize(
      json,
      specifiedType: FullType(DataResult, [FullType(T)]),
    ) as DataResult<T>;

  String? get error;
  BuiltList<T> get data;
}

