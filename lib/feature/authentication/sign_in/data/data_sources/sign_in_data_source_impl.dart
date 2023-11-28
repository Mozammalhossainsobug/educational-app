part of 'sign_in_data_source.dart';

class SignInDataSourceImp extends SignInDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<(String, User?)> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return ('', credential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return ('Invalid email or password.', null);
      } else {
        return ('An error occurred: ${e.code}', null);
      }
    }
  }
}
