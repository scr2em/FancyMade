import 'package:finalproject/ui/inbox/inboxscreen.dart';
import "package:flutter/material.dart";
import "../../sharedWidgets/CustomAppBar.dart";
import "../../sharedWidgets/CustomBottomBar.dart";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped.
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/store-dashboard', (Route<dynamic> route) => false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            },
            child: Text('home'),
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
