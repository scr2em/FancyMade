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
  var groupValue;

  bool enablefield = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          // "Secure Payment",
          AppLocalizations.of(context).securePayment,
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
                  AppLocalizations.of(context).address,
                  // "Shipping ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Banu Elson",
                                // AppLocalizations.of(context).addAddress),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'orders@banuelson.com',
                                ),
                              ),
                              Text('+49 179 111 1010'),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                    'Leibnizstraße 16, Wohnheim 6, No: 8X Clausthal-Zellerfeld, Germany'),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Theme.of(context).accentColor,
                          ),
                        )
                      ],
                    ),
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
                  AppLocalizations.of(context).payment,
                  // "Payment ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Text(
                  "${AppLocalizations.of(context).pillingType}*",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                            activeColor: Theme.of(context).accentColor,
                            groupValue: groupValue,
                            onChanged: (value) => setState(() {
                              groupValue = value;
                              this.enablefield = false;
                            }),
                            value: 'cash',
                          ),
                          Text(
                            AppLocalizations.of(context).cash,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Radio(
                            activeColor: Theme.of(context).accentColor,
                            groupValue: groupValue,
                            onChanged: (value) => setState(() {
                              groupValue = value;
                              this.enablefield = true;
                            }),
                            value: 'credit',
                          ),
                          Text(
                            AppLocalizations.of(context).credit,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
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
                              // AppLocalizations.of(context).debitCard,
                              "${AppLocalizations.of(context).addCredit} / ${AppLocalizations.of(context).debitCard}",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          child: CustomLightTextFormField(
                              enableInteractiveSelection: this.enablefield,
                              hintText:
                                  AppLocalizations.of(context).cardholder),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomLightTextFormField(
                          enableInteractiveSelection: this.enablefield,
                          hintText: AppLocalizations.of(context).cardnum,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          AppLocalizations.of(context).expireDate,
                          // "Expire Date",
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
                                  enableInteractiveSelection: this.enablefield,
                                  hintText: AppLocalizations.of(context).month),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 10, bottom: 10),
                              child: CustomLightTextFormField(
                                  enableInteractiveSelection: this.enablefield,
                                  hintText: AppLocalizations.of(context).year),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: (MediaQuery.of(context).size.width / 2.0) - 30,
                        child: CustomLightTextFormField(
                            enableInteractiveSelection: this.enablefield,
                            hintText: AppLocalizations.of(context).secCode),
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
                      '${AppLocalizations.of(context).items} :',
                      style: TextStyle(fontSize: 20, color: Color(0xff495057)),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: 20, left: 20, top: 10, bottom: 10),
                      child: Text(
                        "${AppLocalizations.of(context).arrivesby} 3 April ${AppLocalizations.of(context).to} 9 April",
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
                                    '${AppLocalizations.of(context).color}: Blue',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).size}: 37',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).quan}: 1',
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
                                    '${AppLocalizations.of(context).color}: Blue',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).size}: 37',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                        height: 1.5),
                                  ),
                                  Text(
                                    '${AppLocalizations.of(context).quan}: 1',
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
                              AppLocalizations.of(context).total,
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
                        text: AppLocalizations.of(context).payNow,
                        // AppLocalizations.of(context).done,
                        onpress: () {
                          Navigator.of(context).pushNamed('/editProduct');
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  AppLocalizations.of(context).finalStep,
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
