import 'dart:io';

import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import "package:flutter/material.dart";
import "../../../sharedWidgets/CustomAppBar.dart";
import "../../../sharedWidgets/CustomBottomBar.dart";
import "../../../services/auth_service.dart";

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Center(
              child: Text(
            "My Name Name",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 24, height: 2),
          )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Hello User ! Nice to meet you '),
          ),
          new AlertDialog(
            title: new Text("Hello User!"),
            content: Text(
              "From your My Account Dashboard you have the ability to view a snapshot of your recent account activity and update your account information. Select a link below to view or edit information.",
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 14, height: 2),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                          child: new Text(
                            'Edit',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onTap: () => {}),
                    ],
                  ),
                ),
                Text(
                  'username',
                  style: TextStyle(height: 1.5),
                ),
                Text(
                  'user@user.com',
                  style: TextStyle(height: 1.5),
                )
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Manage Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                          child: new Text(
                            'Edit',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onTap: () => {}),
                    ],
                  ),
                ),
                Text(
                  'Main Paying Address: ',
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                Text(
                  'Address Address',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                Text(
                  'Main Shipping Address',
                  style: TextStyle(height: 1.5),
                ),
                Text(
                  'Address Address',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),

      // Center(
      //   child: ElevatedButton(
      //       child: Text('signout'),
      //       onPressed: () async {
      //         dynamic result = await _auth.signOut();
      //         if (result == null) {
      //           print('error signing in');
      //         } else {
      //           print('signedin');
      //           print(result);
      //         }
      //       }),
      // ),
    );
  }
}
