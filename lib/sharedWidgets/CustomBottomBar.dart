import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../models/CustomUser.dart";

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
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      } else if (index == 1) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/profile', (Route<dynamic> route) => false);
      } else if (index == 2) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/loginProfileWrapper', (Route<dynamic> route) => false);
      } else {}

      // Navigator.pushNamed(context, '/second');
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wish list',
        ),
        BottomNavigationBarItem(
          icon: user == null
              ? Icon(Icons.login)
              : Icon(Icons.account_circle_rounded),
          label: user == null ? "login" : "Profile",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }
}
