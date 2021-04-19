import 'dart:ui';

import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../sharedWidgets/CustomBottomBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';

import '../../sharedWidgets/CustomButton.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                Stack(children: [
                  Container(
                    decoration: new BoxDecoration(color: Colors.white),
                    alignment: Alignment.topCenter,
                    child: Image.network(
                        "https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536",
                        fit: BoxFit.fill),
                  ),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, right: 40, left: 40),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                      ),
                      child: Text(
                        '50%',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    bottom: 50,
                    right: 0,
                  )
                ]),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "category / shoes ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11),
                              ),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(
                                      Icons.favorite_border_rounded,
                                      color: Colors.red[400],
                                    ),
                                    backgroundColor: Colors.white,
                                    onPressed: () {}),
                                FloatingActionButton(
                                    mini: true,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.black,
                                    ),
                                    backgroundColor: Colors.white,
                                    onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Adidas Men’s Socce r Tiro 17 Training Pants',
                          //////need responsive
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '500',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      decoration: TextDecoration.lineThrough),
                                ),
                                Text(
                                  ' 250 EGP',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Theme.of(context).accentColor),
                                )
                              ],
                            ),
                            RatingBarIndicator(
                              rating: 2.75,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 20),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff5F5F5F),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                AppLocalizations.of(context).details,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    height: 1.5),
                              ),
                            ),
                            Text('Availability: in stock'),
                            Text(
                              '• Available size',
                              style: TextStyle(height: 1.5),
                            ),
                            Text(
                              '• Available size',
                              style: TextStyle(height: 1.5),
                            ),
                            Text(
                              '• Available size',
                              style: TextStyle(height: 1.5),
                            ),
                            Text(
                              '• Available size',
                              style: TextStyle(height: 1.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              AppLocalizations.of(context).userReviews,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                      // CustomTextFormField(
                      //   hintText: AppLocalizations.of(context).yourOpinion,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Albert Flores",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            RatingBarIndicator(
                                              rating: 2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "20 April 2020",
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "user review user review user review user review user review user review ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Albert Flores",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            RatingBarIndicator(
                                              rating: 2.75,
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "20 April 2020",
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "user review user review user review user review user review user review ",
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          AppLocalizations.of(context).requestAspecialItem,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        ),
                      ),
                      CustomTextFormField(
                        maxLines: 5,
                        hintText: AppLocalizations.of(context)
                            .describeYourRequestedItem,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomButton(
                                elevation: 0,
                                // height: 60,
                                width: 150,
                                primary: Theme.of(context).accentColor,
                                text: AppLocalizations.of(context).request,
                                onpress: () {
                                  Navigator.of(context).pushNamed('/product');
                                }),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Store Info",
                              // AppLocalizations.of(context).storeInfo,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1.5),
                            ),
                          ),
                        ],
                      ),
                      // CustomTextFormField(
                      //   hintText: AppLocalizations.of(context).yourOpinion,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 35,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Store Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Row(
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: 2.75 / 5,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    itemCount: 1,
                                                    itemSize: 20,
                                                    direction: Axis.horizontal,
                                                  ),
                                                  Text(
                                                    " 2.75",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "95% Positive FeedBack",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).quantity,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                height: 1.5),
                          ),
                          Container(
                            // width: 100,
                            // height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(0xff283148).withOpacity(.2),
                              ),
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xff283148).withOpacity(.2),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(10, 2))),
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        minimumSize: MaterialStateProperty.all(
                                            Size(10, 2))),
                                    child: Text("+",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.black)),
                                  )
                                ]),
                          )
                        ],
                      ),
                      CustomButton(
                          elevation: 0,
                          // height: 60,
                          width: 150,
                          primary: Theme.of(context).accentColor,
                          text: AppLocalizations.of(context).addtocart,
                          onpress: () {
                            Navigator.of(context).pushNamed('/profileSettings');
                          })
                    ],
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ]),
        bottomNavigationBar: Container(child: CustomBottomBar()));
  }
}
