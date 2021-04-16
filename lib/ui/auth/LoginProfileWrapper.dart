import "package:flutter/material.dart";
import "../../models/CustomUser.dart";
import "package:provider/provider.dart";
import "login/Login_Widget.dart";
import "profile/Profile_Widget.dart";
import "profile/Profile_unauth_Widget.dart";
class LoginProfileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    return user == null ? ProfileUnAuth() : Profile();
  }
}
