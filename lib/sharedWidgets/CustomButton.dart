import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String text;
  double width;
  double height;
  double radiustopright;
  double radiustopleft;
  double radiustbotright;
  double radiusbotleft;
  double fontsize;
  Object bordercolor;
  Object primary;
  Object onprimary;
  Object icons;
  Function onpress = () {};
  double elevation;

  CustomButton(
      {this.text = "cutomize me",
      this.primary,
      this.bordercolor = Colors.transparent,
      this.width = 200,
      this.height = 50,
      this.radiustopright = 10,
      this.radiustopleft = 10,
      this.radiustbotright = 10,
      this.radiusbotleft = 10,
      this.fontsize = 16,
      // @required
      this.onpress,
      this.icons,
      this.onprimary,
      this.elevation = 2});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(

            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft, child: Icon(widget.icons)),
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.text),
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: widget.primary,
              elevation: widget.elevation,
              onPrimary: widget.onprimary,
              onSurface: Colors.grey,
              textStyle: TextStyle(
                // color: Colors.blue,
                fontSize: 16,
              ),
              shape: (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: widget.primary),
              )),
            ),
            onPressed: widget.onpress));
  }
}
