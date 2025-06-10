import 'package:authentication/data/token_storage_service.dart';
import 'package:core/api_response_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthorizationInterceptor implements Interceptor {

  AuthorizationInterceptor({
    required this.tokenStorageService,
  });

  final TokenStorageService tokenStorageService;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await tokenStorageService.getAccessToken();
    options.headers = {
      ...options.headers,
      'Authorization': 'Bearer $accessToken',
    };
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