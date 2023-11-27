import 'package:education_app/feature/Authentication/sign_in/data/data_sources/sign_in_data_source.dart';
import 'package:education_app/feature/Authentication/sign_in/domain/repositories/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepositoryImp extends SignInRepository {
  SignInRepositoryImp({
    required this.dataSource,
  });
  final SignInDataSource dataSource;

  @override
  Future<(String, User?)> signIn({
    required Map<String, dynamic> requestBody,
  }) async {
    final email = requestBody['email'] as String;
    final password = requestBody['password'] as String;
    return dataSource.signInWithEmailAndPassword(email, password);
  }
}
