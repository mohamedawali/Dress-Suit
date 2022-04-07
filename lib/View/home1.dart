import 'package:dress_suit/View/addProduct.dart';
import 'package:dress_suit/View/useProfil.dart';
import 'package:dress_suit/cubit/sign_cubit/sign_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'my_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();

}

class _MainHomeState extends State<MainHome> {
  int _index = 0;

  // @override
  // void initState() {
  //   BlocProvider.of<SignCubit>(context);
  //
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
       child: BlocProvider(
        create: (context) => SignCubit(),
      child: move(_index),
    )),
      bottomNavigationBar:
           BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'اضافة منتج'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),


          ],
              type: BottomNavigationBarType.fixed,
              currentIndex: (_index),
              onTap: (index) =>
                  setState(() {
                    _index = index;
                    print(_index);
                  }))

      );
  }

  Widget move(int index) {
    switch (index) {
      case 0:
        return home();
      case 1:
        return AddProduct();
      case 2:
        return UserProfil();
    }
    return home();
  }
}


