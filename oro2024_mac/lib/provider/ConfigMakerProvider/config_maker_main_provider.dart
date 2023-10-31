import 'package:flutter/cupertino.dart';

class ConfigMakerMainProvider extends ChangeNotifier {
  int _selectedTabIndex = 0;

  int get selectedTabIndex => _selectedTabIndex;

  void updateTabIndex(int newIndex) {
    _selectedTabIndex = newIndex;
    notifyListeners();
  }
}