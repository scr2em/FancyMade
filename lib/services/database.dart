import 'package:cloud_firestore/cloud_firestore.dart';
import "package:finalproject/models/CustomUser.dart";
import "package:finalproject/models/Store.dart";

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference storesCollection =
      FirebaseFirestore.instance.collection("stores");

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection("products");



  Future updateUserData(
      {String phoneNumber, String name, String email, storeId = false, avatar = "https://www.worldfuturecouncil.org/wp-content/uploads/2020/06/blank-profile-picture-973460_1280-1.png"}) async {
    return await usersCollection.doc(uid).set({
      "avatar":avatar,
      "phoneNumber": phoneNumber,
      "name": name,
      "email": email,
      "joinedAt": Timestamp.now(),
      "storeId": storeId
    });
  }

  Future getUserDate() async {
    var data = await usersCollection.doc(uid).get();
    return CustomUser.fromJson({...data.data(),"uid":uid});
  }

  Future createStore(Store store) async {
    var arData = await storesCollection.where("arName", isEqualTo: store.arName).get();
    var enData =  await storesCollection.where("enName", isEqualTo: store.enName).get();
    if(arData.size != 0 ){
      throw "the arabic name already exists.";
    }
    if(enData.size != 0 ){
      throw "the english name already exists.";
    }
    DocumentReference doc = await storesCollection.add(store.toJson());
    String docId = doc.id;
   return await updateAsingleProperty(property: "storeId",newValue: docId);
  }

  Future updateAsingleProperty({String property, String newValue}) async {
    await usersCollection.doc(uid).update({property:newValue});
    return await getUserDate();
  }

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
