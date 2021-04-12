import 'package:finalproject/ui/auth/profileScreen/Profile_Widget.dart';
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
import '../auth/loginScreen/Login_Widget.dart';
import '../auth/signupScreen/Signup_Widget.dart';
import "../homeScreen/Home_Widget.dart";
import "../auth/LoginProfileWrapper.dart";
import "../checkout/checkoutSuccessScreen.dart";
import "../store/CreateStoreForm.dart";

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
            '/product': (context) => ProductScreen(),
<<<<<<< HEAD
            '/store-dashboard': (context) => StoreDashboard(),
            '/store-inventory': (context) => StoreInventory(),
            '/order': (context) => Order(),
=======
            '/CreateStoreForm': (context) => CreateStoreForm(),
>>>>>>> bf61297153e0c05e5a5585ec843de8336c5efad3
          },
          // home: MyHomePage(title: 'Flutter Demo Home Page1'),
        ));
  }
}
