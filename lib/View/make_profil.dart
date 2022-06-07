import 'dart:io';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class MakeProfil extends StatefulWidget {
  const MakeProfil({Key? key}) : super(key: key);

  @override
  State<MakeProfil> createState() => _MakeProfilState();
}

class _MakeProfilState extends State<MakeProfil> {

  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _adress = TextEditingController();

  var bloc;




  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,),
      body:

        Container(color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(right: 20,left: 20),
            child: Center(
              child: Container(height: 337,color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only( top: 10,bottom: 10,right: 10,left: 10),
                  child: Column(
                    children: [

                      TextField( style: TextStyle(fontFamily: 'en',fontSize: 20),
                        controller: _name,
                        decoration: InputDecoration(
                            label: Text("Name"), border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField( style: TextStyle(fontFamily: 'en',fontSize: 20),
                        controller: _phone,
                        decoration: InputDecoration(
                            label: Text("Phone"), border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField( style: TextStyle(fontFamily: 'en',fontSize: 20),
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
                         Navigator.pushReplacementNamed(context, '/MainHome');

                        },
                        child: Text('حفظ', style: TextStyle(fontFamily: 'ar',color: Colors.white,fontSize: 20),),
                        style: ElevatedButton.styleFrom(minimumSize: Size(300, 50)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

    );
  }


}