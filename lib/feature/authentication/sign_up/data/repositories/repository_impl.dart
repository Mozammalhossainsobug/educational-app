import 'package:education_app/feature/authentication/sign_up/data/data_sources/data_source.dart';
import 'package:education_app/feature/authentication/sign_up/domain/repositories/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepositoryImp extends SignUpRepository {
  SignUpRepositoryImp({
    required this.dataSource,
  });
  final SignUpDataSource dataSource;

  @override
  Future<(User?, String)> signUp({
    required Map<String, dynamic> requestBody,
  }) async {
    final email = requestBody['email'] as String;
    final password = requestBody['password'] as String;
    return dataSource.signUpWithEmailAndPassword(email, password);
  }
}
