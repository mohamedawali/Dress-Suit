import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class ProductService {
  final FirebaseStorage _firebaseStorage;

  final FirebaseFirestore _firebaseFireStore;

  final FirebaseAuth _firebaseAuth;
  var productsId;
  var usersId;
  var imageUrl;
  ProductService(
      this._firebaseStorage, this._firebaseFireStore, this._firebaseAuth);

  Future uploadProductImage(File image) async {
    Reference reference =
        _firebaseStorage.ref().child(path.basename(image.path));
    UploadTask putFiles = reference.putFile(image);
    await putFiles
        .whenComplete(() async => imageUrl = await reference.getDownloadURL());
    return imageUrl;
  }

  Future saveProduct(ProductData productData) async {
    productsId = _firebaseFireStore.collection('Products').doc().id;
    usersId = _firebaseAuth.currentUser!.uid;
    productData.product_id = productsId;
    productData.user_id = usersId;

    await _firebaseFireStore
        .collection('Products')
        .doc(productsId)
        .set(productData.productToMap());
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      viewDressProduct() async {
    var querySnapshotDressProduct = await _firebaseFireStore
        .collection('Products')
        .where('type', isEqualTo: 'dress')
        .get();

    return querySnapshotDressProduct.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      viewSuitProduct() async {
    var querySnapshotSuitProduct = await _firebaseFireStore
        .collection('Products')
        .where('type', isEqualTo: 'suit')
        .get();

    return querySnapshotSuitProduct.docs;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      viewUserProduct() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Products')
        .where('user_id', isEqualTo: uid)
        .get();
    return querySnapshot.docs;
  }

  Future deleteItem(String productId) async {
    await _firebaseFireStore.collection('Products').doc(productId).delete();
  }

  void deleteImage(List<String> imageUrl) async {
    for (int i = 0; i < imageUrl.length; i++) {
      await _firebaseStorage.refFromURL(imageUrl[i].toString()).delete();
    }
  }
}
