import 'package:cloud_firestore/cloud_firestore.dart';
import "package:finalproject/models/CustomUser.dart";
import "package:finalproject/models/Store.dart";
import "package:finalproject/models/Product.dart";

class StoreService {
  final CollectionReference storesCollection =
  FirebaseFirestore.instance.collection("stores");

 Future getStoreInfo() async {

 }
}
