import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter/material.dart';
import '../model/user_product.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ViewProduct extends StatelessWidget {

  final ProductData allProduct;
 const ViewProduct( {Key? key, required this. allProduct, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        images: [
                          for (int x = 0; x < allProduct.image!.length; x++)
                            NetworkImage(allProduct.image![x]),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),

                  RichText(
                    textDirection: TextDirection.rtl,
                    maxLines: 2,
                    text: TextSpan(
                        style: const TextStyle(
                          fontFamily: 'ar',
                          color: Colors.lightBlue,
                        ),
                        children: [
                          TextSpan(
                            text: allProduct.name,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),

                  const Divider(
                    height: 20,
                    thickness: 3,
                  ),
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(style: const TextStyle(
                      fontFamily: 'ar',

                    ),children: [
                      const TextSpan(
                        text: 'اللون :  ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                          text: allProduct.color,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.lightBlue))
                    ]),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    indent: 340,
                    color: Colors.lightBlue,
                  ),
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(

                    children: [
                      const TextSpan(
                        text: 'المقاس :  ',
                        style: TextStyle(fontFamily: 'ar',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: allProduct.size,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.lightBlue,fontFamily: 'en'))
                    ]),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    color: Colors.lightBlue,
                    indent: 325,
                  ),
                  RichText(
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'سعرالايجار في الليلة الواحدة :  ',
                        style: TextStyle(fontFamily: 'ar',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: allProduct.price,
                          style:
                              const TextStyle(fontSize: 17, color: Colors.lightBlue,fontFamily: 'en'))
                    ]),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    color: Colors.lightBlue,
                    indent: 190,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => call(allProduct.phone),
                            icon: const Icon(
                              Icons.phone_in_talk_outlined,
                              color: Colors.lightBlue,
                            )),
                        RichText(textDirection: TextDirection.rtl,
                          text: TextSpan(children: [
                            const TextSpan(
                              text: 'للتواصل :  ',
                              style: TextStyle(fontFamily: 'ar',
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: allProduct.phone,
                                style: const TextStyle(fontFamily: 'en',
                                    fontSize: 17, color: Colors.lightBlue)),
                          ]),
                        ),
                      ]),
                  const Divider(
                    height: 20,
                    thickness: 3,
                    color: Colors.lightBlue,
                    indent: 320,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  call(String? phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone!);
  }
}
