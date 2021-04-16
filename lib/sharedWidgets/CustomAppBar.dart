import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  // to customize the height use int instead of kToolbarHeight;
  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(60),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomSearchInput(),
      automaticallyImplyLeading: false,
      // actions: <Widget>[
      //   Ink(
      //     decoration: ShapeDecoration(
      //       color: Theme.of(context).accentColor,
      //       shape: CircleBorder(),
      //     ),
      //     child: IconButton(
      //       icon: const Icon(Icons.shopping_cart),
      //       color: Colors.white,
      //       onPressed: () {},
      //     ),
      //   ),
      // ]
    );
  }
}

class CustomSearchInput extends StatefulWidget {
  @override
  _CustomSearchInputState createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: _controller.clear,
          icon: Icon(Icons.clear),
        ),
        hintText: AppLocalizations.of(context).sw_CustomAppBar_Search,
        fillColor: Theme.of(context).backgroundColor,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onChanged: (value) {
//Do something with the user input.
      },
    );
  }
}
