import 'package:flutter/material.dart';

import '../ui/404/404_pageNotFound.dart';

class CustomButton extends StatefulWidget {
  String text;
  double width;
  double height;
  Object primary;
  Object onprimary;
  Object icons;
  Function onpress = () {};

  CustomButton(
      {this.text = "cutomize me",
      this.primary,
      this.width = 200,
      this.height = 50,
      this.onpress,
      this.icons,
      this.onprimary});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
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
              onSurface: Colors.grey,
              textStyle: TextStyle(
                // color: Colors.blue,
                fontSize: 16,
              ),
              shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: widget.primary)))),
          onPressed: () {
            print('Pressed');
          },
        ));
  }
}
