import 'package:cloud_firestore/cloud_firestore.dart';
import "package:finalproject/models/Product.dart";

class ProductsService {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection("products");

  Future getHomePageProducts() async {
    QuerySnapshot data = await productsCollection.limit(20).get();
    List<QueryDocumentSnapshot> docs = data.docs;
    return docs;
  }

  Future updateProduct(Product product, String productId) async {
    return await productsCollection.doc(productId).update(product.toJson());
  }

  Future addProduct(Product product) async {
    return await productsCollection.add(product.toJson());
  }

  Future<QuerySnapshot> getInventory({uid}) async {
    return await productsCollection.where("storeId", isEqualTo: uid).get();
  }

  Future<QuerySnapshot> getAllProductsByCategory({String category }) async {
    return await productsCollection
        .where("category", isEqualTo: category)
        .get();
  }
}
