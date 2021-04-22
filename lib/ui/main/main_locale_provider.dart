import 'dart:io';

import 'package:flutter/material.dart';
import '../../utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:finalproject/models/CustomUser.dart';
import 'package:finalproject/models/Store.dart';
import 'package:finalproject/models/Product.dart';
import "package:finalproject/services/database.dart";
import "package:finalproject/services/storage_service.dart";
import "package:finalproject/services/products_service.dart";

const String APP_FIRST_OPEN = "APP_FIRST_OPEN";
const String APP_SAVED_LOCALE = "APP_SAVED_LOCALE";

class MainLocaleProvider extends ChangeNotifier {
  Locale applicationLocale;
  CustomUser user;

  MainLocaleProvider() {
    loadSavedLocale();
  }

  Future updateProduct(Product product, File img, String productId) async {
    if (img != null) {
      product.image = await StorageService().uploadImage(img, user.uid);
    }

    await ProductsService().updateProduct(product, productId);
  }

  Future addProduct(Product product, File img) async {
    product.storeId = user.uid;
    product.image = await StorageService().uploadImage(img, user.uid);
    await ProductsService().addProduct(product);
  }

  createStore(Store store) async {
    store.ownerId = user.uid;
    CustomUser newData =
        await DatabaseService(uid: user.uid).createStore(store);
    updateUser(newData);
  }

  updateAsingleProperty({property, newValue}) async {
    CustomUser newData = await DatabaseService(uid: user.uid)
        .updateAsingleProperty(property: property, newValue: newValue);
    updateUser(newData);
  }

  updateUser(u) {
    user = u;
    notifyListeners();
  }

  signOut() {
    user = null;
    notifyListeners();
  }

  updateApplicationLocale(String languageCode) {
    Locale newLocale = AppLocalizations.supportedLocales
        .firstWhere((locale) => locale.languageCode == languageCode);
    saveApplicationLocale(languageCode);
    applicationLocale = newLocale;
    notifyListeners();
  }

  void loadSavedLocale() async {
    String languageCode = await getSelectedLocale();
    Locale savedLocale = AppLocalizations.supportedLocales
        .firstWhere((locale) => locale.languageCode == languageCode);
    if (savedLocale != null) {
      updateApplicationLocale(languageCode);
    }
  }

  Future<String> getSelectedLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(APP_SAVED_LOCALE) ?? "ar"; //default language is ar
  }

  void saveApplicationLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(APP_SAVED_LOCALE, languageCode);
  }
}
