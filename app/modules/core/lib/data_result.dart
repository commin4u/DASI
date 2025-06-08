class DataResult<T> {
  DataResult({this.error, this.data});

  static DataResult<T> fromJson<T>(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return DataResult<T>(error: 'Empty response', data: null);
    }
    if (json.containsKey('error')) {
      return DataResult<T>(error: json['error'] as String, data: null);
    }
    if (json.containsKey('data')) {
      return DataResult<T>(error: null, data: json['data'] as T);
    }
    return DataResult<T>(error: 'Unknown response format', data: null);
  }

  final String? error;
  final T? data;
}
