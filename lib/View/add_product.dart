import 'dart:io';

import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Add_Producgt extends StatefulWidget {
  const Add_Producgt({Key? key}) : super(key: key);

  @override
  State<Add_Producgt> createState() => _Add_ProducgtState();
}

class _Add_ProducgtState extends State<Add_Producgt>
    with TickerProviderStateMixin {
  TextEditingController productname = TextEditingController();
  TextEditingController productcolor = TextEditingController();
  TextEditingController productsize = TextEditingController();
  TextEditingController productprice = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  AnimationController? animationController;
  var showDialogs;

  List image_list = List<File>.filled(3, File(''));
  var _type;
  var bloc;
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
        child: Form(
          key: _globalKey,
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: () => selectImage(1),
                    child: displayimage1(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: OutlinedButton(
                      onPressed: () => selectImage(2),
                      child: displayimage2(),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: OutlinedButton(
                        onPressed: () => selectImage(3),
                        child: displayimage3(),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // CircularProgressIndicator(value: animationController!.value,),
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
                style: TextStyle(fontFamily: 'ar', color: Colors.black),
                elevation: 20,
                hint: Text(
                  'اختر النوع',
                  textAlign: TextAlign.end,
                ),
                items: [
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
                  setState(() {
                    _type = value;

                    print(_type);
                  });
                }),
            TextFormField(
                style: TextStyle(fontFamily: 'ar'),
                validator: (value) =>
                    value!.isEmpty ? 'ادخل مواصفات المنتج' : null,
                keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
                controller: productname,
                decoration: const InputDecoration(
                    hintText: 'وصف البدله/الفستان',
                    hintTextDirection: TextDirection.rtl),
                maxLines: 2),
            TextFormField(
              style: TextStyle(
                fontFamily: 'ar',
              ),
              validator: (value) => value!.isEmpty ? 'ادخل لون المنتج' : null,
              textDirection: TextDirection.rtl,
              controller: productcolor,
              decoration: const InputDecoration(
                  hintText: 'ادخل اللون', hintTextDirection: TextDirection.rtl),
            ),
            TextFormField(
              style: TextStyle(
                fontFamily: 'ar',
              ),
              validator: (value) => value!.isEmpty ? 'ادخل مقاس المنتج' : null,
              textDirection: TextDirection.rtl,
              controller: productsize,
              decoration: const InputDecoration(
                  hintText: 'ادخل المقاس',
                  hintTextDirection: TextDirection.rtl),
            ),
            TextFormField(
              style: TextStyle(fontFamily: 'ar'),
              validator: (value) =>
                  value!.isEmpty ? 'ادخل سعر الايجار لليلة الواحدة' : null,
              textDirection: TextDirection.rtl,
              controller: productprice,
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

                  if (image_list.length == 3) {
                    saveProducts(40);
                  } else if (image_list.length == 2) {
                    saveProducts(30);
                  } else if (image_list.length == 1) {
                    saveProducts(20);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
        ),
      ))),
    );
  }

  Widget displayimage1() {
    if (_image1 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              const Icon(
                Icons.add,
                color: Colors.grey,
              ),
              const Text('اضافة صورة',
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

  displayimage2() {
    if (_image2 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              const Icon(
                Icons.add,
                color: Colors.grey,
              ),
              const Text('اضافة صورة',
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

  displayimage3() {
    if (_image3 == null) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              const Icon(
                Icons.add,
                color: Colors.grey,
              ),
              const Text(
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

  selectImage(int number) async {
    var pickImage =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    switch (number) {
      case 1:
        setState(() {
          _image1 = File(pickImage!.path);
          image_list[0] = _image1!;
        });
        break;
      case 2:
        setState(() {
          _image2 = File(pickImage!.path);
          image_list[1] = _image2!;
        });
        break;
      case 3:
        setState(() {
          _image3 = File(pickImage!.path);
          //     image_list.add(_image3!);
          image_list[2] = _image3!;
        });
    }
  }

  double ch() {
    return 0;
  }

  snackBar(int time) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Row(
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Text(
                  'جاري التحميل',
                  style: TextStyle(fontSize: 20, fontFamily: 'ar'),
                ),
              ),
            ],
          ),
          duration: Duration(seconds: time)),
    );
  }

  saveProducts(int time) async {
    if (_globalKey.currentState!.validate()) {
      bloc.uploadProductImage(image_list);
      snackBar(time);
      await Future.delayed(Duration(seconds: time));
      bloc.saveProduct(productname.value.text, productcolor.value.text,
          productsize.value.text, productprice.value.text, _type);
      setState(() {
        _image1 = null;
        _image2 = null;
        _image3 = null;
        productname.clear();
        productcolor.clear();
        productprice.clear();
        productsize.clear();
        image_list.clear();
      });
    }
  }
}
