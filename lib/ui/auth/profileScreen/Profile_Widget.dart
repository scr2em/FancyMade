import "package:flutter/material.dart";
import "../../../sharedWidgets/CustomAppBar.dart";
import "../../../sharedWidgets/CustomBottomBar.dart";
import "../../../services/auth_service.dart";

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: ElevatedButton(
              child: Text('signout'),
              onPressed: () async {
                dynamic result = await _auth.signOut();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signedin');
                  print(result);
                }
              }),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
