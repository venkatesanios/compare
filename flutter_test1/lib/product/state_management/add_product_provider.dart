import 'package:flutter/material.dart';

class AddProductProvider extends ChangeNotifier {
  String initialModel = '--/--';
  String initialcategory = '--/--';
  String initialProductstatus = '--/--';
  void editModel(String value) {
    initialModel = value;
    notifyListeners();
  }

  void editcategory(String value) {
    initialcategory = value;
    notifyListeners();
  }

  void editProductstatus(String value) {
    initialProductstatus = value;
    notifyListeners();
  }
}
