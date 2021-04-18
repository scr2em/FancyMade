import 'dart:math';

import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  onCrement(int value, int index) {
    cartproducts[index].multiplier = cartproducts[index].multiplier + value;

    setState(() {
      return cartproducts[index].multiplier > 1
          ? cartproducts[index].multiplier
          : cartproducts[index].multiplier = 1;
      // max(cartproducts[index].multiplier, cartproducts[index].multiplier = 1);
    });
  }

  onload(int index) {
    var agg = cartproducts[index].multiplier * cartproducts[index].price;
    return agg;
  }

  List<Cartproducts> cartproducts = [
    Cartproducts(
        price: 120,
        productname: 'notebook',
        multiplier: 3,
        imageURL:
            'https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/994524/pexels-photo-994524.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/301703/pexels-photo-301703.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/6805801/pexels-photo-6805801.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://www.pexels.com/photo/white-envelope-with-red-paper-heart-4226726/'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/4462780/pexels-photo-4462780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/1030946/pexels-photo-1030946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/1272838/pexels-photo-1272838.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/2885578/pexels-photo-2885578.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Cartproducts(
        price: 120,
        productname: 'bags',
        multiplier: 2,
        imageURL:
            'https://images.pexels.com/photos/2072181/pexels-photo-2072181.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      width: MediaQuery.of(context).size.width,
      child: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height),
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(30),
                  child: AppBar(
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      flexibleSpace: SafeArea(
                          minimum: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Text(
                                  //should be localized
                                  'cart',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline1),
                              Spacer(),
                              IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.black,
                                  size: 16,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )))),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListView.builder(
                        itemCount: cartproducts.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black12))),
                            child: GestureDetector(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  border: Border.all(
                                                      color: Colors.grey[100])),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                child: Image.network(
                                                    cartproducts[index]
                                                        .imageURL,
                                                    height: 90,
                                                    width: 90.0,
                                                    fit: BoxFit.fill),
                                              )),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Men shoes',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  // should be localized
                                                  Text(
                                                    'Price:${cartproducts[index].price} L.E',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),

                                                  Container(
                                                      width: 112,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .grey[300])),
                                                      child: Row(
                                                        children: [
                                                          CustomButton(
                                                              width: 37.5,
                                                              height: 23,
                                                              text: '-',
                                                              fontsize: 12,
                                                              primary: Colors
                                                                  .grey[300],
                                                              onprimary:
                                                                  Colors.black,
                                                              radiusbotleft: 4,
                                                              radiustopleft: 4,
                                                              radiustbotright:
                                                                  0,
                                                              radiustopright: 0,
                                                              bordercolor: Colors
                                                                  .transparent,
                                                              onpress: () {
                                                                onCrement(
                                                                    -1, index);
                                                              }),
                                                          Container(
                                                            width: 35,
                                                            child: Text(
                                                              '${cartproducts[index].multiplier}',
                                                              textScaleFactor:
                                                                  1.1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                          CustomButton(
                                                              width: 37.5,
                                                              height: 23,
                                                              text: '+',
                                                              fontsize: 12,
                                                              primary: Colors
                                                                  .grey[300],
                                                              onprimary:
                                                                  Colors.black,
                                                              radiusbotleft: 0,
                                                              radiustopleft: 0,
                                                              radiustbotright:
                                                                  4,
                                                              radiustopright: 4,
                                                              bordercolor: Colors
                                                                  .transparent,
                                                              onpress: () {
                                                                onCrement(
                                                                    1, index);
                                                              }),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  cartproducts.removeAt(index);
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "removed item")));
                                              },
                                            ),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            Container(
                                              child: Text(
                                                '${onload(index)} L.E',
                                                textScaleFactor: 0.9,
                                              ),
                                            )
                                          ])
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              bottomSheet: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 5.5,
                // child: Text('hi'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        width: 150,
                        height: 40,
                        //need localization
                        text: 'Check out',
                        fontsize: 12,
                        primary: Theme.of(context).accentColor,
                        onprimary: Colors.white,
                        bordercolor: Colors.transparent,
                        onpress: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 6),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '${cartproducts.map((e) => e.price * e.multiplier).reduce((value, element) => value + element)}',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
    );
  }
}

class Cartproducts {
  double price;
  String productname;
  String imageURL;
  int multiplier;
  Cartproducts({
    @required this.price,
    @required this.productname,
    @required this.imageURL,
    @required this.multiplier,
  });
}
