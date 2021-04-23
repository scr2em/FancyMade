
import 'package:animate_do/animate_do.dart';
import "package:flutter/material.dart";
import "../../../sharedWidgets/CustomBottomBar.dart";
import "../../../sharedWidgets/CustomNavigationButton.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileUnAuth extends StatelessWidget {
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
            FadeInDown(
              duration: Duration(microseconds: 500),
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/profile.jpg",
                  ),
                ),
              ),
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
                      TextSpan(text: AppLocalizations.of(context).welcome),
                    ],
                  ),
                ),
              ),
            ),
            FadeInDownBig(
              duration: Duration(milliseconds: 500),
              child: CustomNavigationButton(
                  route: '/profileSettings',
                  text: AppLocalizations.of(context).settings,
                  backgroundColor: Theme.of(context).backgroundColor,
                  prefixIcon: Icons.settings_outlined),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context).help,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FadeInDownBig(
              duration: Duration(milliseconds: 500),
              child: CustomNavigationButton(
                route: '/faq',
                text: AppLocalizations.of(context).faq,
                backgroundColor: Theme.of(context).backgroundColor,
                prefixIcon: Icons.help_outline,
              ),
            ),
            FadeInDownBig(
              duration: Duration(milliseconds: 500),
              child: CustomNavigationButton(
                route: '/contactUs',
                text: AppLocalizations.of(context).contactUs,
                backgroundColor: Theme.of(context).backgroundColor,
                prefixIcon: Icons.call,
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),

      bottomSheet: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: Theme.of(context).accentColor)),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Theme.of(context).accentColor,
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Wrap(children: [
                    Text(
                      AppLocalizations.of(context).createAnAccount,
                      textAlign: TextAlign.center,
                    )
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed('/signin');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).accentColor),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Theme.of(context).accentColor)),
                    foregroundColor: MaterialStateProperty.all(
                      Colors.black,
                    ),
                    overlayColor: MaterialStateProperty.all(
                      Theme.of(context).accentColor,
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Text(AppLocalizations.of(context).signin,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(selectedIndex: 3),

    );
  }
}
