import 'package:flutter/material.dart';
import '../../utils/shared_preference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String APP_FIRST_OPEN = "APP_FIRST_OPEN";
const String APP_SAVED_LOCALE = "APP_SAVED_LOCALE";

class MainLocaleProvider extends ChangeNotifier {
  Locale applicationLocale;


  MainLocaleProvider() {
    loadSavedLocale();
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