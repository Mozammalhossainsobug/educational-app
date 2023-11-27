import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/Authentication/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:education_app/feature/Authentication/sign_up/presentation/riverpods/sign_up_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, BaseState>(
  (ref) => SignUpNotifier(
    ref.watch(signUpUseCaseProvider),
  ),
);
