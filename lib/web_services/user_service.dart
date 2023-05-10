import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/model/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersService {
  final FirebaseAuth _firebaseAuth;

  final FirebaseFirestore _firebaseFireStore;

  UsersService(this._firebaseAuth, this._firebaseFireStore);

  String getCurrentUserEmail() {
    return _firebaseAuth.currentUser!.email!;
  }

  void saveUserData(UserData userData) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(userData.tomap());
  }

  Future<Map<String, dynamic>?> viewUserData() async {
    var documentSnapshot = await _firebaseFireStore
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .get();

    return documentSnapshot.data();
  }

  void updateUserData(Map<String, dynamic> userData) {
    _firebaseFireStore
        .collection('Users')
        .doc(_firebaseAuth.currentUser!.uid)
        .update(userData);
  }
}
