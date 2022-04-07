import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _image;
  var _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: SingleChildScrollView(
            // physics: PageScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                if (_image != null)
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(_image!))),
                  )
                else
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                SizedBox(
                  height: 5,
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt,
                  ),
                  onPressed: () {
                    // openGallery();
                  },
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

                    DropdownButton<String>(hint: Text('اختر النوع'),
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
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                            print(_value);
                          });
                        }) ,


                TextField(
                    textDirection: TextDirection.rtl,
                    //controller: productname,
                    decoration: InputDecoration(
                        hintText: 'وصف البدله/الفستان',
                        hintTextDirection: TextDirection.rtl),
                    maxLines: 2),
                TextField(
                  textDirection: TextDirection.rtl,
                  //controller: productcolor,
                  decoration: InputDecoration(
                      hintText: 'ادخل اللون',
                      hintTextDirection: TextDirection.rtl),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  //controller: productsize,
                  decoration: InputDecoration(
                      hintText: 'ادخل المقاس',
                      hintTextDirection: TextDirection.rtl),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      //   save(productname.value.text,productcolor.value.text,productsize.value.text);
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
    ));
  }
}
