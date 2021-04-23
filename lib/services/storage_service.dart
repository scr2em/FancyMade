import "dart:io";
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future uploadImage(File img, storeId) async {
    List imagePath = img.toString().split("/");
    String imageName =
        Random().nextInt(100).toString() + imagePath[imagePath.length - 1];
    UploadTask task =
        storage.ref("products/$storeId").child(imageName).putFile(img);
    TaskSnapshot snapshot = await task;
    return snapshot.ref.getDownloadURL();
  }
}
