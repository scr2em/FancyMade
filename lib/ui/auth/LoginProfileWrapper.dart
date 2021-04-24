import "package:finalproject/ui/main/main_locale_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "profile/Profile_Widget.dart";
import "profile/Profile_unauth_Widget.dart";

class LoginProfileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MainLocaleProvider>(context).user;
    return user == null ? ProfileUnAuth() : Profile();
  }
}
