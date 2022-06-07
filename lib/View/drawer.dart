import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';
import 'package:dress_suit/cubit/user_cubit/user_cubit.dart';
import 'package:dress_suit/model/user_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Drawer_Profil extends StatefulWidget {
  const Drawer_Profil({Key? key}) : super(key: key);

  @override
  State<Drawer_Profil> createState() => _Drawer_ProfilState();
}

class _Drawer_ProfilState extends State<Drawer_Profil> {
   UserData? userData;

var bloc;
@override
  void initState() {
  BlocProvider.of<UserCubit>(context).viewUserData();
 bloc= BlocProvider.of<SignCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: Drawer(
      elevation: 2,
      child:
     Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/userProfil',arguments: userData);
              },
              child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.lightBlue,
                  child:
                  BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is GetDataUser) {
                      userData = state.userData!;
                    }
                    return
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/userImage/user.png'),
                              maxRadius: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(userData?.name ?? 'loading'
                              ,

                              style: TextStyle(fontSize: 22,
                                  fontFamily: 'en',
                                  color: Colors.white),
                            )
                          ]);
                  }   )
    )  ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'نبذة عن فستان وبدلة',
                  style: TextStyle(fontSize: 16,fontFamily: 'ar'),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.info_outlined,
                  size: 25,color: Colors.lightBlue,
                ),
              ],
            ),
          ),

          Divider(color: Colors.lightBlue,height: 20,indent: 10,endIndent: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                bloc.logOut();

                Navigator.popAndPushNamed(context, '/signin');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'تسجيل الخروج',
                    style: TextStyle(fontSize: 16,fontFamily: 'ar'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.logout,
                    size: 25,color: Colors.lightBlue,
                  ),
                ],
              ),
            ),
          )
        ],

             ))));

  }
}
