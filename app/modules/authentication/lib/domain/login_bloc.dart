import 'dart:async';
import 'dart:convert';

import 'package:core/api_response_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/login_service.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required LoginService repository,
  })
      : _repository = repository,
        super(const LoginState.formData(email: null, password: null));

  final LoginService _repository;

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
        final result = await _repository.submitLogin(loginRequest);
        debugPrint('Login result: $result');
        if (result.accessToken != null) {
          emit(LoginState.success());
          accessToken = result.accessToken!;
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
