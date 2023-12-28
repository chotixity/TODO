import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void gotoTab(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
