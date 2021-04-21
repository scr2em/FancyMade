import 'package:finalproject/ui/cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import "../models/CustomUser.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.of(context).pushNamed('/home');
      } else if (index == 1) {
        Navigator.of(context).pushNamed('/faq');
      } else if (index == 2) {
        Navigator.of(context).pushNamed('/loginProfileWrapper');
      } else if (index == 3) {
        NAlertDialog(
          content: Cart(),
          blur: 2,
        ).show(context, transitionType: DialogTransitionType.Bubble);
      } else {
        NAlertDialog(
          content: Cart(),
          blur: 2,
        ).show(context, transitionType: DialogTransitionType.Bubble);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<CustomUser>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      // iconSize: 9,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context).sw_CustomBottomBar_home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: AppLocalizations.of(context).sw_CustomBottomBar_favorite,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: AppLocalizations.of(context).profile,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: AppLocalizations.of(context).cart,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }
}
