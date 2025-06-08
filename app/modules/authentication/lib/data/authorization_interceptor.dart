import 'package:core/api_response_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthorizationInterceptor implements Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      ...options.headers,
      'Authorization': 'Bearer $accessToken',
    };
    debugPrint('API Request: ${options.method} ${options.path}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject( err );
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}