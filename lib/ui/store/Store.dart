import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../.../../../sharedWidgets/CustomBottomBar.dart';
import '../.../../../sharedWidgets/CustomAppBar.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Store",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(child: CustomSearchInput()),
                        IconButton(
                            icon: Icon(Icons.filter_alt_outlined),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  // featured
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Featured",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text("View all",
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        child: ListView(
// This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Product(
                              price: 100,
                              discount: 10,
                              badges: false,
                            ),
                            Product(
                              price: 200,
                              discount: 20,
                              badges: false,
                            ),
                            Product(
                              price: 150,
                              badges: false,
                            ),
                            Product(
                              price: 120,
                              badges: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

// //more
                  Container(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Text(
                          "More (14)",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  //grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    // mainAxisSpacing: 75,
                    children: [
                      Product(price: 100),
                      Product(price: 100),
                      Product(
                        price: 100,
                        discount: 15,
                      ),
                      Product(price: 100),
                      Product(price: 100),
                      Product(price: 100),
                      Product(price: 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class Product extends StatelessWidget {
  int price;
  int discount;
  bool badges;

  Product({this.price, this.discount = 0, this.badges = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      width: 190.0,
      child: Wrap(
        children: [
          Placeholder(
            fallbackHeight: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text("Product name ",
                style: Theme.of(context).textTheme.bodyText1),
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
          Price(
            value: price,
            discount: discount,
          ),
          Icon(
            badges ? Icons.beenhere_outlined : null,
            color: Colors.grey,
            size: 18,
          ),
          Icon(badges ? Icons.local_offer_outlined : null,
              color: Colors.grey, size: 18),
          Icon(badges ? Icons.local_shipping_outlined : null,
              color: Colors.grey, size: 18),
        ],
      ),
    );
  }
}

class Price extends StatelessWidget {
  int value;
  int discount;
  double priceFontSize = 18;

  Price({this.value, this.discount = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          children: discount != 0
              ? [
                  Text(
                    '$value EGP',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '${((1 - (discount / 100)) * value).toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]
              : [
                  Text(
                    '$value EGP',
                    style: TextStyle(
                        color: Color(0xffFF5959),
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
    );
  }
}
