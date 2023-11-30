import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'data_source_impl.dart';

final signUpDataSourceProvider = Provider<SignUpDataSourceImp>(
  (ref) => SignUpDataSourceImp(),
);

abstract class SignUpDataSource {
  Future<(User?, String)> signUpWithEmailAndPassword(
      String email, String password);
}
