import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';
import "../../../sharedWidgets/CustomTextFormField.dart";
import "../../../services/auth_service.dart";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "";
  String password = "";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  onEmailChange(value) {
    setState(() {
      email = value;
    });
  }

  onPasswordChange(value) {
    setState(() {
      password = value;
    });
  }

  onPressed() async {
    dynamic result =
        await _auth.createUserWithEmailAndPassword(email, password);
    if (result == null) {
      print('error signing up');
    } else {
      print('signed up successfully');
      print(result);
    }
  }

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
              child: Text("Create a new account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            ),
            CustomTextFormField(
              hintText: "Email",
              onChanged: onEmailChange,
            ),
            CustomTextFormField(
              hintText: "Password",
              obscureText: true,
              onChanged: onPasswordChange,
            ),
            ElevatedButton(child: Text('sign up'), onPressed: onPressed)
          ],
        ))),
        bottomNavigationBar: CustomBottomBar());
  }
}
