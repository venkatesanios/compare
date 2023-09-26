import 'package:flutter/material.dart';

class ItemModel {
  final String title;
  final String description;
  String value;
  final String valuetype;
  final List<dynamic> dropdownlist;

  ItemModel({
    required this.title,
    required this.description,
    required this.value,
    required this.valuetype,
    required this.dropdownlist,
  });

  void setValue(String newValue) {
    value = newValue;
  }
}

class TabData {
  final String tabName;
  final List<ItemModel> items;

  TabData({
    required this.tabName,
    required this.items,
  });
}

class TabViewModel extends ChangeNotifier {
  List<TabData> tabs = [];

  void saveData() {
    for (final tab in tabs) {
      for (final item in tab.items) {
        item.value = 'New Value';
      }
    }
    notifyListeners();
  }

  void saveData1() {
    for (final tab in tabs) {
      for (final item in tab.items) {
        item.setValue('New Value');
      }
    }
    notifyListeners();
  }

  void sendData() {
    for (final tab in tabs) {
      for (final item in tab.items) {
        print('Sending data: ${item.value}');
      }
    }
  }
}
