// To parse this JSON data, do
//
//     final cartList = cartListFromJson(jsonString);

import 'dart:convert';

List<CartList> cartListFromJson(String str) => List<CartList>.from(json.decode(str).map((x) => CartList.fromJson(x)));

String cartListToJson(List<CartList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartList {
  CartList({
    this.productId,
    this.qty,
  });

  String productId;
  int qty;

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    productId: json["productId"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "qty": qty,
  };
}



// [
// {
// "productId": "id",
// "qty" : "qty"
// },
// {
// "productId": "id",
// "qty" : "qty"
// },
// {
// "productId": "id",
// "qty" : "qty"
// }
// ]