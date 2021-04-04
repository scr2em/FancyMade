import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//Custom Widgets
import '../../sharedWidgets/CustomBottomBar.dart';
import '../../sharedWidgets/CustomAppBar.dart';

//UI
import '../auth/loginScreen/Login_Widget.dart';
import '../auth/signupScreen/Signup_Widget.dart';

//Main Provider
import 'main_provider.dart';

//base
import '../../base/base_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainProvider>(
        model: MainProvider(),
        builder: (context, mainProvider, _) {
          return MaterialApp(
            title: "final project",
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primaryColor: Color(0xff25242A),
              accentColor: Color(0xffEB8038),
              backgroundColor: Color(0xffEEEEEE),
            ),
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => FirstScreen(),
              // When navigating to the "/second" route, build the SecondScreen widget.
              '/second': (context) => SecondScreen(),
            },
            // home: MyHomePage(title: 'Flutter Demo Home Page1'),
          );
        });
  }
}
