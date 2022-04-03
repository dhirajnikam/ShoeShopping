import 'package:animate_do/animate_do.dart';
import 'package:animatedshop/view/MyCart/cartList.dart';
import 'package:animatedshop/view/MyFav/favList.dart';
import 'package:animatedshop/view/ProductDetail/productDetailScreen.dart';
import 'package:animatedshop/widgets/textTheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/ProductController/productController.dart';
import '../../widgets/ContainerTheme.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final pro = Get.put(ProductController());
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _body());
  }

// Body Screen
  _body() {
    return Stack(children: [_MyCartbody(), _MyProductbody()]);
  }

// Cart Body
  _MyCartbody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              color: Colors.black,
              height: Get.height * 0.1,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 20),
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: Get.width * 0.8,
                        child: _MyCartList()),
                    InkWell(
                        onTap: () {
                          Get.to(CartScreen(), duration: _duration());
                        },
                        child: ButtonTheme1(
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }

// Product Body
  _MyProductbody() {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (_) {
          return AnimatedContainer(
            height: _.myCart.isEmpty ? Get.height : Get.height * 0.9,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
                color: pro.productL[_.current].color,
                borderRadius: BorderRadius.only(
                  bottomLeft: _.myCart.isEmpty
                      ? const Radius.circular(0)
                      : const Radius.circular(40),
                  bottomRight: _.myCart.isEmpty
                      ? const Radius.circular(0)
                      : const Radius.circular(40),
                )),
            child: Stack(children: [
              Positioned(width: Get.width, top: 250, child: _productList()),
              Positioned(top: 100, width: Get.width, child: _toCart()),
              Positioned(top: 50, width: Get.width, child: _Topdetail()),
            ]),
          );
        });
  }

// MyCart List
  _MyCartList() {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (_) {
          return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: int.parse(_.cartCount),
              itemBuilder: ((context, index) => MyCartContainer(
                    duration: _duration(),
                    color: _.cartList[index].color,
                    img: _.cartList[index].img,
                    removeTab: () {
                      _.removeFromCart(_.cartList[index]);
                    },
                    tag: _.cartList[index].color,
                    tab: () {
                      Get.to(ProductDetails(
                          tag: _.cartList[index].color,
                          color: _.cartList[index].color,
                          img: _.cartList[index].img, price: _.cartList[index].price, title: _.cartList[index].title,),duration: _duration(), transition: Transition.fade );
                    },
                  )));
        });
  }

// Product List
  _productList() {
    return FadeInUp(
      duration: _duration(),
      child: CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.70,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              pro.state(index);
            },
          ),
          carouselController: _carouselController,
          items: pro.productL
              .map((p) => Builder(
                  builder: ((context) => ProductContainer(
                        tag: p.title,
                        color: p.color,
                        img: p.img,
                        title: p.title,
                        myCartap: () {
                          pro.addToCart(p);
                        },
                        myFavtap: () {
                          pro.addFav(p);
                        }, tap: (){
                          Get.to(ProductDetails(
                          tag: p.title,
                          color: p.color,
                          img: p.img, price: p.price, title: p.title,),duration: _duration(), transition: Transition.fade );
                        },
                      ))))
              .toList()),
    );
  }

// title
  _Topdetail() {
    return Center(
        child: FadeInUp(
            duration: _duration(), child: TextTitle2(title: "Product Detail")));
  }

// Display cart count and fav count
  _toCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FadeInUp(
          duration: _duration(),
          child: InkWell(
            onTap: () {
              Get.to(FavScreen(),
                  transition: Transition.leftToRight, duration: _duration());
            },
            child: ContainerTheme2(
                contain: _favCount(), containIcon: Icon(Icons.favorite_border)),
          ),
        ),
        FadeInUp(
          duration: _duration(),
          child: InkWell(
            onTap: () {
              Get.to(CartScreen(), duration: _duration());
            },
            child: ContainerTheme1(
                contain: _cartCount(),
                containIcon: Icon(Icons.shopping_bag_outlined)),
          ),
        ),
      ],
    );
  }

// Duration
  _duration() {
    return Duration(milliseconds: 1400);
  }

// Cart Count
  _cartCount() {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (_) {
          return TextTitle1(
            title: _.cartCount,
          );
        });
  }

// Fav Count
  _favCount() {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (_) {
          return TextTitle1(
            title: _.favCount,
          );
        });
  }
}
