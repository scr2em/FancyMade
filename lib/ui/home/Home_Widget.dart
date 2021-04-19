import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:finalproject/ui/cart/Cart.dart';
import 'package:finalproject/ui/inbox/inboxscreen.dart';
import "package:flutter/material.dart";
import "../../sharedWidgets/CustomAppBar.dart";
import "../../sharedWidgets/CustomBottomBar.dart";
import 'package:flutter/cupertino.dart';
import 'package:ndialog/ndialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

var obj = new CartState();

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // // Navigate back to first screen when tapped.
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/order', (Route<dynamic> route) => false);
                },
                child: Text('home'),
              ),
              CustomButton(
                text: 'test',
                onpress: () {
                  NAlertDialog(
                    content: Cart(),
                    blur: 2,
                  ).show(context, transitionType: DialogTransitionType.Bubble);
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
