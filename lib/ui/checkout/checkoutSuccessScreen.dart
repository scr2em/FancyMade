// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../sharedWidgets/CustomBottomBar.dart';
import '../main/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //   home:
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              //Theme.of(context).accentColor,
              title: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Theme.of(context).accentColor,
                  ),
                  Center(
                    child: Text(
                      "hello",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      // AppLocalizations.of(context).checkoutSuccess,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14, bottom: 14),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 70,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thank you!',
                              // AppLocalizations.of(context).Thank,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Text(
                              'Your order #BE12345 has been placed.',
                              // AppLocalizations.of(context).placed_order,
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                    ],
                  ),
                  Text(
                    'We sent an email to orders@banuelson.com with your order confirmation and bill. ',
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: Text('Time placed: 17/02/2020 12:45 CEST'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Shipping",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[200]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banu Elson\n\norders@banuelson.com\n+49 179 111 1010\n\nLeibnizstraße 16, Wohnheim 6, No: 8X \nClausthal-Zellerfeld, Germany",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Text(
                      "Billing",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[200]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banu Elson\n\norders@banuelson.com\n+49 179 111 1010\n\nLeibnizstraße 16, Wohnheim 6, No: 8X \nClausthal-Zellerfeld, Germany",
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar());
    // );
  }
}
//Theme.of(context).accentColor
////AppLocalizations.of(context).helloWorld