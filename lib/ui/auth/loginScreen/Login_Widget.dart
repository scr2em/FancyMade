import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';
import '../../../sharedWidgets/CustomTextFormField.dart';

//services
import "../../../services/auth_service.dart";
import "../../../models/CustomUser.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final AuthService _auth = AuthService();

  onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
            child: Container(
                child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Log into your account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
            CustomTextFormField(hintText: "Email"),
            CustomTextFormField(hintText: "Password", obscureText: true),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 27),
                  child: Text(
                    "Forgot your password ?",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                child: Text('signin'),
                onPressed: () async {
                  dynamic result = await _auth.signInAnonymously();
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signedin');
                    print(result);
                  }
                })
          ],
        ))),
        bottomNavigationBar: CustomBottomBar());
  }
}

// Provider.of<MainProvider>(context, listen: false).changeAuth();
