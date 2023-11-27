import 'package:education_app/feature/Authentication/sign_in/data/data_sources/sign_in_data_source.dart';
import 'package:education_app/feature/Authentication/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInRepositoryProvider = Provider<SignInRepository>(
  (ref) {
    final dataSource = ref.read(signInDataSourceProvider);
    return SignInRepositoryImp(
      dataSource: dataSource,
    );
  },
);

abstract class SignInRepository {
  Future<(String, User?)> signIn({
    required Map<String, dynamic> requestBody,
  });
}
