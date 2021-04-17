import 'package:finalproject/sharedWidgets/CustomLightTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

import '../../sharedWidgets/CustomButton.dart';
import 'dart:math' as math;

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Secure Payment",
          // AppLocalizations.of(context).review,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // AppLocalizations.of(context).review,
                  "Shipping ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Container(
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.local_shipping),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Text("Add Address"),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Theme.of(context).accentColor,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).highlightColor,
                        onPrimary: Theme.of(context).primaryColor,
                        onSurface: Colors.grey,
                        textStyle: TextStyle(
                          // color: Colors.blue,
                          fontSize: 16,
                        ),
                        shape: (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          // side: BorderSide(color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 10,
            color: Theme.of(context).highlightColor,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // AppLocalizations.of(context).review,
                  "Payment ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.wysiwyg),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                              // AppLocalizations.of(context).details,
                              "Add Credit / Debit Card",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: CustomLightTextFormField(
                              hintText:
                                  AppLocalizations.of(context).productName),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomLightTextFormField(
                          hintText:
                              AppLocalizations.of(context).productdescription,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          // AppLocalizations.of(context).details,
                          "Expire Date",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: CustomLightTextFormField(
                                  hintText:
                                      AppLocalizations.of(context).productName),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 10, bottom: 10),
                              child: CustomLightTextFormField(
                                  hintText:
                                      AppLocalizations.of(context).productName),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: (MediaQuery.of(context).size.width / 2.0) - 30,
                        child: CustomLightTextFormField(
                            hintText: AppLocalizations.of(context).productName),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 10,
              color: Theme.of(context).highlightColor,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Items :',
                      style: TextStyle(fontSize: 20, color: Color(0xff495057)),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                      child: Text(
                        "Arrives by April 3 to April 9th",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff495057),
                            fontWeight: FontWeight.w600),
                      ),
                      color: Color(0xffFFF9DB),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                child: Container(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            // color: Color(0xffD8D8D8),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffD8D8D8),
                            ),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'https://i.pinimg.com/564x/2d/02/4b/2d024bf61c604b7db70e9bc4a4cfa1fe.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'NikeCourt Lite 2',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    'Color: Blue',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    'Size: 37',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    'Qty: 1',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '\$67',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                      color: Color(0xff495057)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            // color: Color(0xffD8D8D8),
                            border: Border.all(
                              width: 1,
                              color: Color(0xffD8D8D8),
                            ),
                            borderRadius: BorderRadius.circular(6)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      'https://i.pinimg.com/564x/2d/02/4b/2d024bf61c604b7db70e9bc4a4cfa1fe.jpg',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      'NikeCourt Lite 2',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Text(
                                    'Color: Blue',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    'Size: 37',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    'Qty: 1',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '\$67',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                      color: Color(0xff495057)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.rotate(
                          angle: math.pi,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "\$147,45",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    CustomButton(
                        elevation: 0,
                        // height: 60,
                        width: 150,
                        primary: Theme.of(context).accentColor.withOpacity(.37),
                        text: "Pay Now",
                        // AppLocalizations.of(context).done,
                        onpress: () {
                          Navigator.of(context).pushNamed('/product');
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "This is the final step, after you touching Pay Now button, the payment will be transaction",
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
