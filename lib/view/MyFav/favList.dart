
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ProductController/productController.dart';
import '../../widgets/ContainerTheme.dart';
import '../../widgets/textTheme.dart';
import '../ProductDetail/ProductDetailScreen.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);
  final pro = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _body());
  }
// Body
  _body() {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (_) {
        return FadeInLeft(
          duration: _duration(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _top(),
                  _MyFavList(),
                  const SizedBox(
                    height: 20,
                  ),
                  _totalPrice()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
// Top part of screen (App Bar) Body
  _top() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       
        Expanded(
            child: Center(
          child: _MyFavCount(),
        )), _back()
      ],
    );
  }
// Back Button
  _back() {
    return GestureDetector(
        onTap: () {
          Get.back();
        },
        child: ButtonTheme1(
          icon: const Icon(
             Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ));
  }
// Title with iteam count
  _MyFavCount() {
    return TextTitle2(
      title: "My Fav ${pro.favCount}",
      color: Colors.white,
    );
  }
// iteam List
  _MyFavList() {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (_) {
        return Expanded(
          child: ListView.builder(
              itemCount: int.parse(_.favCount),
              itemBuilder: ((context, index) {
                return ListTheme(
                    removeTab: () {
                      _.removeFromFav(_.favList[index]);
                    },
                    price: _.favList[index].price,
                    title: _.favList[index].title,
                    img: _.favList[index].img,
                    color: _.favList[index].color, tag: _.favList[index].title, tap: (){
                                           Get.to(ProductDetails(
                          tag:  _.favList[index].title,
                          color: _.favList[index].color,
                          img: _.favList[index].img, price: _.favList[index].price, title: _.favList[index].title,),duration: _duration(), transition: Transition.fade );
                    },);
              })),
        );
      },
    );
  }
// Total Price
  _totalPrice() {
    return TextTitle1(
      title: "Total Prices \$${pro.f_price}",
      color: Colors.white,
    );
  }
  // Duration
  _duration() {
    return Duration(milliseconds: 1400);
  }
}
