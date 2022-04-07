import 'package:dress_suit/View/editProfil.dart';
import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UserProfil extends StatefulWidget {
  const UserProfil({Key? key}) : super(key: key);

  @override
  State<UserProfil> createState() => _UserProfilState();
}

class _UserProfilState extends State<UserProfil> {
var bloc;
  @override
  void initState() {
  //  BlocProvider.of<SignCubit>(context).getEmail();
     BlocProvider.of<SignCubit>(context).viewUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   bloc = BlocProvider.of<SignCubit>(context);

   
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.blueAccent,
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 150, 20, 30),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child:
                    BlocBuilder<SignCubit, SignState>(
  builder: (context, state) {
    if(state is getDataUser)
    return
      Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.userData!.name!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Text('Email',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                            SizedBox(
                              width: 20,
                            ),
// BlocBuilder<SignCubit,SignState>(builder: (context, state) {
//   if (state is Loademail ){
//     return
    Text('state.email',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20))
    //;
  //} return Text('data');})

                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Phone',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
    state.userData!.phone!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text('Adress',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 20)),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
    state.userData!.adress!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Get.to(EditProfil());
                            Navigator.pushNamed(context, '/editProfil');
                          },
                          child: Text('Edit Profil',
                              style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.blueAccent,
                            minimumSize: Size(300, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                    color: Colors.blueAccent, width: 3)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bloc.logOut();
                            // logOut();
                            Navigator.pop(context, '/');
                          },
                          child: Text('LogOut', style: TextStyle(fontSize: 20)),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.blueAccent,
                              minimumSize: Size(300, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(
                                      color: Colors.blueAccent, width: 3))),
                        )
                      ],
                    )
    ;
                    return Text('nodata');
  },
),
                  ),
                ),
              ),
           ),

            // margin: EdgeInsets.only(top: 90),

            Positioned(
              top: 50,
              left: 130,
              right: 130,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 70,
                child: CircleAvatar(
                  // backgroundImage: NetworkImage(_imag!),
                  maxRadius: 65,
                ),
              ),
            ),
          ])),
    ));
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
