import 'package:finalproject/ui/ContactUs/contactus.dart';
import 'package:finalproject/ui/FAQ/faq.dart';
import 'package:finalproject/ui/Orders/Orders_history.dart';
import 'package:finalproject/ui/checkout/checkout.dart';
import 'package:finalproject/ui/checkout/checkoutSuccessScreen.dart';
import 'package:finalproject/ui/inbox/inboxscreen.dart';
import 'package:finalproject/ui/order/order.dart';
import 'package:finalproject/ui/store/Add%20Prodect/ProductListingScreen.dart';
import 'package:finalproject/ui/store/Add%20Prodect/ProductReviewScreen.dart';
import 'package:finalproject/ui/store/store-dashboard/dashboard.dart';
import 'package:finalproject/ui/store/store-dashboard/inventory.dart';
import 'package:finalproject/ui/store/store-dashboard/req-inbox/inboxscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../utils/theme.dart';
//UI
import '../404/404_pageNotFound.dart';
import "../auth/LoginProfileWrapper.dart";
import '../auth/login/Login_Widget.dart';
import "../auth/profile/Info/Info_Widget.dart";
import "../auth/profile/Settings/Settings_Widget.dart";
import '../auth/signup/Signup_Widget.dart';
import '../checkout/checkoutSuccessScreen.dart';
import "../home/Home_Widget.dart";
import '../order/order.dart';
import '../product/EditProduct.dart';
import '../product/productScreen.dart';
import "../store/CreateStoreForm.dart";
import '../store/Store.dart';
//Main Provider
import '../store/store-dashboard/dashboard.dart';
import '../store/store-dashboard/inventory.dart';
import 'CartProvider.dart';
import 'main_locale_provider.dart';

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
      child: Consumer<MainLocaleProvider>(
          builder: (context, mainLocaleProvider, child) {
        return ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
          child: MaterialApp(
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/profileSettings':
                  // if (settings.name == './signin')
                  return PageTransition(
                    child: SettingsScreen(),
                    type: PageTransitionType.leftToRight,
                    settings: settings,
                    duration: Duration(seconds: 1),
                  );

                  break;
                default:
                  return null;
              }
            },
            locale: mainLocaleProvider.applicationLocale,
            title: "FancyMade",
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: theme,
            themeMode: mainLocaleProvider.applicationTheme,
            darkTheme: darkTheme,
            initialRoute: '/home',
            routes: {
              '/': (context) => HomeScreen(),
              '/signup': (context) => SignupScreen(),
              '/signin': (context) => LoginScreen(),
              '/loginProfileWrapper': (context) => LoginProfileWrapper(),
              '/product': (context) => ProductScreen(),
              '/CreateStoreForm': (context) => CreateStoreForm(),
              '/profileInfo': (context) => InfoScreen(),
              // '/profileSettings': (context) => SettingsScreen(),
              '/store': (context) => StoreScreen(),
              '/order': (context) => Order(),
              '/productlisting': (context) => ProductListing(),
              '/productReview': (context) => ProductReview(),
              '/store-inventory': (context) => StoreInventory(),
              '/checkout': (context) => Checkout(),
              '/checkout-success': (context) => CheckoutSuccessScreen(),
              '/home': (context) => HomeScreen(),
              '/store-dashboard': (context) => StoreDashboard(),
              '/req-msgs': (context) => ReqChatPage(),
              '/contactUs': (context) => ContactUs(),
              '/faq': (context) => FAQ(),
              '/notfound': (context) => PageNotFound(),
              '/order-history': (context) => OrdersHistory(),
              '/editProduct': (context) => EditProduct(),
              '/messages': (context) => ChatPage()
            },

            // home: MyHomePage(title: 'Flutter Demo Home Page1'),
          ),
        );
      }),
    );
  }
}
