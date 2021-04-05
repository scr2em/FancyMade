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
            },
            child: Text('hommee'),
          ),
        ),
        bottomNavigationBar: CustomBottomBar()
    );
  }
}
