import "package:flutter/material.dart";
import "../../../../sharedWidgets/CustomTextFormField.dart";
import '../../../../utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../main/main_locale_provider.dart';
import 'package:provider/provider.dart';
import '../../../../sharedWidgets/CustomBottomBar.dart';
import "../../../../services/auth_service.dart";
import "../../../main/main_provider.dart";
import "../../../../models/CustomUser.dart";

const int ARABIC_VALUE = 1;
const int ENGLISH_VALUE = 2;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languages = ["عربي", "english"];
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MainLocaleProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_ios),
        title: Text(
          AppLocalizations.of(context).settings,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: DropdownButton<String>(
                  underline: Container(),
                  isExpanded: true,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(AppLocalizations.of(context).language),
                        )),
                        Image.asset(
                          "assets/images/language/ar.png",
                          scale: 11,
                        ),
                      ],
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("عربي"),
                      onTap: () async {
                        Provider.of<MainLocaleProvider>(context, listen: false)
                            .updateApplicationLocale('ar');
                      },
                    ),
                    DropdownMenuItem(
                      child: Text("english"),
                      onTap: () async {
                        Provider.of<MainLocaleProvider>(context, listen: false)
                            .updateApplicationLocale('en');
                      },
                    ),
                  ],
                  onChanged: (_) {},
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: ShapeDecoration(
                  color: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: DropdownButton<String>(
                  underline: Container(),
                  isExpanded: true,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(AppLocalizations.of(context).theme),
                        )),

                      ],
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("dark"),
                      onTap: () async {
                        Provider.of<MainLocaleProvider>(context, listen: false)
                            .updateApplicationTheme('ThemeMode.dark');
                      },
                    ),
                    DropdownMenuItem(
                      child: Text("light"),
                      onTap: () async {
                        Provider.of<MainLocaleProvider>(context, listen: false)
                            .updateApplicationTheme('ThemeMode.light');
                      },
                    ),
                    DropdownMenuItem(
                      child: Text("Following system theme"),
                      onTap: () async {
                        Provider.of<MainLocaleProvider>(context, listen: false)
                            .updateApplicationTheme('ThemeMode.system');
                      },
                    ),
                  ],
                  onChanged: (_) {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: user != null
          ? Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () async {
                          Provider.of<MainLocaleProvider>(context,
                                  listen: false)
                              .signOut();
                          Navigator.of(context).pushNamed("/signin");
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
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        child: Text(AppLocalizations.of(context).signout),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
