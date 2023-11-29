import 'package:education_app/feature/authentication/sign_up/domain/repositories/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpUseCaseProvider = Provider<SignUpUseCase>(
  (ref) {
    final repository = ref.read(signUpRepositoryProvider);
    return SignUpUseCase(repository: repository);
  },
);

class SignUpUseCase {
  const SignUpUseCase({required this.repository});

  final SignUpRepository repository;

  Future<(User?, String)> call({
    required Map<String, dynamic> requestBody,
  }) async {
    return repository.signUp(requestBody: requestBody);
  }
}
