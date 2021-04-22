import "package:flutter/material.dart";
import "../../models/CustomUser.dart";
import "package:provider/provider.dart";
import "login/Login_Widget.dart";
import "profile/Profile_Widget.dart";
import "profile/Profile_unauth_Widget.dart";
import "package:finalproject/ui/main/main_locale_provider.dart";

class LoginProfileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MainLocaleProvider>(context).user;
    return user == null ? ProfileUnAuth() : Profile();
  }
}
