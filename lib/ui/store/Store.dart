import 'package:finalproject/sharedWidgets/ProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../.../../../sharedWidgets/CustomBottomBar.dart';
import '../.../../../sharedWidgets/CustomAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context).store,
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
                            Text(AppLocalizations.of(context).viewall,
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
