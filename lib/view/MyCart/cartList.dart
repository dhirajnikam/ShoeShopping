import 'package:animate_do/animate_do.dart';
import 'package:animatedshop/widgets/ContainerTheme.dart';
import 'package:animatedshop/widgets/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ProductController/productController.dart';
import '../ProductDetail/ProductDetailScreen.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
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
        return FadeInRight(
          duration: _duration(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _top(),
                  _MyCartList(),
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
        _back(),
        Expanded(
            child: Center(
          child: _MyCartCount(),
        ))
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
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ));
  }
// Title with iteam count
  _MyCartCount() {
    return TextTitle2(
      title: "My Cart ${pro.cartCount}",
      color: Colors.white,
    );
  }
// iteam List
  _MyCartList() {
    return GetBuilder<ProductController>(
      init: ProductController(),
      initState: (_) {},
      builder: (_) {
        return Expanded(
          child: ListView.builder(
              itemCount: int.parse(_.cartCount),
              itemBuilder: ((context, index) {
                return ListTheme(
                    removeTab: () {
                      _.removeFromCart(_.cartList[index]);
                    },
                    price: _.cartList[index].price,
                    title: _.cartList[index].title,
                    img: _.cartList[index].img,
                    color: _.cartList[index].color, tag: _.cartList[index].color, tap: (){
                       Get.to(ProductDetails(
                          tag:   _.cartList[index].color,
                          color: _.cartList[index].color,
                          img:  _.cartList[index].img, price: _.cartList[index].price, title: _.cartList[index].title,),duration: _duration(), transition: Transition.fade );
                    },);
              })),
        );
      },
    );
  }
// Total Price
  _totalPrice() {
    return TextTitle1(
      title: "Total Prices \$${pro.T_price}",
      color: Colors.white,
    );
  }
  // Duration
  _duration() {
    return Duration(milliseconds: 1400);
  }
}
