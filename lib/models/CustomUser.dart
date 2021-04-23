// To parse this JSON data, do
//
//     final customUser = customUserFromJson(jsonString);

import 'dart:convert';

CustomUser customUserFromJson(String str) =>
    CustomUser.fromJson(json.decode(str));

String customUserToJson(CustomUser data) => json.encode(data.toJson());

class CustomUser {
  CustomUser({
    this.uid,
    this.phoneNumber,
    this.name,
    this.email,
    this.joinedAt,
    this.shippingAddress = "",
    this.storeId = false,
    this.avatar =
        "https://www.worldfuturecouncil.org/wp-content/uploads/2020/06/blank-profile-picture-973460_1280-1.png",
  });

  String uid;
  String avatar;
  String phoneNumber;
  String name;
  dynamic storeId;
  String email;
  String joinedAt;
  String shippingAddress;

  factory CustomUser.fromJson(Map<String, dynamic> json) => CustomUser(
      uid: json["uid"],
      avatar: json["avatar"],
      phoneNumber: json["phoneNumber"],
      name: json["name"],
      storeId: json["storeId"],
      email: json["email"],
      // joinedAt: json["joinedAt"],
      shippingAddress: json["shippingAddress"]);

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "name": name,
        "storeId": storeId,
        "email": email,
        "joinedAt": joinedAt,
        "shippingAddress": shippingAddress
      };
}

// {
// "uid" : "uid",
// "avatar":"image url",
// "phoneNumber" : "12345",
// "name" : "name",
// "StoreName" : "null or storeId",
// "email" : "mohamed@gmail.com",
// "joinedAt" : "date",
//"shippingAddress" : "shippingAddress"
// }
