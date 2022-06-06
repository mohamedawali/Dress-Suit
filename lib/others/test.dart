// import 'package:dress_suit/connection/products_service.dart';
// import 'package:flutter/material.dart';
// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   Product product=Product();
//   @override
//   void initState() {
// product.viewUserProduct();
// super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: SafeArea(child: Container(height: 150,width: 300,
//         //height: 150,width: MediaQuery.of(context).size.width-140,
//         child:ListView.builder(scrollDirection:Axis.horizontal,itemCount: 10,itemBuilder: (context,index)=>Container(height:30,width: 30,color: Colors.orange)))));
//   }
// }
// Future uploadProductImage(File _image) async {
//   Reference reference = FirebaseStorage.instance.ref().child('ProductsImage');
//   for (int i = 0; i < imges.length; i++) {
//     var childs = reference.child(path.basename(imges[i].path));
//     await childs
//         .putFile(imges[i])
//         .then((p0) => p0.ref.getDownloadURL().then((value) {
//               url = value;
//
//               urlList.add(url);
//             }));
//   }
//
//   print('the list2 ${urlList}');
//   return urlList;
// }
//////////////
//Future uploadProductImage(File _image) async {
//     Reference storageReference =
//     FirebaseStorage.instance.ref().child('posts/${_image.path}');
//     UploadTask uploadTask = storageReference.putFile(_image);
//     await uploadTask.whenComplete(() async =>
//     await storageReference.getDownloadURL().then((value) => s = value));
//     print(s);
//     return s;
// //return v;
//     // return await storageReference.getDownloadURL();
//   }
    ///////////////////
// class MyProduct extends StatelessWidget {
//  //BlocProvider.of<UserCubit>(context);
//
//   List<ProductData> userProduct = [] ;
// //UserCubit userCubit=UserCubit();
//   //var bloc;
//   Repository r=Repository();
//   Product product=Product();
//    MyProduct({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BlocBuilder<UserCubit, UserState>(
//       builder: (context, state) {
// //userProduct=userCubit.count_userProduct;
//     if(state is getUserProduct )
//         userProduct=state.userProduct;
//     //   userProduct = state.userProduct;
//     //   print(userProduct);
//
//       return  Container(child: GridView.builder(
//         shrinkWrap: true,
//         physics: PageScrollPhysics(),
//         itemCount: userProduct.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2 / 3.2), itemBuilder:(context,index) =>Padding(
//         padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
//         child: Card(
//           elevation: 15,
//           child: listItem(index)
//         ),
//       )
//      ,
//     ));
//       // Container(
//       //   child: ListView.builder(
//       //       scrollDirection: Axis.vertical,
//       //       itemCount: 1,
//       //       itemBuilder: (context, index) => listItem()),
//       // ),
//       })
//     );
//   }
//
//   Widget listItem(int index) {
//     return Column(
//       children: [
//         Container(
//           height:50,
//           //MediaQuery.of(BuildContext context).
//           //size.height-600,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: NetworkImage(userProduct[index].image!.isEmpty
//                       ? ''
//                       : userProduct[index].image![0])
//                 // allproduct[index].image!.isEmpty
//                 // ? ''
//                 // : allproduct[index].image![0]
//               )),
//         ),
//         Text(
//           userProduct[index].name!,
//           //  'فستان فستان احمر احمر سواريه سواريه جميل جدا جدا جدا نص كم مناسب للحفلات ',
//           maxLines: 2,
//           textDirection: TextDirection.rtl,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               overflow: TextOverflow.ellipsis),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Navigator.pushNamed(context, '/viewProduct',
//             //     arguments: allproduct[index]);
//            // bloc.deletItem(listItem(index).key);
//           //  print(listItem(index).hashCode);
//
//          //   bloc.deletItem(userProduct[index].product_id);
// // setState(() {
// // userProduct.removeAt(index);
// //
// // });
//           },
//           child: Text('حذف'),
//           style: ElevatedButton.styleFrom(minimumSize: Size(100, 30)),
//         ),
//         Text(userProduct[index].date!)
//
//       ],
//     );}
//   }