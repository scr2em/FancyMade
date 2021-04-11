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
            },
            child: Text('home'),
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
