import 'dart:async';
import 'dart:convert';

import 'package:authentication/data/token_storage_service.dart';
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
        super(const LoginState.formData(email: null, password: null)) {

    updateUserState();
  }

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
      case LoginStateSuccess _:
        // If the user is already logged in, we don't need to change the password
        // so we can ignore this event.
        emit(LoginState.formData(email: null, password: password));
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
      case LoginStateSuccess _:
      // If the user is already logged in, we don't need to change the password
      // so we can ignore this event.
        emit(LoginState.formData(email: email, password: null));
    }
  }

  Future<void> submitLogin() async {
    final currentState = state;
    debugPrint('Current state: $currentState');
    if (currentState is LoginStateFormData) {
      try {
        emit(const LoginState.loading());

        final loginRequest = 'Basic ${base64Encode(utf8.encode('${currentState.email}:${currentState.password}'))}';
        debugPrint('Submitting login with request: $loginRequest');
        final result = await _authLoginService.submitLogin(loginRequest);
        debugPrint('Login result: $result');
        if (result.accessToken != null) {
          await _tokenStorageService.saveToken(
            accessToken: result.accessToken!,
          );

          final tokenJson = parseJwt(result.accessToken!);
          final userId = tokenJson['sub'] as String?;
          final userIdInt = int.tryParse(userId ?? '');

          emit(LoginState.success(userIdInt!));
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

  Future<void> logout() async {
    try {
      await _tokenStorageService.clearToken();
      emit(const LoginState.formData(email: null, password: null));
    } catch (e) {
      debugPrint('Logout error: $e');
      emit(LoginState.error('Logout failed'));
    }
  }

  Future<void> updateUserState() async {
    final accessToken = await _tokenStorageService.getAccessToken();
    debugPrint('Updating user state with access token: $accessToken');
    if (accessToken != null) {
      final tokenJson = parseJwt(accessToken);
      final userId = tokenJson['sub'] as String?;
      final userIdInt = int.tryParse(userId ?? '');

      emit(LoginState.success(userIdInt!));
    } else {
      emit(LoginState.error('Login failed'));
    }
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
