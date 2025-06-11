import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.formData({
    String? email,
    String? password,
  }) = LoginStateFormData;

  const factory LoginState.loading() = LoginStateLoading;

  const factory LoginState.success(int userId) = LoginStateSuccess;

  const factory LoginState.error(
    String message
  ) = LoginStateError;
}