import 'package:firebase_auth/firebase_auth.dart';
import '../models/CustomUser.dart';
import "database.dart";
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    String userId = userCredential.user.uid;
    bool isUserNew = userCredential.additionalUserInfo.isNewUser;
    print(userCredential.user.photoURL);
    try {
      if (isUserNew) {
        await DatabaseService(uid: userId).updateUserData(
            phoneNumber: userCredential.user.phoneNumber,
            name: userCredential.user.displayName,
            email: userCredential.user.email,
            avatar: userCredential.user.photoURL);
      }
      CustomUser newUser = await DatabaseService(uid: userId).getUserDate();

      return newUser;
    } catch (err) {
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      CustomUser newUser = await DatabaseService(uid: user.uid).getUserDate();
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
      await GoogleSignIn().signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
