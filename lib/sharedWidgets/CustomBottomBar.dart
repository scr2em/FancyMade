import 'package:finalproject/ui/cart/Cart.dart';
import 'package:finalproject/ui/main/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;

  CustomBottomBar({Key key, this.selectedIndex = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context).sw_CustomBottomBar_home,
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: cartProvider.cartproducts.length != 0
                    ? [
                        Icon(Icons.shopping_cart_outlined),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 15,
                              minHeight: 15,
                            ),
                            child: Text(
                              '${cartProvider.cartproducts.length}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ]
                    : [Icon(Icons.shopping_cart_outlined)],
              ),
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
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).backgroundColor,
          onTap: (int index) {
            if(selectedIndex != index){
              if (index == 0) {
                Navigator.of(context).pushNamed('/home');
              } else if (index == 1) {
                NAlertDialog(
                  content: Cart(),
                  blur: 2,
                ).show(context, transitionType: DialogTransitionType.Bubble);
              } else if (index == 2) {
                Navigator.of(context).pushNamed('/order-history');
              } else if (index == 3) {
                Navigator.of(context).pushNamed('/loginProfileWrapper');
              } else {
                Navigator.of(context).pushNamed('/home');
              }
            }

          },
        );
      },
    );
  }
}
