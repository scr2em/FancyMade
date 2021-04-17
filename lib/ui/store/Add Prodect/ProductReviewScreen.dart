import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../sharedWidgets/CustomButton.dart';

class ProductReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).review,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  AppLocalizations.of(context).reviewsbelow,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              // DataTable(columns: [
              //   DataColumn(label: Text("Name")),
              //   DataColumn(label: Text("Value"))
              // ], rows: [
              //   DataRow(cells: [
              //     DataCell(Text("bag")),
              //     DataCell(Text("200 L.E"), showEditIcon: true, onTap: () {})
              //   ]),
              //   DataRow(cells: [
              //     DataCell(Text("bag")),
              //     DataCell(Text("200 L.E"), showEditIcon: true, onTap: () {})
              //   ])
              // ])
              //
              // GridView.builder(),
              // GridView.count(
              //   mainAxisSpacing: 2,
              //   crossAxisCount: 2,
              //   children: [
              //     Text("Name"),
              //     Text("bag"),
              //     Text("Name"),
              //     Text("bag"),
              //     Text("Name"),
              //     Text("bag"),
              //     Text("Name"),
              //     Text("bag"),
              //   ],
              // )
              //
              // GridView.count(
              //   // Create a grid with 2 columns. If you change the scrollDirection to
              //   // horizontal, this produces 2 rows.
              //   crossAxisCount: 2,
              //   // Generate 100 widgets that display their index in the List.
              //   children: List.generate(8, (index) {
              //     return Center(
              //       child: Text(
              //         'Item $index',
              //         style: Theme.of(context).textTheme.headline5,
              //       ),
              //     );
              //   }, growable: true),
              // )
              //
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffeeeeee),
                    border: Border.all(
                      width: 3,
                      color: Color(0xffeeeeee),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        AppLocalizations.of(context).prodInfo,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, right: 20, left: 20, bottom: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).name,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  "Bag",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).price,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  "200 ${AppLocalizations.of(context).pound}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).name,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  "Bag",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).price,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  "200 ${AppLocalizations.of(context).pound}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).name,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 1,
                              ),
                              Expanded(
                                child: Text(
                                  "Bag",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 3,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                ),
                child: CustomButton(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    primary: Color(0xff273147),
                    text: AppLocalizations.of(context).submityourlisting,
                    onpress: () {
                      Navigator.of(context).pushNamed('/');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                    child: Text(
                  "(${AppLocalizations.of(context).youcanaddlater})",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
