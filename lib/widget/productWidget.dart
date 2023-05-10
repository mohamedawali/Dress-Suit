import 'package:flutter/material.dart';

import '../model/user_product.dart';

Widget productGridView(List<ProductData> allSuitProduct) {


  return  Container(color: Colors.grey[200],
    child: Padding(
      padding: const EdgeInsets.only(top: 5,right: 5,left: 5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const PageScrollPhysics(),
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
                    SizedBox(
                      height: 200,


                      child:  allSuitProduct[index].image!.isNotEmpty  ? FadeInImage.assetNetwork(placeholder: 'assets/loading/loading.gif', image: allSuitProduct[index].image![0]):Image.asset('assets/imageNotFound/no-image.png',
                      ),
                    ),
                    const SizedBox(height:10),
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