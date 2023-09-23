import 'package:flutter/material.dart';
import 'package:flutter_test1/dealar_definition/dealer_model.dart';

class DealerViewModel extends ChangeNotifier {
  String? _title;
  String? _description;
  String? _value;
  String? _valuetype;

  final dealerdefinition = DealerModel(
      title: '_title',
      description: '_description',
      value: '_value',
      valuetype: '_valuetype');
  // final dealerdefinition = Dealerdefinition(
  //   general: List.empty(),
  //   fertilizer: List.empty(),
  //   valve: List.empty(),
  //   memory: List.empty(),
  // );

  String get title => _title ?? dealerdefinition.title;
  String get description => _description ?? dealerdefinition.description;
  String get value => _value ?? dealerdefinition.value;
  String get valuetype => _valuetype ?? dealerdefinition.valuetype;

  void updatetitle(String title) {
    _title = title;
    notifyListeners();
  }

  void updatedescription(String description) {
    _description = description;
    notifyListeners();
  }

  void updatevalue(String value) {
    _value = value;
    notifyListeners();
  }

  void updatevaluetype(String valuetype) {
    _valuetype = valuetype;
    notifyListeners();
  }

  void savedealerdefinition() {
    print('title:$_title');
    print('description:$_description');
    print('value:$_value');
    print('valuetype:$_valuetype');
  }
}
