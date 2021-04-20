import 'package:flutter/material.dart';
import "package:finalproject/models/CustomUser.dart";

class MainProvider extends ChangeNotifier {
  CustomUser user;

  MainProvider();

  updateUser(u){
    user = u;
    notifyListeners();
  }
}
