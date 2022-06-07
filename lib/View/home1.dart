import 'package:dress_suit/View/add_product.dart';
import 'package:dress_suit/View/myProduct.dart';
import 'package:dress_suit/View/drawer.dart';


import 'package:flutter/material.dart';

import 'my_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _index = 3;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: move(_index),


        bottomNavigationBar: BottomNavigationBar(selectedLabelStyle: TextStyle(fontFamily: 'ar'),unselectedLabelStyle:  TextStyle(fontFamily: 'ar'),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'حسابي',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.save_outlined), label: 'منتجاتي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'اضافة منتج'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'الرئيسية'),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: (_index),
            onTap: (index) =>
                setState(() {
                  _index = index;
                  print(_index);
                })));
  }

  Widget move(int index) {
    switch (index) {
      case 0:



            return  Drawer_Profil();




      case 1:
        return const MyProduct()
        ;

      case 2:
        return const Add_Producgt();
      case 3:

        return const Home();
    }
    return Container(
      color: Colors.orange,
    );
  }

}
