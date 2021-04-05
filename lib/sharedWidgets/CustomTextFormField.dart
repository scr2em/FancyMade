import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  bool obscureText;
  double width;
  Function onChanged = () {};
  Function onSuffixIconPress = () {};
  bool passwordVisible = false;

  CustomTextFormField(
      {this.hintText = "Placeholder...",
      this.obscureText = false,
      this.width = 400,
      this.onChanged,
      this.onSuffixIconPress});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  onShowPassword() {
    setState(() {
      widget.passwordVisible = !widget.passwordVisible;
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: widget.width,
      child: TextFormField(
        style: TextStyle(color: Theme.of(context).primaryColor),
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: onShowPassword,
                )
              : widget.passwordVisible
                  ? IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: onShowPassword,
                    )
                  : null,
          hintText: widget.hintText,
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
