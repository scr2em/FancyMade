import 'package:finalproject/ui/checkout/checkoutSuccessScreen.dart';
import 'package:finalproject/ui/product/productScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//Custom Widgets
import '../../sharedWidgets/CustomBottomBar.dart';
import '../../sharedWidgets/CustomAppBar.dart';

//UI
import '../auth/loginScreen/Login_Widget.dart';
import '../auth/signupScreen/Signup_Widget.dart';
import "../homeScreen/Home_Widget.dart";
import "../auth/LoginProfileWrapper.dart";
import "../checkout/checkoutSuccessScreen.dart";
import "../productScreen/productScreen.dart";

//Main Provider
import 'main_provider.dart';

//base
import '../../base/base_view.dart';
import '../../utils/theme.dart';

//auth
import "../../services/auth_service.dart";

//models
import "../../models/CustomUser.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          title: "final project",
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: theme,
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/signup': (context) => SignupScreen(),
            '/loginProfileWrapper': (context) => LoginProfileWrapper(),
          },
          // home: MyHomePage(title: 'Flutter Demo Home Page1'),
        ));
  }
}
