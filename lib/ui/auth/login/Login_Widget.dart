import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
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

import "../../../utils/validators.dart";
import "../../../sharedWidgets/Loading.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  bool _obscureText = true;
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
        loading = true;
      });
      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
      if (result == null) {
        setState(() {
          errorMessage = AppLocalizations.of(context).somethingWentWrong;
        });
      } else {
        setState(() {
          errorMessage = "";
        });
        print(result);
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: CustomAppBar(),
            body: Container(
                padding: const EdgeInsets.all(10.0),
                child: ListView(children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              AppLocalizations.of(context).logIntoYourAccount,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                        ),
                        CustomTextFormField(
                          validator: emailValidator,
                          hintText: AppLocalizations.of(context).email,
                          onChanged: onEmailChange,
                        ),
                        CustomTextFormField(
                          validator: passwordValidator,
                          hintText: AppLocalizations.of(context).password,
                          obscureText: _obscureText,
                          onChanged: onPasswordChange,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 35),
                              child: Text(
                                errorMessage,
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 35),
                              child: Text(
                                AppLocalizations.of(context).forgotYourPassword,
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            child: Text(AppLocalizations.of(context).signin),
                            onPressed: onPressed),
                        CustomButton(
                          primary: Theme.of(context).accentColor,
                          onpress: () {},
                        )
                      ],
                    ),
                  ),
                ])),
            bottomNavigationBar: CustomBottomBar());
  }
}

// Provider.of<MainProvider>(context, listen: false).changeAuth();
