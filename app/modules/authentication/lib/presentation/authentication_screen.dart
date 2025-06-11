import 'package:authentication/domain/login_bloc.dart';
import 'package:authentication/domain/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  late final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: BlocListener(
        bloc: context.read<LoginCubit>(),
        listener: (BuildContext context, LoginState state) {
          if (state is LoginStateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is LoginStateSuccess) {
            context.replaceNamed('home');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Authentication Screen'),
              const SizedBox(height: 20),
              _textField(
                context: context,
                label: 'Email',
                textInputAction: TextInputAction.next,
                obscureText: false,
                onChanged: (String value) {
                  context.read<LoginCubit>().onEmailChange(value);
                },
              ),
              const SizedBox(height: 24),
              _textField(
                context: context,
                label: "Password",
                textInputAction: TextInputAction.done,
                obscureText: true,
                onChanged: (String value) {
                  context.read<LoginCubit>().onPasswordChange(value);
                },
                onSubmitted: (String value) {
                  context.read<LoginCubit>().submitLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required BuildContext context,
    required String label,
    required TextInputAction textInputAction,
    required ValueChanged<String>? onChanged,
    required bool obscureText,
    ValueChanged<String>? onSubmitted,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}