import 'dart:async';

import 'package:authentication/domain/models/login_data.dart';
import 'package:authentication/domain/models/login_request.dart';
import 'package:core/domain_result.dart';
import 'package:flutter/material.dart';
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
      emit(const LoginState.loading());

      final result = await _repository.submitLogin(
        LoginRequest((b) => b
          ..email = currentState.email
          ..password = currentState.password),
      );

      debugPrint('LoginCubit.submitLogin: $result');
      switch (result) {
        case DomainSuccess<LoginData> _:
          emit(LoginState.success());
          emit(currentState);
          break;
        case DomainError error:
          emit(LoginState.error(error.error));
          emit(currentState);
          return;
      }
    }
  }
}
