import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignFire {
  UserCredential? userCredential;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<SharedPreferences> instance = SharedPreferences.getInstance();
  String? id;

  Future signUp(String email, String pass) async {
    userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);

    SharedPreferences sharedPreferences = await instance;
    id = userCredential!.user!.uid;
    sharedPreferences.setString('id', id!);
  }

  Future signIn(String email, String pass) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
  }


  void logOut() async {
    await _firebaseAuth.signOut();
  }

// String getCurrentUser()  {
//
//   return _firebaseAuth.currentUser!.uid;
//
// }
}
