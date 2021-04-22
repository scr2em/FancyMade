import 'package:finalproject/sharedWidgets/CustomBottomBar.dart';
import 'package:finalproject/sharedWidgets/CustomLightTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../sharedWidgets/CustomButton.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).productlisting,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            child: Container(
              margin: EdgeInsets.only(top: 60),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).getinTouch,
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).enterYourName,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).enterYourEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomLightTextFormField(
                      hintText: AppLocalizations.of(context).writeyourMsg,
                      maxLines: 3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomButton(
                      width: 150,
                      text: AppLocalizations.of(context).send,
                      primary: Theme.of(context).accentColor,
                      onpress: () {
                        Navigator.of(context).pushNamed('/');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
