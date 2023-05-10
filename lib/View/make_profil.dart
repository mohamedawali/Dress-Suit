import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeProfile extends StatelessWidget {
   MakeProfile({Key? key}) : super(key: key);

   final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();

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

                      TextField( style: const TextStyle(fontFamily: 'en',fontSize: 20),
                        controller: _name,
                        decoration: const InputDecoration(
                            label: Text("Name"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField( style: const TextStyle(fontFamily: 'en',fontSize: 20),
                        controller: _phone,
                        decoration: const InputDecoration(
                            label: Text("Phone"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField( style: const TextStyle(fontFamily: 'en',fontSize: 20),
                        controller: _address,
                        decoration: const InputDecoration(
                            label: Text("Adress"), border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          bloc.saveUserData(_name.value.text, _phone.value.text,
                              _address.value.text);
                         Navigator.pushReplacementNamed(context, '/MainHome');

                        },
                        child: const Text('حفظ', style: TextStyle(fontFamily: 'ar',color: Colors.white,fontSize: 20),),
                        style: ElevatedButton.styleFrom(minimumSize: const Size(300, 50)),
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