import 'dart:ui';

import 'package:finalproject/models/Product.dart';
import 'package:finalproject/sharedWidgets/CustomAppBar.dart';
import 'package:finalproject/sharedWidgets/DashboardBottomBar.dart';
import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:finalproject/ui/product/EditProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:finalproject/services/products_service.dart";
import 'package:provider/provider.dart';

class StoreInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).inventory,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
      ),
      body: FutureBuilder(
        future: ProductsService().getInventory(
            uid: Provider.of<MainLocaleProvider>(context).user.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data.docs;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: DefaultTabController(
                length: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: (Colors.grey),
                              blurRadius: 10, // soften the shadow
                              spreadRadius: 1, //extend the shadow
                              offset: Offset(1, 1),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    "${docs.length}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    "Total Items",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    "110",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Text(
                                    "Offers",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        labelColor: Theme.of(context).accentColor,
                        unselectedLabelColor: Theme.of(context).hintColor,
                        indicatorWeight: 5,
                        isScrollable: true,
                        labelStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 18,
                        ),
                        tabs: [
                          Container(
                            width: .3 * MediaQuery.of(context).size.width,
                            child: Tab(
                              text: 'All Products',
                            ),
                          ),
                          Container(
                            width: .3 * MediaQuery.of(context).size.width,
                            child: Tab(
                              text: 'Category1',
                            ),
                          ),
                          Container(
                            width: .2 * MediaQuery.of(context).size.width,
                            child: Tab(
                              text: 'Tab3',
                            ),
                          ),
                          Container(
                            width: .2 * MediaQuery.of(context).size.width,
                            child: Tab(
                              text: 'Tab4',
                            ),
                          ),
                          Container(
                            width: .2 * MediaQuery.of(context).size.width,
                            child: Tab(
                              text: 'Tab5',
                            ),
                          ),
                        ],
                      ),
                      LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          height: 400,
                          child: TabBarView(
                            children: [
                              _buildList(
                                  key: "key1", string: "List1: ", docs: docs),
                              _buildList(
                                  key: "key2", string: "List2: ", docs: docs),
                              _buildList(
                                  key: "key3", string: "List3: ", docs: docs),
                              _buildList(
                                  key: "key4", string: "List4: ", docs: docs),
                              _buildList(
                                  key: "key5", string: "List5: ", docs: docs),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
                child: Center(
                    child:
                        Text("Error something went wrong please reload...")));
          } else {
            return Container(child: Center(child: CircularProgressIndicator()));
          }
        },
      ),
      bottomNavigationBar: DashboardBottomBar(selectedIndex: 1),
    );
  }
}

Widget _buildList({String key, String string, docs}) {
  return ListView.builder(
    key: PageStorageKey(key),
    itemCount: docs.length,
    itemBuilder: (context, i) => Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).accentColor)),
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 50,
            child: Image.network(
              docs[i]["image"],
            ),
          ),
          title: Text(docs[i]["arName"]),
          subtitle: Text('Men\'s Shoes'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProduct(
                            newProduct: Product.fromJson(docs[i].data()),
                            productId: docs[i].id)),
                  );
                },
                child: Text(
                  "edit",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).accentColor,
                      height: .9),
                ),
              ),
              Text(
                '${docs[i]["price"]} L.E',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ],
          ),
        )),
  );
}
