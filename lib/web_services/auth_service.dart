import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  var url, _signUp_userCredential,_signIn_userCredential;

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
      print('kfm${_signIn_userCredential}');
    } on FirebaseAuthException catch (e) {
      _signIn_userCredential = e.credential;
      print('Ekfm${_signIn_userCredential}');
    }
    return _signIn_userCredential;
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }

  getCurrentUserId() {
    return _firebaseAuth.currentUser?.uid;
  }

  // Future getCurrentEmail() async {
  //   return _firebaseAuth.currentUser!.email!;
  // }

  Future resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
    }
  }
}
