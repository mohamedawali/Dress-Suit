import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/productWidget.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? tabController;
  int _index=0;

  List<ProductData> allDressProduct = [];
  List<ProductData> allSuitProduct = [];
ProductCubit? productCubit;

@override
  void initState() {
    super.initState();
    productCubit= BlocProvider.of<ProductCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this,initialIndex: _index);
    return

    BlocBuilder<ProductCubit, ProductState>(
  builder: (context, state) {
    if(state is GetChangeIndex){

     _index= state.index;
    }
    return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false,toolbarHeight: 25,
            bottom: TabBar(labelStyle: const TextStyle(fontFamily: 'ar',fontSize: 18),labelColor: Colors.white,indicatorColor: Colors.white,

                onTap: (index) => productCubit!.changeIndex(index),
                controller: tabController,
                tabs: const [
                  Tab(
                    text: 'بدلة',
                    //icon: Icon(Icons.male),
                  ),
                  Tab(
                    text: 'فستان',
                    //icon: Icon(Icons.female),
                  )
                ]),
          ),
          body: viewBody()



    );
  },
);
  }



  Widget viewBody() {
    if (_index == 0){
      List<ProductData> viewSuitProduct = productCubit!.viewSuitProduct();

      return  productGridView(viewSuitProduct);
    }
  else if(_index == 1) {
      List<ProductData> viewDressProduct = productCubit!.viewDressProduct();
 return productGridView(viewDressProduct);

  }
  else {
  return Container(color: Colors.blue,);
  }

  }



  Future<bool> _onWillPoo() async {
    return false;
  }

}


