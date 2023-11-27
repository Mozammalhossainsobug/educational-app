import 'package:education_app/core/base/state.dart';
import 'package:education_app/feature/Authentication/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:education_app/feature/Authentication/sign_in/presentation/riverpods/sign_in_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInNotifier, BaseState>(
  (ref) => SignInNotifier(
    ref.watch(signInUseCaseProvider),
  ),
);
