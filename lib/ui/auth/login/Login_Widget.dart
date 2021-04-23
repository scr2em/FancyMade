import 'package:animate_do/animate_do.dart';
import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:finalproject/ui/main/main_locale_provider.dart';

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
      email = value.trim().toLowerCase();
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
        Provider.of<MainLocaleProvider>(context, listen: false)
            .updateUser(result);
        Navigator.of(context).pushNamed("/");
      }
      setState(() {
        loading = false;
      });
    }
  }
  onPressedSignedInWithGoogle() async {
    setState(() {
      loading = true;
    });
    dynamic result = await _auth.signInWithGoogle();
    if (result == null) {
      setState(() {
        errorMessage = AppLocalizations.of(context).somethingWentWrong;
      });
    } else {
      setState(() {
        errorMessage = "";
      });
      Provider.of<MainLocaleProvider>(context, listen: false)
          .updateUser(result);
      Navigator.of(context).pushNamed("/");
    }
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: loading
            ? Loading()
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Text(
                                  AppLocalizations.of(context)
                                      .logIntoYourAccount,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                            ),
                            FadeInDownBig(
                              duration: Duration(milliseconds: 500),
                              child: CustomTextFormField(
                                validator: emailValidator,
                                hintText: AppLocalizations.of(context).email,
                                onChanged: onEmailChange,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            FadeInDownBig(
                              duration: Duration(milliseconds: 500),
                              child: CustomTextFormField(
                                validator: passwordValidator,
                                hintText: AppLocalizations.of(context).password,
                                obscureText: _obscureText,
                                onChanged: onPasswordChange,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: Text(
                                    errorMessage,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .forgotYourPassword,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),

                            //login button
                            FadeInDownBig(
                              duration: Duration(milliseconds: 500),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 50,
                                  width:
                                      .583 * MediaQuery.of(context).size.width,
                                  child: TextButton(
                                    onPressed: onPressed,
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Theme.of(context).accentColor),
                                      // side: MaterialStateProperty.all(
                                      //     (Theme.of(context).accentColor)),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                      overlayColor: MaterialStateProperty.all(
                                        Theme.of(context).accentColor,
                                      ),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                    ),
                                    child: Text(
                                        AppLocalizations.of(context).signin,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                            FadeInDownBig(
                              duration: Duration(milliseconds: 500),
                              child: GoogleSignInButton(
                                onPressed:onPressedSignedInWithGoogle,
                                text: AppLocalizations.of(context)
                                    .signInWithGoogle,
                                centered: true,
                                splashColor: Theme.of(context).backgroundColor,
                                // darkMode: true,
                                borderRadius: 10,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              child: Text(
                                  AppLocalizations.of(context)
                                      .orCreateANewAccount
                                      .toUpperCase(),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline)),
                              onTap: () {
                                Navigator.of(context).pushNamed("/signup");
                              },
                            )
                          ],
                        ),
                      ),
                    )),
              ),
        bottomNavigationBar: CustomBottomBar(selectedIndex: 3,));
  }
}

// Provider.of<MainProvider>(context, listen: false).changeAuth();
