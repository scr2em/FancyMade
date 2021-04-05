import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import '../../sharedWidgets/CustomBottomBar.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: ListView(children: [
      Container(
          decoration: new BoxDecoration(color: Colors.white),
          alignment: Alignment.topCenter,
          child: Stack(alignment: Alignment.bottomLeft, children: [
            Image.network(
                "https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536",
                fit: BoxFit.fill),
            Positioned(
              right: 0,
              bottom: -1,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 40, left: 40),
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            width: .02,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red[400],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.black,
                            width: .02,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.share,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ])),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "category / shoes ",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 11),
        ),
      ),
      Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Adidas Men’s Socce r Tiro 17 Training Pants',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Positioned(
          bottom: -5,
          right: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '500',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
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
        )
      ]),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
              style: TextStyle(fontSize: 14, color: HexColor('5F5F5F')))),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(
            width: .02,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              'Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text('Availability: in stock')
          ],
        ),
      )
    ])));
  }
}
