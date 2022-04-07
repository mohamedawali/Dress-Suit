import 'dart:io';

import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _adress = TextEditingController();
  File? _image;
  String? url;
  var basename;
  var bloc;
  SharedPreferences? sharedPreferences;
@override
  void initState() {

getid();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: Stack(children: [
                      CircleAvatar(
                        backgroundImage: _image == null ? null : FileImage(
                            _image!),
                        radius: 100,
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: Icon(Icons.camera_alt),
                          ))
                    ])),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    controller: _name,
                  decoration: InputDecoration(
                      label: Text("Name"), border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                   controller: _phone,
                  decoration: InputDecoration(
                      label: Text("Phone"), border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                   controller: _adress,
                  decoration: InputDecoration(
                      label: Text("Adress"), border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                 bloc.saveUserData(_name.value.text, _phone.value.text,
                      _adress.value.text);
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(300, 50)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var pickImage =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickImage!.path);
    });
    basename = path.basename(_image!.path);
    print(basename);
    print(_image);
    bloc.upload(basename, _image);
  }

  void getid() async{
  SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
  var id = sharedPreferences.getString('id');
  print(id);
  }

//   void upload() {
//   //  var basename = path.basename(_image!.path);
//     Reference reference =
//         FirebaseStorage.instance.ref().child('upload/$basename');
//     UploadTask uploadTask = reference.putFile(_image!);
//     uploadTask
//         .then((p0) => p0.ref.getDownloadURL().then((value) => url = value));
//   }
// }
}