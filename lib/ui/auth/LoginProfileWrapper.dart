import "package:flutter/material.dart";
import "../../models/CustomUser.dart";
import "package:provider/provider.dart";
import "loginScreen/Login_Widget.dart";
import "profileScreen/Profile_Widget.dart";

class LoginProfileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    return user == null ? LoginScreen() : Profile();
  }
}
