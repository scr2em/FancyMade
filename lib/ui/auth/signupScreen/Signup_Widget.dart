import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Custom Widgets
import '../../../sharedWidgets/CustomBottomBar.dart';
import '../../../sharedWidgets/CustomAppBar.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
          child: Form(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {},
            ),
            SizedBox(
              height: 20,
            ),

          ],
        ),
      )),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
