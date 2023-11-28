import 'package:education_app/feature/authentication/sign_up/data/data_sources/data_source.dart';
import 'package:education_app/feature/authentication/sign_up/data/repositories/repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpRepositoryProvider = Provider<SignUpRepository>(
  (ref) {
    final dataSource = ref.read(signUpDataSourceProvider);
    return SignUpRepositoryImp(
      dataSource: dataSource,
    );
  },
);

abstract class SignUpRepository {
  Future<(User?, String)> signUp({
    required Map<String, dynamic> requestBody,
  });
}
