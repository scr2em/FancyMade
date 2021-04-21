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
                                  "${AppLocalizations.of(context).name} ${AppLocalizations.of(context).byAr}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).description,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${AppLocalizations.of(context).name} ${AppLocalizations.of(context).byEn}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "200 ${AppLocalizations.of(context).pound}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).description,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
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
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "200 ${AppLocalizations.of(context).pound}",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).discount,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).maxquan,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).quan,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).discDur,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).prodCat,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).tags,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).shipping,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "value",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context).specialOrder,
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                child: Text(
                                  "bool",
                                  style: TextStyle(
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                flex: 5,
                              ),
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
                  top: 50,
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
