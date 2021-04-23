// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../sharedWidgets/CustomBottomBar.dart';

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
                      AppLocalizations.of(context).checkoutSuccess,
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
                              AppLocalizations.of(context).thankYou,
                              // AppLocalizations.of(context).Thank,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .yourOrderHasBeenPlaced,
                              // AppLocalizations.of(context).placed_order,
                              style: TextStyle(fontSize: 16),
                            ),
                          ])
                    ],
                  ),
                  Text(
                    AppLocalizations.of(context).weSentAnEmail,
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: Text(AppLocalizations.of(context).timePlaced),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      AppLocalizations.of(context).shipping,
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
                      AppLocalizations.of(context).billing,
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
