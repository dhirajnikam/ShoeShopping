import 'package:animatedshop/models/product.dart';
import 'package:animatedshop/services/data.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  int current = 0;
  List<Product> productList = []; // Product List
  List<Product> myCart = []; // MyCart List
  List<Product> fav = []; // MyFav List
  double T_price = 0; //  mycart price total
  double f_price = 0; //  favList price total

  @override
  void onInit() {
    productList = product;
    super.onInit();
  }

// index
  void state(int index) {
    current = index;
    update();
  }

// Add to Cart List
  void addToCart(Product product) {
    if (myCart.contains(product)) {
      Get.snackbar("Iteam Already Added", product.title);
    } else {
      myCart.add(product);
      T_price += product.price;

      update();
    }
  }

// Remove from cart List
  void removeFromCart(Product product) {
    myCart.remove(product);
    T_price -= product.price;
    update();
  }

// Add to fav List
  void addFav(Product product) {
    if (fav.contains(product)) {
      Get.snackbar("Iteam Already Added", product.title);
    } else {
      fav.add(product);
      f_price += product.price;
      update();
    }
  }

  // Remove from Fav List
  void removeFromFav(Product product) {
    fav.remove(product);
    f_price -= product.price;
    update();
  }

// FavList
  List<Product> get favList {
    return fav;
  }

// MyCartList
  List<Product> get cartList {
    return myCart;
  }

// ProductList
  List<Product> get productL {
    return productList;
  }

// MyCart Count
  String get cartCount {
    return myCart.length.toString();
  }

// FavList Count
  String get favCount {
    return fav.length.toString();
  }
}
