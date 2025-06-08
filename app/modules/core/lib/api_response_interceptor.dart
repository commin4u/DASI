import 'package:core/data_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiResponseInterceptor implements Interceptor {

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final data = response.data['data'];
    final error = response.data['error'];
    if (error != null) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: error,
        ),
      );
      return;
    }
    if (data == null) {
      handler.next(response);
      return;
    }
    response.data = data;

    debugPrint('API Response: ${response.data}');
    handler.next(response);
  }
}