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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
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
                  text: 'test1',
                  onpress: () {
                    NAlertDialog(
                      content: Cart(),
                      blur: 2,
                    ).show(context,
                        transitionType: DialogTransitionType.Bubble);
                  },
                ),
                CustomButton(
                  text: 'test2',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signup', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test3',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signin', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test4',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/loginProfileWrapper',
                        (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test5',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/product', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test6',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/CreateStoreForm', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test7',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/profileInfo', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test8',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/profileSettings', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test9',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/store', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test10',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/order', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test11',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/productlisting', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test12',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/productReview', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test13',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/store-info', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test14',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/checkout', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test15',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/checkout-success', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test17',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/store-dashboard', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test18',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/store-inventory', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test19',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test20',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/contactUs', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test21',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/faq', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test22',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/req-msgs', (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'test23',
                  height: 20,
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/notfound', (Route<dynamic> route) => false);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
