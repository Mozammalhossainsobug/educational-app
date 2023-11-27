import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'sign_in_data_source_impl.dart';

final signInDataSourceProvider = Provider<SignInDataSource>(
  (ref) => SignInDataSourceImp(),
);

abstract class SignInDataSource {
  FutureOr<(String, User?)> signInWithEmailAndPassword(
      String email, String password);
}
