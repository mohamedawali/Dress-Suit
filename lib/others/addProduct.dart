import 'dart:io';

import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController productname = TextEditingController();
  TextEditingController productcolor = TextEditingController();
  TextEditingController productsize = TextEditingController();
  TextEditingController productprice = TextEditingController();
  AnimationController? animationController;

  List<File>imges=[];
  var _type;
  var bloc;


@override
  void initState() {
  //userCubit.viewProduct();
  // userCubit.viewProduct();
  //userCubit.viewUserProduct();

  }
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UserCubit>(context);
    return Scaffold(appBar: AppBar(title: Text('إضافة منتج'),centerTitle:true ,titleTextStyle: TextStyle(fontSize: 24)),
        body:
      Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: SingleChildScrollView(
            // physics: PageScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                //  if (_image != null)
                Row(children: [
                  firstImageContainer(),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  viewList()
]),
                SizedBox(
                  height: 10,
                ),
ElevatedButton(onPressed: (){

  //showDialog(context: context, builder: (context)=>CircularProgressIndicator(color: Colors.orange,));
  //showDialog(context: context, builder: (context)=> Center(child: CircularProgressIndicator(color: Colors.orange,)));

  // circlIndecator();
 // bloc. uploadProductImage(imges);
  }, child:Text('حفظ الصور')),
              //  circlIndecator(),
                SizedBox(
                  height: 50,
                ),

                Text(
                  'مواصفات المنتج:',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [

                DropdownButton<String>(
                    hint: Text('اختر النوع'),
                    items: [
                      DropdownMenuItem(
                        child: Text('بدلة'),
                        value: 'suit',
                      ),
                      DropdownMenuItem(
                        child: Text('فستان'),
                        value: 'dress',
                      ),
                    ],
                    value: _type,
                    onChanged: (value) {
                      setState(() {
                        _type = value;
                        print(_type);
                      });
                    }),

                TextField(keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    controller: productname,
                    decoration: InputDecoration(
                        hintText: 'وصف البدله/الفستان',
                        hintTextDirection: TextDirection.rtl),
                    maxLines: 2),
                TextField(
                  textDirection: TextDirection.rtl,
                  controller: productcolor,
                  decoration: InputDecoration(
                      hintText: 'ادخل اللون',
                      hintTextDirection: TextDirection.rtl),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  controller: productsize,
                  decoration: InputDecoration(
                      hintText: 'ادخل المقاس',
                      hintTextDirection: TextDirection.rtl),
                ),

                SizedBox(
                  height: 10,
                ), TextField(
                  textDirection: TextDirection.rtl,
                  controller: productprice,
                  decoration: InputDecoration(
                      hintText: 'ادخل سعر الايجار لليلة الواحدة',
                      hintTextDirection: TextDirection.rtl),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {

                      bloc.saveProduct(
                          productname.value.text,
                          productcolor.value.text,
                          productsize.value.text,
                          productprice.value.text,
                          _type);
                    },
                    child: Text('حفظ'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400, 40),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget firstImageContainer() {

      return Container(
          color: Colors.grey,
          width: 85,
          height: 150,
          child: IconButton(
              icon: Icon(Icons.add_a_photo_outlined),
              onPressed: () => pickImage()));

  }
  // Widget secondImageContainer() {
  //   if (imges == null) {
  //     return Container(
  //         color: Colors.grey,
  //         width: 100,
  //         height: 150,
  //         child: IconButton(
  //             icon: Icon(Icons.add_a_photo_outlined),
  //             onPressed: () => pickImage()));
  //   } else {
  //     return Container(
  //         width: 100,
  //         height: 150,
  //         decoration:
  //         BoxDecoration(image: DecorationImage(image: FileImage(imges![2]))));
  //   }
  // }
  // Widget thirdImageContainer() {
  //   if (imges == null) {
  //     return Container(
  //         color: Colors.grey,
  //         width: 100,
  //         height: 150,
  //         child: IconButton(
  //             icon: Icon(Icons.add_a_photo_outlined),
  //             onPressed: () => pickImage()));
  //   } else {
  //     return Container(
  //         width: 100,
  //         height: 150,
  //         decoration:
  //         BoxDecoration(image: DecorationImage(image: FileImage(imges![3]))));
  //   }
  // }
  pickImage() async {

 var pickImage = await ImagePicker.platform.pickImage(source: ImageSource.gallery) ;
setState(() {
  imges.add(File(pickImage!.path));
});
     // imges.add(File(pickImage!.path));
    print('count${imges.toString()}');
 if(imges.length==3) {
   print('44444444444');
  bloc. uploadProductImage(imges);
//
 }


  }

 Widget viewList() {
  return Container(height:150,width: MediaQuery.of(context).size.width-125,color: Colors.grey,
      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount: imges.length,itemBuilder: (context,index)=>
         Padding(
           padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
           child: Container(height: 150,width: 85,decoration: BoxDecoration(color:Colors.white,image:DecorationImage(image: FileImage(imges[index])) ),),
         ),
      ),
    );
 }



}
