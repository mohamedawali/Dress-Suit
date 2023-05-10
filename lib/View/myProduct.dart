import 'package:dress_suit/cubit/product_cubit/product_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({Key? key}) : super(key: key);

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<ProductData> allUserProduct = [];
  List<String> imageUrl = [];

  var bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ProductCubit>(context);bloc.viewUserProduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('منتجاتي'),
          centerTitle: true,
          titleTextStyle: const TextStyle(fontSize: 20, fontFamily: 'ar'),
        ),
        body: Container(
            color: Colors.grey[200],
            child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
                child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                  if (state is GetUserProduct) {
                    allUserProduct = state.userProduct;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const PageScrollPhysics(),
                    itemCount: allUserProduct.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3.3,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1),
                    itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 8,
                        child: listItem(index)),
                  );
                }))));
  }

  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, right: 6, left: 6),
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(allUserProduct[index].image!.isEmpty
                        ? ''
                        : allUserProduct[index].image![0]))),
          ),
          const SizedBox(height: 10),
          Text(
            allUserProduct[index].name!,
            maxLines: 2,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'ar',
                height: 1,
                overflow: TextOverflow.ellipsis),
          ),
          ElevatedButton(
            onPressed: () {
              for (int i = 0; i < allUserProduct[index].image!.length; i++) {
                imageUrl.add(allUserProduct[index].image![i].toString());
              }

              bloc.deleteImage(imageUrl);
              bloc.deleteItem(index,allUserProduct[index].product_id);

            },
            child: const Text(
              'حذف',
              style: TextStyle(color: Colors.white, fontFamily: 'ar'),
            ),
            style: ElevatedButton.styleFrom(minimumSize: const Size(100, 30)),
          ),
          Text(allUserProduct[index].date!)
        ],
      ),
    );
  }
}
