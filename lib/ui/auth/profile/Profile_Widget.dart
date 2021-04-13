import 'dart:io';

import 'package:finalproject/sharedWidgets/CustomTextFormField.dart';
import 'package:finalproject/ui/store/CreateStoreForm.dart';
import "package:flutter/material.dart";
import "../../../sharedWidgets/CustomAppBar.dart";
import "../../../sharedWidgets/CustomBottomBar.dart";
import "../../../services/auth_service.dart";
import "../../../sharedWidgets/CustomNavigationButton.dart";
import "../../../sharedWidgets/CustomButton.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).profile,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Theme.of(context).accentColor
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage('https://via.placeholder.com/110x110')
            ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,

                ),
                children: <TextSpan>[
                  new TextSpan(text: AppLocalizations.of(context).welcome),
                  new TextSpan(text: 'Mohamed', style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),

        ),
            CustomNavigationButton(route:'/profileInfo',text:AppLocalizations.of(context).info,backgroundColor: Theme.of(context).backgroundColor,),
            CustomNavigationButton(route:'/profileSettings',text:AppLocalizations.of(context).settings,backgroundColor: Theme.of(context).backgroundColor,prefixIcon: Icons.settings_outlined),
            CustomNavigationButton(route:'/orders',text:AppLocalizations.of(context).orders,backgroundColor: Theme.of(context).backgroundColor,prefixIcon: Icons.list,),
            CustomNavigationButton(route:'/store',text:AppLocalizations.of(context).store,backgroundColor: Color(0xff283148),prefixIcon: Icons.assistant_photo_outlined,textColor: Colors.white,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.5),
              child: CustomButton(
                height: 50,
                primary: Theme.of(context).accentColor,
                text: AppLocalizations.of(context).createYourStoreNow,
                  onpress: (){
                    Navigator.of(context).pushNamed('/CreateStoreForm');


                  }
              ),
            ),
            SizedBox(height: 20,),
            Text(AppLocalizations.of(context).help, style: TextStyle(fontSize:18, fontWeight: FontWeight.bold ),),
            CustomNavigationButton(text:AppLocalizations.of(context).faq,backgroundColor: Theme.of(context).backgroundColor,prefixIcon: Icons.help_outline),
            CustomNavigationButton(text:AppLocalizations.of(context).contactUs,backgroundColor: Theme.of(context).backgroundColor,prefixIcon: Icons.call,),
            SizedBox(height: 40,),




          ],
        ),
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
