import 'package:education_app/core/services/firebase_service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServiceImp extends FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<(User?, String)> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return (credential.user, '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return (null, 'The email address is already in use.');
      } else {
        return (null, 'An error occurred: ${e.code}');
      }
    }
  }

  @override
  Future<(User?, String)> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return (credential.user, '');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return (null, 'Invalid email or password.');
      } else {
        return (null, 'An error occurred: ${e.code}');
      }
    }
  }
}
