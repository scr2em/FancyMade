// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product(
      {this.arName,
      this.arDesc,
      this.enName,
      this.enDesc,
      this.price,
      this.discount = 0,
      this.discountDuration = 0,
      this.category,
      this.image,
      this.sku,
      this.itemsAvailable,
      this.freeShipping,
      this.verifiedStore,
      this.rating,
      this.tags,
      this.maxQuantityPerOrder,
      this.storeId,
      this.shipment});

  String arName;
  String arDesc;
  String enName;
  String enDesc;
  int price;
  int discount;
  int discountDuration;
  String category;
  String image;

  String sku;
  int itemsAvailable;
  bool freeShipping;
  bool verifiedStore;
  String rating;
  List<String> tags;
  int maxQuantityPerOrder;
  String storeId;
  String shipment;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        arName: json["arName"],
        arDesc: json["arDesc"],
        enName: json["enName"],
        enDesc: json["enDesc"],
        price: json["price"],
        discount: json["discount"],
        discountDuration: json["discountDuration"],
        category: json["category"],
        image: json["image"],
        sku: json["sku"],
        itemsAvailable: json["itemsAvailable"],
        freeShipping: json["freeShipping"],
        verifiedStore: json["verifiedStore"],
        rating: json["rating"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxQuantityPerOrder: json["maxQuantityPerOrder"],
        storeId: json["storeId"],
        shipment: json["shipment"],
      );

  Map<String, dynamic> toJson() => {
        "arName": arName,
        "arDesc": arDesc,
        "enName": enName,
        "enDesc": enDesc,
        "price": price,
        "discount": discount,
        "discountDuration": discountDuration,
        "category": category,
        "image": image,
        "sku": sku,
        "itemsAvailable": itemsAvailable,
        "freeShipping": freeShipping,
        "verifiedStore": verifiedStore,
        "rating": rating,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "maxQuantityPerOrder": maxQuantityPerOrder,
        "storeId": storeId,
        "shipment": shipment
      };
}

// {
// "arName": "product name",
// "arDesc" : "Product Description",
// "enName": "product name",
// "enDesc" : "Product Description",
// "price" : 100,
// "discount": 10,
// "discountDuration": 150,
// "category": "categoryId",
// "images": [
// "first image url",
// "second image url"
// ],
// "sku": "12314",
// "itemsAvailable" : 5,
// "freeShipping": true,
// "verifiedStore" : true,
// "rating": "4.5",
// "tags" : ["test","test2"],
// "maxQuantityPerOrder" : 20,
// "storeId" : "storeId
// }
