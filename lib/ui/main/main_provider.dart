import 'package:flutter/material.dart';


class MainProvider extends ChangeNotifier {
  bool signedin = true;


  MainProvider();
  changeAuth() {
    signedin = !signedin;
    notifyListeners();
  }

}
