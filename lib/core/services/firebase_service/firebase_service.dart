import 'package:education_app/core/services/firebase_service/firebase_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>(
  (ref) {
    return FirebaseAuthServiceImp();
  },
);

abstract class FirebaseAuthService {
  Future<(User?, String)> signUpWithEmailAndPassword(
      String email, String password);

  Future<(User?, String)> signInWithEmailAndPassword(
      String email, String password);
}
