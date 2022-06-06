import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';
import 'package:dress_suit/model/user_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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



  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this,initialIndex: _index);
    return

    Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false,toolbarHeight: 25,
            bottom: TabBar(labelStyle: const TextStyle(fontFamily: 'ar',fontSize: 18),labelColor: Colors.white,indicatorColor: Colors.white,

                onTap: (index) => view(index),
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
          body: viewbody()



    );
  }

  void view(int indx) {
    setState(() {
      _index = indx;
      print(_index);
    });
  }

  Widget viewbody() {
    if (_index == 0){
 BlocProvider.of<ProductCubit>(context).viewSuitProduct();
    return   BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is GetSuitProduct) {
            allSuitProduct = state.suitProductData;
          }

          return suitGridView(allSuitProduct);
        }
);}
  else if(_index == 1) {
  BlocProvider.of<ProductCubit>(context).viewDressProduct();
 return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if(state is GetDressProduct ) {
          allDressProduct=    state.dressProductData;
        }
  return dressGridView(allDressProduct);
  });}
  else {
  return Container(color: Colors.blue,);
  }

  }

  Widget dressGridView(List<ProductData> allDressProduct) {
    return
      //Container(child:

    Container(color:  Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
        child: GridView.builder(
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          itemCount: allDressProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3.3, crossAxisCount: 2,crossAxisSpacing: 1,mainAxisSpacing: 1),
          itemBuilder: (context, index) =>

          Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6,left: 6,top: 6),
                    child: Column(
                      children: [
                        Container(
                         height: 200,child: allDressProduct[index].image!.isNotEmpty ?
                        FadeInImage.assetNetwork(placeholder: 'assets/loading/loading.gif', image: allDressProduct[index].image![0]): Image.asset('assets/logo/d2.png')
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: NetworkImage(allDressProduct[index].image!.isEmpty
                          //             ? ''
                          //             : allDressProduct[index].image![0]))),
                        ),
                        SizedBox(height: 10),
                        Text(
                         allDressProduct[index].name!,
                          maxLines: 2,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontFamily: 'ar',height: 1,fontSize: 12,

                              overflow: TextOverflow.ellipsis),
                        ),




                    ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/viewProduct',
                                      arguments: allDressProduct[index]);
                                },
                                child: const Text('عرض',style: TextStyle(fontFamily: 'ar',color: Colors.white),),
                                style: ElevatedButton.styleFrom(minimumSize: const Size(100, 30)),
                              ),


                      ],
                    ),
                  ),

              ),


        ),
      ),
    );
  }
  Widget suitGridView(List<ProductData> allSuitProduct) {


  return  Container(color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.only(top: 5,right: 5,left: 5),
      child: GridView.builder(
          shrinkWrap: true,
          physics: PageScrollPhysics(),
          itemCount: allSuitProduct.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3.3,mainAxisSpacing: 1,crossAxisSpacing: 1),
          itemBuilder: (context, index) =>
               Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6,left: 6,top: 6),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      allSuitProduct[index].image!.isEmpty
                                          ? ''
                                          : allSuitProduct[index].image![0]))),
                        ),
                        SizedBox(height:10),
                        Text(
                          allSuitProduct[index].name!,
                          maxLines: 2,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(fontFamily: 'ar',fontSize: 12,
height: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
              ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/viewProduct',
                                  arguments: allSuitProduct[index]);
                            },
                            child: const Text('عرض',style: TextStyle(color: Colors.white,fontFamily: 'ar'),),
                            style: ElevatedButton.styleFrom(minimumSize: const Size(
                                100, 30)),
                          ),

                      ],
                    ),
                  ),
                ),
              ),
    ),



  );

  }

  Future<bool> _onWillPoo() async {
    return false;
  }

}


