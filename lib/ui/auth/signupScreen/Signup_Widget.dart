import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';
import "../../../sharedWidgets/CustomTextFormField.dart";
import "../../../services/auth_service.dart";

import "../../../utils/validators.dart";
import "../../../sharedWidgets/Loading.dart";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "";
  String password = "";
  String errorMessage = "";
  bool loading = false;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  onEmailChange(value) {
    setState(() {
      email = value.trim();
    });
  }

  onPasswordChange(value) {
    setState(() {
      password = value;
    });
  }

  onPressed() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading=true;
      });
      dynamic result =
          await _auth.createUserWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          errorMessage = "Something went wrong, please try again.";
        });
      } else {
        print('signed up successfully');
        print(result);
      }
      setState(() {
        loading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        appBar: CustomAppBar(),
        body: Container(
            child: Center(
              child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Create a new account",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                ),
                CustomTextFormField(
                  validator: emailValidator,
                  hintText: "Email",
                  onChanged: onEmailChange,
                ),
                CustomTextFormField(
                  validator: passwordValidator,
                  hintText: "Password",
                  obscureText: true,
                  onChanged: onPasswordChange,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35),
                  child: Text(errorMessage),
                ),
                ElevatedButton(child: Text('sign up'), onPressed: onPressed)
              ],
          ),
        ),
            )),
        bottomNavigationBar: CustomBottomBar());
  }
}
