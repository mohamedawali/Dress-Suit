import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  var url, _signUp_userCredential, _signIn_userCredential;
  AuthService(this._firebaseAuth);

  Future signUp(String email, String pass) async {
    try {
      _signUp_userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      _signUp_userCredential = e.credential;
    }

    return _signUp_userCredential;
  }

  Future signIn(String email, String pass) async {
    try {
      _signIn_userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);

    } on FirebaseAuthException catch (e) {
      _signIn_userCredential = e.credential;

    }
    return _signIn_userCredential;
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }

  getCurrentUserId() {
    return _firebaseAuth.currentUser?.uid;
  }


  Future resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
    }
  }
}
