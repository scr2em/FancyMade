// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.ownerId,
    this.ar,
    this.en,
    this.productsAddress,
    this.category,
    this.plan,
    this.social,
  });

  String ownerId;
  Ar ar;
  Ar en;
  String productsAddress;
  String category;
  String plan;
  Social social;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    ownerId: json["ownerId"],
    ar: Ar.fromJson(json["ar"]),
    en: Ar.fromJson(json["en"]),
    productsAddress: json["products address"],
    category: json["category"],
    plan: json["plan"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "ownerId": ownerId,
    "ar": ar.toJson(),
    "en": en.toJson(),
    "products address": productsAddress,
    "category": category,
    "plan": plan,
    "social": social.toJson(),
  };
}

class Ar {
  Ar({
    this.storeName,
    this.address,
    this.desc,
  });

  String storeName;
  String address;
  String desc;

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
    storeName: json["storeName"],
    address: json["address"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "storeName": storeName,
    "address": address,
    "desc": desc,
  };
}

class Social {
  Social({
    this.facebook,
  });

  String facebook;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    facebook: json["facebook"],
  );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
  };
}






// {
// "ownerId": "ownerId",
// "ar": {
// "storeName" : "name",
// "address" : "address",
// "desc" : "desc"
// },
// "en": {
// "storeName" : "name",
// "address" : "address",
// "desc" : "desc"
// },
// "products address" : "address",
// "category" : "categoryId",
// "plan": "basic",
// "social" : {
// "facebook" : "http://....",
// },
// }


