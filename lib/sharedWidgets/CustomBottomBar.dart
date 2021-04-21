import 'package:finalproject/ui/cart/Cart.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import "../models/CustomUser.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;

  CustomBottomBar({Key key, this.selectedIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
<<<<<<< HEAD

      // iconSize: 9,
=======
>>>>>>> 3cdf7c1ff41fe9f2791919e76333df926b270370
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context).sw_CustomBottomBar_home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: AppLocalizations.of(context).cart,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mark_email_unread_outlined),
          label: AppLocalizations.of(context).messages,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: AppLocalizations.of(context).profile,
        ),
<<<<<<< HEAD
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: AppLocalizations.of(context).cart,
        ),
=======
>>>>>>> 3cdf7c1ff41fe9f2791919e76333df926b270370
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: (int index) {
        if (index == 0) {
          Navigator.of(context).pushNamed('/home');
        } else if (index == 1) {
          NAlertDialog(
            content: Cart(),
            blur: 2,
          ).show(context, transitionType: DialogTransitionType.Bubble);
        } else if (index == 2) {
        } else if (index == 3) {
          Navigator.of(context).pushNamed('/loginProfileWrapper');
        } else {
          Navigator.of(context).pushNamed('/home');
        }
      },
    );
  }
}
