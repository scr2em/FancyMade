import "package:flutter/material.dart";
import "../../../sharedWidgets/CustomBottomBar.dart";
import "../../../sharedWidgets/CustomNavigationButton.dart";
import "../../../sharedWidgets/CustomButton.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:finalproject/ui/main/main_locale_provider.dart";
import "package:provider/provider.dart";

class Profile extends StatelessWidget {
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
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70.0,
              backgroundImage: NetworkImage(
                  Provider.of<MainLocaleProvider>(context).user.avatar),
              backgroundColor: Colors.transparent,
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
                      new TextSpan(
                          text: Provider.of<MainLocaleProvider>(context)
                                  .user
                                  .name ??
                              "",
                          style: new TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            CustomNavigationButton(
              route: '/profileInfo',
              text: AppLocalizations.of(context).info,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            CustomNavigationButton(
                route: '/profileSettings',
                text: AppLocalizations.of(context).settings,
                backgroundColor: Theme.of(context).backgroundColor,
                prefixIcon: Icons.settings_outlined),
            CustomNavigationButton(
              route: '/order-history',
              text: AppLocalizations.of(context).orders,
              backgroundColor: Theme.of(context).backgroundColor,
              prefixIcon: Icons.list,
            ),
            Container(
              child: Provider.of<MainLocaleProvider>(context).user.storeId ==
                      false
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14.5),
                      child: CustomButton(
                          height: 50,
                          primary: Theme.of(context).accentColor,
                          text: AppLocalizations.of(context).createYourStoreNow,
                          onpress: () {
                            Navigator.of(context).pushNamed('/CreateStoreForm');
                          }),
                    )
                  : CustomNavigationButton(
                      route: '/store-dashboard',
                      text: AppLocalizations.of(context).storedashboard,
                      backgroundColor: Color(0xff283148),
                      prefixIcon: Icons.assistant_photo_outlined,
                      textColor: Colors.white,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context).help,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CustomNavigationButton(
              route: '/faq',
              text: AppLocalizations.of(context).faq,
              backgroundColor: Theme.of(context).backgroundColor,
              prefixIcon: Icons.help_outline,
            ),
            CustomNavigationButton(
              route: '/contactUs',
              text: AppLocalizations.of(context).contactUs,
              backgroundColor: Theme.of(context).backgroundColor,
              prefixIcon: Icons.call,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(selectedIndex: 3),
    );
  }
}
