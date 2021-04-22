// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);
// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.ownerId = "",
    this.arName,
    this.arAddress,
    this.arDesc,
    this.enName,
    this.enAddress,
    this.enDesc,
    this.productsAddress,
    this.category ="",
    this.plan = "",
    this.social,
  });

  String ownerId;
  String arName;
  String arAddress;
  String arDesc;
  String enName;
  String enAddress;
  String enDesc;
  String productsAddress;
  String category;
  String plan;
  Social social;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    ownerId: json["ownerId"],
    arName: json["arName"],
    arAddress: json["arAddress"],
    arDesc: json["arDesc"],
    enName: json["enName"],
    enAddress: json["enAddress"],
    enDesc: json["enDesc"],
    productsAddress: json["productsAddress"],
    category: json["category"],
    plan: json["plan"],
    social: Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "ownerId": ownerId,
    "arName": arName,
    "arAddress": arAddress,
    "arDesc": arDesc,
    "enName": enName,
    "enAddress": enAddress,
    "enDesc": enDesc,
    "productsAddress": productsAddress,
    "category": category,
    "plan": plan,
    "social": social.toJson(),
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
// "arName" : "name",
// "arAddress" : "address",
// "arDesc" : "desc"
// "enName" : "name",
// "enAddress" : "address",
// "enDesc" : "desc"
// "productsAddress" : "address",
// "category" : "categoryId",
// "plan": "basic",
// "social" : {
// "facebook" : "http://....",
// },
// }


