import 'package:finalproject/models/CustomUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardBottomBar extends StatefulWidget {
  const DashboardBottomBar({Key key}) : super(key: key);
  @override
  _DashboardBottomBarState createState() => _DashboardBottomBarState();
}

class _DashboardBottomBarState extends State<DashboardBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/store-inventory', (Route<dynamic> route) => false);
      } else if (index == 1) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/req-msgs', (Route<dynamic> route) => false);
      } else if (index == 2) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/store-info', (Route<dynamic> route) => false);
      } else if (index == 3) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/store-dashboard', (Route<dynamic> route) => false);
      } else {
        Navigator.pushNamed(context, "/store-dashboard");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          label: 'Inventory',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Request Msg',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: "Info",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: "Dashboard",
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).accentColor,
      backgroundColor: Color(0xff283148),
      unselectedItemColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }
}
