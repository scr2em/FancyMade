import "package:flutter/material.dart";
import "../../../../sharedWidgets/CustomTextFormField.dart";
import '../../../../utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../main/main_locale_provider.dart';
import 'package:provider/provider.dart';
import '../../../../sharedWidgets/CustomBottomBar.dart';

const int ARABIC_VALUE = 1;
const int ENGLISH_VALUE = 2;

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languages = ["عربي", "english"];

  @override
  Widget build(BuildContext context) {
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
            // Container(
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).backgroundColor,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: ListTile(
            //     leading: Icon(Icons.flag_outlined,
            //         color: Theme.of(context).accentColor),
            //     title: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text("Language"),
            //         Image.asset(
            //           "assets/images/language/ar.png",
            //           scale: 11,
            //         )
            //       ],
            //     ),
            //     trailing: Icon(Icons.keyboard_arrow_down,
            //         color: Theme.of(context).accentColor),
            //   ),
            // ),
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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
