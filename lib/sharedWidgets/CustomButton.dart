import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final double radiustopright;
  final double radiustopleft;
  final double radiustbotright;
  final double radiusbotleft;
  final double fontsize;
  final Object bordercolor;
  final Object primary;
  final Object onprimary;
  final Object icons;
  Function onpress = () {};
  double elevation;

  CustomButton({this.text = "cutomize me",
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

          onPressed: widget.onpress,
          child: Stack(
            children: [
              Align(alignment: Alignment.centerLeft, child: Icon(widget.icons)),
              Align(
                alignment: Alignment.center,
                child: Text(widget.text),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: widget.primary,
            onPrimary: widget.onprimary,
            elevation: widget.elevation,
            onSurface: Colors.grey,
            textStyle: TextStyle(
              // backgroundColor: Colors.yellow,
              // decorationColor: Colors.black,
              // color: Colors.black,
              fontSize: widget.fontsize,
            ),
            shape: (RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(widget.radiustopright),
                  topLeft: Radius.circular(widget.radiustopleft),
                  bottomRight: Radius.circular(widget.radiustbotright),
                  bottomLeft: Radius.circular(widget.radiusbotleft)),
              side: BorderSide(color: widget.bordercolor),
            )),
          ),
        ));
  }
}
