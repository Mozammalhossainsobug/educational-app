part of 'data_source.dart';

class SignUpDataSourceImp extends SignUpDataSource {
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
}
