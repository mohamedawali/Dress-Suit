import 'dart:ffi';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:dress_suit/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class ProductService {
  FirebaseStorage _firebaseStorage=  FirebaseStorage.instance;
  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;



  var products_id;
  var users_id;
  var  image_url;






  Future uploadProductImage(File _image) async {
    Reference reference = _firebaseStorage.ref().child(path.basename(_image.path));
   UploadTask putFiles = reference.putFile(_image);
   await putFiles.whenComplete(() async=>
  image_url= await reference.getDownloadURL());
      return image_url;
    }




  Future saveProduct(ProductData productData) async {

     products_id = await _firebaseFirestore.collection('Products').doc().id;
 users_id=    _firebaseAuth.currentUser!.uid;
productData.product_id =products_id;
productData.user_id=users_id;

    await _firebaseFirestore
        .collection('Products')
        .doc(products_id)
        .set(productData.productToMap());


  }



  Future<List<QueryDocumentSnapshot<Map<String,dynamic>>>> viewDressProduct() async {
    var querySnapshotDressProduct = await _firebaseFirestore
        .collection('Products').where('type', isEqualTo: 'dress').
        get();

    return querySnapshotDressProduct.docs;
  }

  Future <List<QueryDocumentSnapshot<Map<String, dynamic>>>> viewSuitProduct() async {
    var querySnapshotSuitProduct = await _firebaseFirestore
        .collection('Products')
        .where('type', isEqualTo: 'suit')
        .get();

    return querySnapshotSuitProduct.docs;
  }


  Future <List<QueryDocumentSnapshot<Map<String, dynamic>>>> viewUserProduct() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('user_id', isEqualTo: uid)
        .get();
    return querySnapshot.docs;
  }





  void deletItem(String product_id)async {

   await   _firebaseFirestore.collection('Products').doc(product_id).delete();

  }
  void deletImage(List<String> image_url)async {
for(int i=0;i<image_url.length;i++) {
  await _firebaseStorage.refFromURL(image_url[i].toString()).delete();
}
    }
}


