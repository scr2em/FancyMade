import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference storesCollection =
  FirebaseFirestore.instance.collection("stores");

  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection("products");

  Future updateUserData({String phoneNumber, String name, String email, storeId = false}) async {
    return await usersCollection.doc(uid).set({
      "avatar":
          "https://www.worldfuturecouncil.org/wp-content/uploads/2020/06/blank-profile-picture-973460_1280-1.png",
      "phoneNumber": phoneNumber,
      "name": name,
      "email": email,
      "joinedAt": new DateTime.now(),
      "storeId" : storeId
    });
  }

  // Future CreateStore({})


  Stream<QuerySnapshot> get users {
    return usersCollection.snapshots();
  }
}

//
// this.avatar,
// this.phoneNumber,
// this.name,
// this.storeName,
// this.email,
// this.joinedAt,
