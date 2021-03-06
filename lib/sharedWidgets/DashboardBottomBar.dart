import 'package:finalproject/ui/main/main_locale_provider.dart';
import 'package:finalproject/ui/store/store-dashboard/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DashboardBottomBar extends StatelessWidget {
  final int selectedIndex;

  DashboardBottomBar({Key key, this.selectedIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "${AppLocalizations
              .of(context)
              .dashboard}",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: AppLocalizations
              .of(context)
              .inventory,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: AppLocalizations
              .of(context)
              .requestmsg,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: AppLocalizations
              .of(context)
              .info,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme
          .of(context)
          .accentColor,
      backgroundColor: Color(0xff283148),
      unselectedItemColor: Theme
          .of(context)
          .backgroundColor,
      onTap: (int index) {
        if (selectedIndex != index) {
          if (index == 0) {
            Navigator.of(context).pushNamed('/store-dashboard');
          } else if (index == 1) {
            Navigator.of(context).pushNamed('/store-inventory');
          } else if (index == 2) {
            Navigator.of(context).pushNamed('/req-msgs');
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return StoreInfo(
                  storeId: Provider
                      .of<MainLocaleProvider>(context)
                      .user
                      .storeId,
                );
              }),
            );
          } else {
            Navigator.of(context).pushNamed('/store-dashboard');
          }
        }
      },
    );
  }
}
