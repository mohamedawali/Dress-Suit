import 'package:dress_suit/View/add_product.dart';
import 'package:dress_suit/View/myProduct.dart';
import 'package:dress_suit/View/drawer.dart';
import 'package:dress_suit/cubit/mainHome_cubit/main_home_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_home.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _index = 3;
  MainHomeCubit? mainHomeCubit;
@override
  void initState() {
    super.initState();
   mainHomeCubit= BlocProvider.of<MainHomeCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainHomeCubit, MainHomeState>(
      builder: (context, state) {
        if(state is ChangePageState){
         _index= state.index;
        }
        return Scaffold(
            body: move(_index),


            bottomNavigationBar: BottomNavigationBar(
                selectedLabelStyle: const TextStyle(fontFamily: 'ar'),
                unselectedLabelStyle: const TextStyle(fontFamily: 'ar'),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu), label: 'حسابي',),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.save_outlined), label: 'منتجاتي'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: 'اضافة منتج'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'الرئيسية'),
                ],
                type: BottomNavigationBarType.fixed,
                currentIndex: (_index),
                onTap: (index) =>mainHomeCubit!.changePage(index)

            ));
      },
    );
  }

  Widget move(int index) {
    switch (index) {
      case 0:
        return const DrawerProfile();


      case 1:
        return const MyProduct()
        ;

      case 2:
        return const AddProduct();
      case 3:
        return const Home();
    }
    return Container(
      color: Colors.orange,
    );
  }

}
