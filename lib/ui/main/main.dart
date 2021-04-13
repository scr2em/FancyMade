import 'package:finalproject/ui/auth/profile/Profile_Widget.dart';
import 'package:finalproject/ui/checkout/checkoutSuccessScreen.dart';
import 'package:finalproject/ui/order/order.dart';
import 'package:finalproject/ui/product/productScreen.dart';
import 'package:finalproject/ui/store/store-dashboard/dashboard.dart';
import 'package:finalproject/ui/store/store-dashboard/inventory.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

//Custom Widgets
import '../../sharedWidgets/CustomBottomBar.dart';
import '../../sharedWidgets/CustomAppBar.dart';

//UI
import '../auth/login/Login_Widget.dart';
import '../auth/signup/Signup_Widget.dart';
import "../home/Home_Widget.dart";
import "../auth/LoginProfileWrapper.dart";
import "../checkout/checkoutSuccessScreen.dart";
import "../store/CreateStoreForm.dart";
import "../auth/profile/Info/Info_Widget.dart";
import "../auth/profile/Settings/Settings_Widget.dart";

//Main Provider
import 'main_provider.dart';
import 'main_locale_provider.dart';

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
    return ChangeNotifierProvider<MainLocaleProvider>(
      create: (context) => MainLocaleProvider(),
      child: Consumer<MainLocaleProvider>(builder: (context, mainLocaleProvider, child) {
        print(mainLocaleProvider.applicationLocale);
        return StreamProvider<CustomUser>.value(
          value: AuthService().user,
          initialData: null,
          child: MaterialApp(
            locale: mainLocaleProvider.applicationLocale,
            title: "FancyMade",
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: theme,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/signup': (context) => SignupScreen(),
              '/loginProfileWrapper': (context) => LoginProfileWrapper(),
              '/product': (context) => ProductScreen(),
              '/CreateStoreForm': (context) => CreateStoreForm(),
              '/profileInfo': (context) => InfoScreen(),
              '/profileSettings': (context) => SettingsScreen(),
            },
            // home: MyHomePage(title: 'Flutter Demo Home Page1'),
          ),
        );
      }),
    );

  }
}
