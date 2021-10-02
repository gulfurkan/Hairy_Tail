import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);
  Stream<User> get authStateChange => _firebaseAuth.authStateChanges();
  Future<String> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "basarılı giriş";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> createAc(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "basarılı kayıt";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
