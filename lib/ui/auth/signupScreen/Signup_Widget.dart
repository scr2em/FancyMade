import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigate back to first screen when tapped.
            },
            child: Text('Go back!'),
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
