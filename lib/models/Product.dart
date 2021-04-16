// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.ar,
    this.en,
    this.price,
    this.discount,
    this.discountDuration,
    this.category,
    this.images,
    this.sku,
    this.itemsAvailable,
    this.freeShipping,
    this.verifiedStore,
    this.rating,
    this.tags,
    this.maxQuantityPerOrder,
  });

  Ar ar;
  Ar en;
  int price;
  int discount;
  int discountDuration;
  String category;
  List<String> images;
  String sku;
  int itemsAvailable;
  bool freeShipping;
  bool verifiedStore;
  String rating;
  List<String> tags;
  int maxQuantityPerOrder;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    ar: Ar.fromJson(json["ar"]),
    en: Ar.fromJson(json["en"]),
    price: json["price"],
    discount: json["discount"],
    discountDuration: json["DiscountDuration"],
    category: json["category"],
    images: List<String>.from(json["images"].map((x) => x)),
    sku: json["sku"],
    itemsAvailable: json["itemsAvailable"],
    freeShipping: json["freeShipping"],
    verifiedStore: json["verifiedStore"],
    rating: json["rating"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    maxQuantityPerOrder: json["maxQuantityPerOrder"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar.toJson(),
    "en": en.toJson(),
    "price": price,
    "discount": discount,
    "DiscountDuration": discountDuration,
    "category": category,
    "images": List<dynamic>.from(images.map((x) => x)),
    "sku": sku,
    "itemsAvailable": itemsAvailable,
    "freeShipping": freeShipping,
    "verifiedStore": verifiedStore,
    "rating": rating,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "maxQuantityPerOrder": maxQuantityPerOrder,
  };
}

class Ar {
  Ar({
    this.title,
    this.desc,
  });

  String title;
  String desc;

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
    title: json["title"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "desc": desc,
  };
}



// {
// "ar" : {
// "title": "product name",
// "desc" : "Product Description"
// },
// "en": {
// "title": "product name",
// "desc" : "Product Description"
// },
// "price" : 100,
// "discount": 10,
// "DiscountDuration": 150,
// "category": "categoryId",
// "images": [
// "first image url",
// "second iamge url"
// ],
// "sku": "12314",
// "itemsAvailable" : 5,
// "freeShipping": true,
// "verifiedStore" : true,
// "rating": "4.5",
// "tags" : ["test","test2"],
// "maxQuantityPerOrder" : 20
//
// }