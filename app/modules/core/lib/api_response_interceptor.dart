import 'package:core/data_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApiResponseInterceptor implements Interceptor {

  ApiResponseInterceptor({
    required this.router,
  });

  final GoRouter router;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('API Error: $err');

    if (err.response?.statusCode == 403) {
      debugPrint('Authentication error: ${err.response?.data}');
      router.pushReplacementNamed('auth');
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: 'Unauthorized access',
        ),
      );
      return;
    }

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('API Response: $response');
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

    handler.next(response);
  }
}

var accessToken = '';