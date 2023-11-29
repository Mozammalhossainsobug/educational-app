import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/authentication/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpNotifier extends StateNotifier<BaseState> {
  SignUpNotifier(this.signUpUseCase) : super(const BaseState());
  final SignUpUseCase signUpUseCase;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    print('came here1');
    try {
      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        return;
      }

      print('hello2');

      state = state.copyWith(status: BaseStatus.loading);
      final requestBody = <String, dynamic>{
        'email': emailController.text,
        'password': passwordController.text,
      };

      final result = await signUpUseCase.call(requestBody: requestBody);

      if (result.$2.isEmpty) {
        state = state.copyWith(
          status: BaseStatus.success,
          data: result.$1,
        );
      } else {
        state = state.copyWith(
          status: BaseStatus.failure,
          error: result.$2,
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
