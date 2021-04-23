import 'package:flutter/material.dart';

class CustomLightTextFormField extends StatefulWidget {
  String hintText;
  bool obscureText;
  double width;
  Function onChanged = () {};
  Function onSuffixIconPress = () {};
  bool passwordVisible = false;
  Function validator;
  int maxLines;
  bool enabled, enableInteractiveSelection;
  String initialValue;

  CustomLightTextFormField(
      {this.hintText,
      this.initialValue = "",
      this.obscureText = false,
      this.width = 400,
      this.onChanged,
      this.onSuffixIconPress,
      this.validator,
      this.maxLines = 1,
      this.enableInteractiveSelection = true,
      this.enabled = true});

  @override
  _CustomLightTextFormFieldState createState() =>
      _CustomLightTextFormFieldState();
}

class _CustomLightTextFormFieldState extends State<CustomLightTextFormField> {
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
      child: TextFormField(
        enableInteractiveSelection: widget.enableInteractiveSelection,
        initialValue: widget.initialValue,
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        validator: widget.validator,
        // style: TextStyle(color: Theme.of(context).buttonColor),
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
          fillColor: Colors.white,
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
