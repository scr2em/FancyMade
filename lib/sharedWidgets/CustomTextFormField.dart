import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hintText;
  bool obscureText;
  double width;

  CustomTextFormField({
    this.hintText = "Placeholder...",
    this.obscureText = false,
    this.width = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: width,
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).primaryColor),
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: Theme.of(context).backgroundColor,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).accentColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
}
