import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../sharedWidgets/CustomBottomBar.dart';

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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff5F5F5F),
                      ),
                    )),
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
                  child: Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  height: 1.5),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Users Review',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                height: 1.5),
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
                      CustomTextFormField(
                        hintText: "Your opinion",
                      ),
                    ],
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      width: .02,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Requst a special item ?',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                      ),
                      CustomTextFormField(
                        hintText: "Describe your requested item",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Request'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  return Theme.of(context)
                                      .accentColor; // Use the component's default.
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
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
                      Text(
                        'Quantity',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            height: 1.5),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Request'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return Theme.of(context)
                                  .accentColor; // Use the component's default.
                            },
                          ),
                        ),
                      )
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
