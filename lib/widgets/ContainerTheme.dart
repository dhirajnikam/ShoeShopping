import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:animatedshop/widgets/textTheme.dart';

// Product Container
class ProductContainer extends StatelessWidget {
  Color color;
  String img;

  String title;

  var myCartap;

  var myFavtap;

  var tag;

  var tap;
  ProductContainer({
    Key? key,
      required this.tap,
    required this.tag,
    required this.myFavtap,
    required this.myCartap,
    required this.color,
    required this.img,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: _decoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: tap,
              child: SizedBox(
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [_color(), _img()],
                  )),
            ),
            const SizedBox(height: 20),
            TextTitle1(title: title),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_addFav(), _addCart()],
            )
          ],
        ),
      ),
    );
  }

// Decoration
  _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
    );
  }

// Color of Container
  _color() {
    return Container(
      width: 150,
      height: 150,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }

// Image
  _img() {
    return Hero(
        tag: tag,
        child: Container(
          width: 200,
          height: 200,
          child: Image.asset(
            img,
          ),
        ));
  }

// Add to cart button
  _addCart() {
    return InkWell(onTap: myCartap, child: Icon(Icons.shopping_bag));
  }

// Add to Fav button
  _addFav() {
    return InkWell(onTap: myFavtap, child: Icon(Icons.favorite));
  }
}

// top Container Cart Count
class ContainerTheme1 extends StatelessWidget {
  var contain;

  var containIcon;

  ContainerTheme1({required this.contain, required this.containIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: contain,
          ),
          Container(
            child: containIcon,
          )
        ],
      ),
    );
  }
}

// top Container Fav Count
class ContainerTheme2 extends StatelessWidget {
  var contain;

  var containIcon;

  ContainerTheme2({required this.contain, required this.containIcon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: containIcon,
          ),
          Container(
            child: contain,
          ),
        ],
      ),
    );
  }
}

// MyCart Iteam Container
class MyCartContainer extends StatelessWidget {
  var duration;

  var color;

  String img;

  var removeTab;

  var tag;

  var tab;

  MyCartContainer({
    Key? key,
       required this.tab,
     required this.tag,
    required this.duration,
    required this.color,
    required this.img,
    required this.removeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: duration,
      child: Stack(
        children: [
          Container(margin: const EdgeInsets.only(right: 10), child: _cart()),
          Positioned(left: 32, bottom: 32, child: _remove()),
        ],
      ),
    );
  }

// iteam
  _cart() {
    return GestureDetector(
      onTap: tab,
      child: CircleAvatar(
          maxRadius: 25,
          backgroundColor: color,
          child: Hero(
            
            tag: tag, child: Image(image: AssetImage(img)))),
    );
  }

// remove iteam form cart
  _remove() {
    return CircleAvatar(
      maxRadius: 10,
      child: GestureDetector(
          onTap: removeTab,
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 15,
          )),
    );
  }
}

// Glass like container
class ButtonTheme1 extends StatelessWidget {
  var icon;

  ButtonTheme1({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white),
        color: Colors.white.withOpacity(0.3),
      ),
      child: icon,
    );
  }
}

// List View of Items
class ListTheme extends StatelessWidget {
  var removeTab;

  var price;

  var title;

  String img;

  var color;

  var tag;

  var tap;

  ListTheme({
    Key? key,
     required this.tap,
    required this.removeTab,
    required this.price,
    required this.title,
    required this.img,
    required this.tag,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: tap,
              child: Stack(
                alignment: Alignment.center,
                children: [_color(), _img()],
              ),
            ),
            TextTitle2(title: title),
            TextTitle1(
              title: "Price \$${price}",
            ),
            _delete()
          ],
        ),
      ),
    );
  }

//Img background Color
  _color() {
    return Container(
      height: 70,
      width: 70,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }

// Img
  _img() {
    return Container(
      height: 80,
      width: 80,
      child: Hero(
          tag: tag,
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset(
              img,
            ),
          )),
    );
  }

// Delete button
  _delete() {
    return GestureDetector(
      onTap: removeTab,
      child: Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }
}
