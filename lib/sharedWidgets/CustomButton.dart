import 'package:flutter/material.dart';

import '404_pageNotFound.dart';

class Custombuttons extends StatefulWidget {
  // Custombuttons({Key:key}):

  Custombuttons({@required this.onPressed});

  final GestureTapCallback onPressed;
  _CustombuttonsState createState() => _CustombuttonsState();
}

class _CustombuttonsState extends State<Custombuttons> {
  onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PageNotFound()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.greenAccent,
      splashColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.face,
              color: Colors.amber,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Tap this!',
              maxLines: 1,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
