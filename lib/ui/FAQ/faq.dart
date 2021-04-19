import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../sharedWidgets/CustomBottomBar.dart';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).faq,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff273147)),
      ),
      body: ListView(children: [
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q1,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a1,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q2,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a2,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q3,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a3,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q1,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a1,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q2,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a2,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q3,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a3,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q1,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a1,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q2,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a2,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            AppLocalizations.of(context).fqa_q3,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                AppLocalizations.of(context).fqa_a3,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
              ),
            )
          ],
        ),
      ]
          // ),
          ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
