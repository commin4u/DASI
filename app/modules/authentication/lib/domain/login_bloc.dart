import 'dart:async';
import 'dart:convert';

import 'package:authentication/data/token_storage_service.dart';
import 'package:core/api_response_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required LoginService authLoginService,
    required TokenStorageService tokenStorageService,
  })
      : _authLoginService = authLoginService,
        _tokenStorageService = tokenStorageService,
        super(const LoginState.formData(email: null, password: null));

  final LoginService _authLoginService;

  final TokenStorageService _tokenStorageService;

  void onPasswordChange(String password) {
    switch (state) {
      case LoginStateFormData currentState:
        emit(currentState.copyWith(password: password));
        break;
      case LoginStateLoading _:
        break;
      case LoginStateError _:
        break;
    }
  }

  void onEmailChange(String email) {
    switch (state) {
      case LoginStateFormData currentState:
        emit(currentState.copyWith(email: email));
        break;
      case LoginStateLoading _:
        break;
      case LoginStateError _:
        break;
    }
  }

  Future<void> submitLogin() async {
    final currentState = state;
    if (currentState is LoginStateFormData) {
      try {
        emit(const LoginState.loading());

        final loginRequest = 'Basic ${base64Encode(utf8.encode('${currentState.email}:${currentState.password}'))}';
        debugPrint('Submitting login with request: $loginRequest');
        final result = await _authLoginService.submitLogin(loginRequest);
        debugPrint('Login result: $result');
        if (result.accessToken != null) {
          emit(LoginState.success());
          await _tokenStorageService.saveToken(
            accessToken: result.accessToken!,
          );

        } else {
          emit(LoginState.error('Login failed'));
        }
      } on DioException catch (e, s) {
        debugPrint('Login error: $e');
        emit(LoginState.error('Login failed, try another email or password'));
      } on Exception catch (e, s) {
        debugPrint('Login error: $e');
        debugPrint('Stack trace: $s');
        emit(LoginState.error('Login failed due to an unexpected error'));
      } finally {
        emit(currentState);
      }
    }
  }
}
