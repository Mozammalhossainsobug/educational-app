import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<BaseState> {
  SignInNotifier(this.signInUseCase) : super(const BaseState());
  final SignInUseCase signInUseCase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        return;
      }

      state = state.copyWith(status: BaseStatus.loading);
      final requestBody = <String, dynamic>{
        'email': emailController.text,
        'password': passwordController.text,
      };

      final result = await signInUseCase.call(requestBody: requestBody);

      if (result.$1.isEmpty) {
        state = state.copyWith(
          status: BaseStatus.success,
          data: result.$2,
        );
      } else {
        state = state.copyWith(
          status: BaseStatus.failure,
          error: result.$1,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: BaseStatus.failure,
        error: e.toString(),
      );
    }
  }
}
