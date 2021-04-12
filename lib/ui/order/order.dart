import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Order #114224')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(
                "Details :",
                style: TextStyle(fontSize: 26),
              ),
              Text(
                '• Cash on delivery: 200EGP',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  'Items :',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 250,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          // ClipRRect(
                          //   height:
                          //   child: Image.network(
                          //       "https://wilderness-production.imgix.net/2018/11/Terra-pants.jpg?auto=compress%2Cformat&fit=scale&h=1020&ixlib=php-3.3.0&w=1536&wpsize=1536x1536",
                          //       fit: BoxFit.cover),
                          // ),
                          Text('NikeCourt Lite 2')
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text("nnn"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
