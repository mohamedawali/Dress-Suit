import 'dart:io';
import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/snackBar.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>
    with TickerProviderStateMixin {
  TextEditingController productName = TextEditingController();
  TextEditingController productColor = TextEditingController();
  TextEditingController productSize = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  AnimationController? animationController;
  var showDialogs;

  List <File>imageList= [];
  var _type;
  ProductCubit? bloc;
  File? _image1;
  File? _image2;
  File? _image3;
  // List<File> image_list =[];

  @override
  void initState() {
    bloc = BlocProvider.of<ProductCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('إضافة منتج'),
          centerTitle: true,
          titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'ar')),
      body: Container(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child:        BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if(state is GetChangeItem){
              _type=  state.text;
            }  else if(state is SaveProductState){
              _image1 = null;
              _image2 = null;
              _image3 = null;
              productName.clear();
              productColor.clear();
              productPrice.clear();
              productSize.clear();
              imageList.clear();
            }else if(state is SelectImageState){

              _image1= state.image1;

              _image2= state.image2;

           _image3=state.image3;

            }
            return Form(
          key: globalKey,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () =>bloc!. selectImage(1),
                    child: displayImage1(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: OutlinedButton(
                      onPressed: () => bloc!.selectImage(2),
                      child: displayImage2(),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: OutlinedButton(
                        onPressed: () => bloc!.selectImage(3),
                        child: displayImage3(),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'مواصفات المنتج:',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ar',
              ),
            ),
     DropdownButtonFormField<String>(
                style: const TextStyle(fontFamily: 'ar', color: Colors.black),
                elevation: 20,
                hint: const Text(
                  'اختر النوع',
                  textAlign: TextAlign.end,
                ),
                items:
                const [
                  DropdownMenuItem(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('بدلة'),
                    value: 'suit',
                  ),
                  DropdownMenuItem(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('فستان'),
                    value: 'dress',
                  ),
                ],
                value: _type,
                validator: (type_value) =>
                    type_value == null ? 'اختار نوع المنتج' : null,
                onChanged: (value) {
                  bloc!.changeItem(value!);
                }
),
            TextFormField(
                style: const TextStyle(fontFamily: 'ar'),
                validator: (value) =>
                    value!.isEmpty ? 'ادخل مواصفات المنتج' : null,
                keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
                controller: productName,
                decoration: const InputDecoration(
                    hintText: 'وصف البدله/الفستان',
                    hintTextDirection: TextDirection.rtl),
                maxLines: 2),
            TextFormField(
              style: const TextStyle(
                fontFamily: 'ar',
              ),
              validator: (value) => value!.isEmpty ? 'ادخل لون المنتج' : null,
              textDirection: TextDirection.rtl,
              controller: productColor,
              decoration: const InputDecoration(
                  hintText: 'ادخل اللون', hintTextDirection: TextDirection.rtl),
            ),
            TextFormField(
              style: const TextStyle(
                fontFamily: 'ar',
              ),
              validator: (value) => value!.isEmpty ? 'ادخل مقاس المنتج' : null,
              textDirection: TextDirection.rtl,
              controller: productSize,
              decoration: const InputDecoration(
                  hintText: 'ادخل المقاس',
                  hintTextDirection: TextDirection.rtl),
            ),
            TextFormField(
              style: const TextStyle(fontFamily: 'ar'),
              validator: (value) =>
                  value!.isEmpty ? 'ادخل سعر الايجار لليلة الواحدة' : null,
              textDirection: TextDirection.rtl,
              controller: productPrice,
              decoration: const InputDecoration(
                  hintText: 'ادخل سعر الايجار لليلة الواحدة',
                  hintTextDirection: TextDirection.rtl),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  // bloc.uploadProductImage(image_list);

                  if (imageList.length == 3) {
                    saveProducts(40);
                  } else if (imageList.length == 2) {
                    saveProducts(30);
                  } else if (imageList.length == 1) {
                    saveProducts(20);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text(
                            'لايوجد صور !',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          duration: Duration(seconds: 1)),
                    );
                  }
                },
                child: const Text('حفظ',
                    style: TextStyle(
                        fontFamily: 'ar', color: Colors.white, fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 40),
                ))
          ]),
        );
  },
),
      ))),
    );
  }

  Widget displayImage1() {
    if (_image1 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: const [
              Icon(
                Icons.add,
                color: Colors.grey,
              ),
              Text('اضافة صورة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'ar'))
            ],
          ),
        ),
      );
    } else {
      return Image.file(
        _image1!,
        height: 180,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  displayImage2() {
    if (_image2 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: const [
              Icon(
                Icons.add,
                color: Colors.grey,
              ),
              Text('اضافة صورة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'ar'))
            ],
          ),
        ),
      );
    } else {
      return Image.file(
        _image2!,
        height: 180,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  displayImage3() {
    if (_image3 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: const [
              Icon(
                Icons.add,
                color: Colors.grey,
              ),
              Text(
                'اضافة صورة',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'ar'),
              )
            ],
          ),
        ),
      );
    } else {
      return Image.file(
        _image3!,
        height: 180,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }






  saveProducts(int time) async {
    if (globalKey.currentState!.validate()) {
      bloc!.uploadProductImage(imageList);
      snackBar(time,context);
      await Future.delayed(Duration(seconds: time));
      bloc!.saveProduct(productName.value.text, productColor.value.text,
          productSize.value.text, productPrice.value.text, _type);

    }
  }
}
