import "package:flutter/material.dart";

class CustomNavigationButton extends StatelessWidget {
  IconData prefixIcon;
  IconData suffixIcon;
  String text;
  Color backgroundColor;
  double padX = 18;
  double padY = 14.5;
  Color textColor;

  String route;

  CustomNavigationButton({
    this.prefixIcon = Icons.info_outline,
    this.suffixIcon = Icons.arrow_forward_ios,
    this.text = "",
    this.route = "/",
    this.backgroundColor,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padY),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            elevation: MaterialStateProperty.all(0.0),
          ),
          onPressed: () {
            // Respond to button press
            Navigator.of(context).pushNamed(route);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padY),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  prefixIcon,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).accentColor,
                ),
              ],
            ),
          )),
    );
  }
}
