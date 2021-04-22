import 'package:animate_do/animate_do.dart';
import 'package:finalproject/sharedWidgets/CustomButton.dart';
import 'package:finalproject/sharedWidgets/CustomLightTextField.dart';
import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../sharedWidgets/CustomBottomBar.dart';

class OrdersHistory extends StatefulWidget {
  @override
  OrdersHistoryState createState() => OrdersHistoryState();
}

class OrdersHistoryState extends State<OrdersHistory> {
  List<Orders> orders = [
    Orders(
        orderId: '#1231231234',
        productName: ['bag', 'carpet', 'book'],
        status: false,
        date: DateTime.now()),
    Orders(
        orderId: '#1231231234',
        productName: ['bag', 'carpet', 'book'],
        status: false,
        date: DateTime.now()),
    Orders(
        orderId: '#1231231234',
        productName: ['bag', 'carpet', 'book'],
        status: true,
        date: DateTime.now()),
    Orders(
        orderId: '#1231231234',
        productName: ['bag', 'carpet', 'book'],
        status: false,
        date: DateTime.now()),
    Orders(
        orderId: '#1231231234',
        productName: ['bag', 'carpet', 'book'],
        status: true,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).orderhistory,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ListView.builder(
            itemCount: orders.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              // print();
              return Container(
                  padding: EdgeInsets.all(8),
                  child: ExpansionTile(
                      collapsedBackgroundColor: Colors.grey[200],
                      backgroundColor: Colors.grey[200],
                      subtitle: Text('${orders[index].date}'),
                      title: Text(
                        '${AppLocalizations.of(context).order}: ${orders[index].orderId}',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w500),
                      ),
                      children: <Widget>[
                        Wrap(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(children: [
                                    Text(
                                        '${AppLocalizations.of(context).status}: \n',
                                        style: TextStyle(fontSize: 14)),
                                    Text(
                                      "${orders[index].status == true ? AppLocalizations.of(context).ongoing : AppLocalizations.of(context).delivered} \n",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: orders[index].status == true
                                              ? Theme.of(context).accentColor
                                              : Colors.lightGreen),
                                    )
                                  ]),
                                  Text(
                                    "${AppLocalizations.of(context).items}:\n${(orders[index].productName.map((e) => '             •$e')).join('\n\n')}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: BounceInDown(
                                      child: CustomButton(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: 40,
                                          text:
                                              '${AppLocalizations.of(context).moredetails}',
                                          fontsize: 12,
                                          primary:
                                              Theme.of(context).accentColor,
                                          onprimary: Colors.white,
                                          bordercolor: Colors.transparent,
                                          onpress: () {}),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]));
            }),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class Orders {
  String orderId;
  List<String> productName;
  bool status;
  DateTime date;
  Orders(
      {@required this.orderId,
      @required this.productName,
      @required this.status,
      @required this.date});
}
