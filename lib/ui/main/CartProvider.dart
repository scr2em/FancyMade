import "package:finalproject/models/CartProduct.dart";
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Cartproduct> cartproducts = [
    // Cartproduct(
    // id: "11",
    // price: 120,
    // productname: 'notebook',
    // multiplier: 3,
    // imageURL:
    //     'https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536'),
  ];

  CartProvider();

  addProductToCart(Cartproduct product) {
    // addProductToCart() {
    cartproducts.add(product);
    notifyListeners();
  }

  deleteProductFromCart({id}) {
    cartproducts = cartproducts.where((x) => x.id != id).toList();
    notifyListeners();
  }

  increaseQty(int value, int index) {
    int multiplier = cartproducts[index].multiplier;
    if (multiplier >= 1) {
      cartproducts[index].multiplier = cartproducts[index].multiplier + value;
      notifyListeners();
    }
  }

  decreaseQty(int value, int index) {
    int multiplier = cartproducts[index].multiplier;
    if (multiplier > 1) {
      cartproducts[index].multiplier = cartproducts[index].multiplier - value;
      notifyListeners();
    }
  }

  onload(int index) {
    var agg = cartproducts[index].multiplier * cartproducts[index].price;
    return agg;
  }
}
