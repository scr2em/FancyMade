import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hintText;
  bool obscureText;
  double width;
  double height;
  double bordersize;
  Function onChanged = () {};
  Function onSuffixIconPress = () {};
  bool passwordVisible = false;
  Function validator;
  int maxLines;
  bool enabled;

  CustomTextFormField(
      {this.hintText,
      this.obscureText = false,
      this.width = 400,
      this.height,
      this.bordersize = 10.0,
      this.onChanged,
      this.onSuffixIconPress,
      this.validator,
      this.maxLines = 1,
      this.enabled = true});

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
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        validator: widget.validator,
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
          labelText: widget.hintText,
          fillColor: Theme.of(context).backgroundColor,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.bordersize)),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).accentColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(widget.bordersize)),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
