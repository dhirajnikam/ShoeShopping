import 'package:animate_do/animate_do.dart';
import 'package:animatedshop/widgets/ContainerTheme.dart';
import 'package:animatedshop/widgets/textTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  var tag;

  var color;

  String img;

  var price;

  var title;

  ProductDetails({
    Key? key,
    required this.price,
    required this.title,
    required this.tag,
    required this.color,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body());
  }

// body
  _body() {
    return Stack(
      children: [background(), back(), bottomDetailsSheet()],
    );
  }

// It contains img and color
  background() {
    return Container(
      height: Get.height,
      width: Get.width,
      color: color,
      child: Hero(tag: tag, child: Image(image: AssetImage(img))),
    );
  }

// back button
  back() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SafeArea(
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: ButtonTheme1(
                  icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )))),
    );
  }

// buttom Sheet
  bottomDetailsSheet() {
    return FadeInUp(
      duration: Duration(milliseconds: 1400),
      child: DraggableScrollableSheet(
        initialChildSize: .1,
        minChildSize: .1,
        maxChildSize: .4,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60))),
              child: ListView(
                controller: scrollController,
                children: [
                  _indicator(),
                  const SizedBox(
                    height: 50,
                  ),
                  _titlePrice(),
                  const SizedBox(
                    height: 50,
                  ),
                  _color()
                ],
              ));
        },
      ),
    );
  }

// Color line in the sheet
  _indicator() {
    return Container(
      margin: const EdgeInsets.only(left: 150, right: 150),
      height: 5,
      color: color,
    );
  }

// title and price
  _titlePrice() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextTitle2(title: title),
          TextTitle1(title: "Price \$${price}"),
        ],
      ),
    );
  }

// available color
  _color() {
    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        children: [
          TextTitle2(title: "Color:-"),
          const SizedBox(
            width: 50,
          ),
          CircleAvatar(
            backgroundColor: color,
          )
        ],
      ),
    );
  }
}
