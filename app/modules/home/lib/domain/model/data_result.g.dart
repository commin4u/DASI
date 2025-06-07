// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataResult<Object?>> _$dataResultSerializer =
    _$DataResultSerializer();

class _$DataResultSerializer
    implements StructuredSerializer<DataResult<Object?>> {
  @override
  final Iterable<Type> types = const [DataResult, _$DataResult];
  @override
  final String wireName = 'DataResult';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    DataResult<Object?> object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'data',
      serializers.serialize(
        object.data,
        specifiedType: FullType(BuiltList, [parameterT]),
      ),
    ];
    Object? value;
    value = object.error;
    if (value != null) {
      result
        ..add('error')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }
    return result;
  }

  @override
  DataResult<Object?> deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result =
        isUnderspecified
            ? DataResultBuilder<Object?>()
            : serializers.newBuilder(specifiedType)
                as DataResultBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'error':
          result.error =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String?;
          break;
        case 'data':
          result.data.replace(
            serializers.deserialize(
                  value,
                  specifiedType: FullType(BuiltList, [parameterT]),
                )!
                as BuiltList<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$DataResult<T> extends DataResult<T> {
  @override
  final String? error;
  @override
  final BuiltList<T> data;

  factory _$DataResult([void Function(DataResultBuilder<T>)? updates]) =>
      (DataResultBuilder<T>()..update(updates))._build();

  _$DataResult._({this.error, required this.data}) : super._();
  @override
  DataResult<T> rebuild(void Function(DataResultBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataResultBuilder<T> toBuilder() => DataResultBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataResult && error == other.error && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DataResult')
          ..add('error', error)
          ..add('data', data))
        .toString();
  }
}

class DataResultBuilder<T>
    implements Builder<DataResult<T>, DataResultBuilder<T>> {
  _$DataResult<T>? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  ListBuilder<T>? _data;
  ListBuilder<T> get data => _$this._data ??= ListBuilder<T>();
  set data(ListBuilder<T>? data) => _$this._data = data;

  DataResultBuilder();

  DataResultBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataResult<T> other) {
    _$v = other as _$DataResult<T>;
  }

  @override
  void update(void Function(DataResultBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DataResult<T> build() => _build();

  _$DataResult<T> _build() {
    _$DataResult<T> _$result;
    try {
      _$result = _$v ?? _$DataResult<T>._(error: error, data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'DataResult',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
