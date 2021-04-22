import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:provider/provider.dart";
import "package:finalproject/ui/main/main_locale_provider.dart";
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
  String name = "";
  String phoneNumber = "";
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

  onNameChange(value) {
    setState(() {
      name = value;
    });
  }

  onPhoneNumberChange(value) {
    setState(() {
      phoneNumber = value;
    });
  }

  onPressed() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        loading = true;
      });
      dynamic result = await _auth.createUserWithEmailAndPassword(
          email, password, phoneNumber, name);
      if (result == null) {
        setState(() {
          errorMessage = "Something went wrong, please try again.";
        });
      } else {
        Provider.of<MainLocaleProvider>(context, listen: false)
            .updateUser(result);
        Navigator.of(context).pushNamed("/");
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: loading
            ? Loading()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(children: [
                  Container(
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
                                AppLocalizations.of(context).createAnAccount,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ),
                          CustomTextFormField(
                            validator: notEmpty,
                            hintText: AppLocalizations.of(context).name,
                            onChanged: onNameChange,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            validator: emailValidator,
                            hintText: AppLocalizations.of(context).email,
                            onChanged: onEmailChange,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            validator: checkPhoneNumber,
                            hintText: AppLocalizations.of(context).phoneNumber,
                            onChanged: onPhoneNumberChange,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextFormField(
                            validator: passwordValidator,
                            hintText: AppLocalizations.of(context).password,
                            obscureText: true,
                            onChanged: onPasswordChange,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 35),
                            child: Text(errorMessage),
                          ),

                          //signup button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 50,
                              width: 150,
                              child: TextButton(
                                onPressed: onPressed,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff273147)),
                                  // side: MaterialStateProperty.all(
                                  //     BorderSide(color: Theme.of(context).accentColor)),
                                  foregroundColor: MaterialStateProperty.all(
                                    Colors.black,
                                  ),
                                  overlayColor: MaterialStateProperty.all(
                                    Theme.of(context).accentColor,
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                ),
                                child: Text(AppLocalizations.of(context).signup,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                                AppLocalizations.of(context)
                                    .orSignIn
                                    .toUpperCase(),
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            onTap: () {
                              Navigator.of(context).pushNamed("/signin");
                            },
                          )
                          // CustomButton(
                          //   width: 300,
                          //   height: 50,
                          //   text: 'Continue with google',
                          //   primary: Theme.of(context).primaryColor,
                          //   icons: Icons.mail,
                          //
                          // )
                        ],
                      ),
                    ),
                    // ]),
                  )),
                ]),
              ),
        bottomNavigationBar: CustomBottomBar());
  }
}
