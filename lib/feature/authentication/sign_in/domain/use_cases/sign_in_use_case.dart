import 'package:education_app/feature/authentication/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInUseCaseProvider = Provider<SignInUseCase>(
  (ref) {
    final repository = ref.read(signInRepositoryProvider);
    return SignInUseCase(repository: repository);
  },
);

class SignInUseCase {
  const SignInUseCase({required this.repository});

  final SignInRepository repository;

  Future<(String, User?)> call({
    required Map<String, dynamic> requestBody,
  }) async {
    return repository.signIn(requestBody: requestBody);
  }
}
