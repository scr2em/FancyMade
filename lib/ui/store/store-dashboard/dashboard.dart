import 'package:finalproject/sharedWidgets/DashboardBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../sharedWidgets/DashboardBottomBar.dart';

class StoreDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).dashboard,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
      ),
      body: Container(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 130,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffE9A06B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        Text(AppLocalizations.of(context).awaitingorders,
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30))
                      ],
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).accentColor,
                      size: 110,
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xffE9DC6B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(AppLocalizations.of(context).returnedOrders,
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xffD0C242),
                            size: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xff6F6E69),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(AppLocalizations.of(context).notShipped,
                                  style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))
                            ],
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.local_shipping,
                            color: Color(0xff434340),
                            size: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context).liveInventory,
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.inventory,
                                color: Theme.of(context).accentColor,
                                size: 60,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context).pending,
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.inventory,
                                color: Theme.of(context).accentColor,
                                size: 60,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context).rejected,
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.inventory,
                                color: Theme.of(context).accentColor,
                                size: 60,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context).soldout,
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.inventory,
                                color: Theme.of(context).accentColor,
                                size: 60,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  "0",
                                  style: TextStyle(
                                      color: Color(0xff283148),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).pushNamed("/productlisting");
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
      bottomNavigationBar: DashboardBottomBar(selectedIndex: 0),
    );
  }
}
