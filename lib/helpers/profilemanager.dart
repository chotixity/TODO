import 'package:flutter/material.dart';

class ProfileManager extends ChangeNotifier {
  bool _darkMode = false;
  bool get getdarkMode => _darkMode;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }
}
