import 'package:flutter/material.dart';
import '../model/IrrigationProgramModel/selection_model.dart';

class SelectionModelProvider extends ChangeNotifier {
  SelectionModel _selectionModel = SelectionModel();

  SelectionModel get selectionModel => _selectionModel;

  void updateSelectionModel(SelectionModel newSelectionModel) {
    _selectionModel = newSelectionModel;
    notifyListeners();
  }
}