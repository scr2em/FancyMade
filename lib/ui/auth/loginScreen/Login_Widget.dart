import 'package:finalproject/ui/main/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: ElevatedButton(
            child: Provider.of<MainProvider>(context).signedin
                ? Text(AppLocalizations.of(context).helloWorld)
                : Text('ok'),
            onPressed: () {
              // Navigate to the second screen using a named route.
              // Navigator.pushNamed(context, '/second');
              Provider.of<MainProvider>(context, listen: false).changeAuth();
            },
          ),
        ),
        bottomNavigationBar: CustomBottomBar());
  }
}
