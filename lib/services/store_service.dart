import 'package:cloud_firestore/cloud_firestore.dart';
import "package:finalproject/models/CustomUser.dart";
import "package:finalproject/models/Store.dart";
import "package:finalproject/models/Product.dart";
import 'package:flutter/material.dart';

//TODO: move createStore from Database here

class StoreService {
  final CollectionReference storesCollection =
  FirebaseFirestore.instance.collection("stores");

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection("users");

  Future getStoreInfo(storeId) async {
   DocumentSnapshot store = await storesCollection.doc(storeId).get();
   String userId = store.data()["ownerId"];
   var userData = await usersCollection.doc(userId).get();
   return {"store": store, "owner":  CustomUser.fromJson({...userData.data(),"uid":userId})};
 }


}
