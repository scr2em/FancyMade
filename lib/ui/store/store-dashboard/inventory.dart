import 'dart:ui';

import 'package:finalproject/sharedWidgets/CustomAppBar.dart';
import 'package:finalproject/sharedWidgets/DashboardBottomBar.dart';
import 'package:flutter/material.dart';

class StoreInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Inventory')),
      ),
      body: Column(
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
                        "200",
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
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // if (constraints.maxWidth > 200.0) {
                //   return new Text('BIG');
                // } else {
                //   return new Text('SMALL');
                // }
                Expanded(
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Container(child: Text("data"));
                        }),
                  ),
                );
              }),
              //     Expanded(
              //   child: SizedBox(
              //     height:constraints.maxWidth ,
              //     child: ListView.builder(
              //         itemCount: 20,
              //         itemBuilder: (context, index) {
              //           return Text("data");
              //         }),
              //   ),
              // )
              //  Container(
              //     padding: EdgeInsets.all(3),
              //     decoration: BoxDecoration(
              //         border: Border(
              //             bottom: BorderSide(color: Colors.black12))),
              //     child:

              // Row(
              //   children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(8.0),
              //       child: Image.network(
              //         "https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536",
              //         height: 150.0,
              //         width: 100.0,
              //       ),
              //     )
              //   ],
              // )
              // );
              // })
            ),
          ),
        ],
      ),
      bottomNavigationBar: DashboardBottomBar(),
    );
  }
}
