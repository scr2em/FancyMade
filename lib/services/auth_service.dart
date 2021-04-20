import 'package:firebase_auth/firebase_auth.dart';
import '../models/CustomUser.dart';
import "database.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CustomUser _customUserFromFirebaseUser(User user) {
  //   // return user == null ? null : CustomUser(uid: user.uid);
  //
  //   return user == null ?  null :  DatabaseService(uid: user.uid).getUserDate().then((x) {
  //       return CustomUser.fromJson(x.data());
  //     });
  //
  // }
  //
  // //auth change user stream
  // Stream<CustomUser> get user {
  //   return _auth.authStateChanges().map(_customUserFromFirebaseUser);
  // }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      CustomUser newUser = await  DatabaseService(uid: user.uid).getUserDate();
      return newUser;
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  Future createUserWithEmailAndPassword(
      String email, String password, String phoneNumber, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData(phoneNumber: phoneNumber, name: name, email: email);

      return CustomUser.fromJson({
        "uid": user.uid,
        "email": email,
        "phoneNumber": phoneNumber,
        "name": name
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
