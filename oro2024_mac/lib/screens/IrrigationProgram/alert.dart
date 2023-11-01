import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemModel {
  final String srno;
  final String id;
  final String name;
  bool selection;

  ItemModel({
    required this.srno,
    required this.id,
    required this.name,
    required this.selection,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      srno: json['srno'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      selection: json['selection'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'srno': srno,
      'id': id,
      'name': name,
      'selection': selection,
    };
  }

  void updateSelection(bool newSelection) {
    selection = newSelection;
  }
}

class SelectedListProvider with ChangeNotifier {
  List<ItemModel> _selectedList = [];

  List<ItemModel> get selectedList => _selectedList;

  void updateSelectedList(List<ItemModel> newList) {
    _selectedList = newList;
    notifyListeners();
  }
}

class AlertDialogHelper {
  static void showAlert1(BuildContext context, String title, String message, List<ItemModel> itemlist) {
    List<bool> selectedItems = List.filled(itemlist.length, false);
    bool selectAll = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(title),
              content: Container(
                width: double.maxFinite,
                height: 200,
                child: ListView.builder(
                  itemCount: itemlist.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      value: selectedItems[index],
                      title: Text(itemlist[index].name),
                      onChanged: (value) {
                        setState(() {
                          selectedItems[index] = value!;
                          selectAll = selectedItems.every((item) => item);
                        });
                      },
                    );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    List<ItemModel> selectedList = getSelectedItems(itemlist, selectedItems);
                    Provider.of<SelectedListProvider>(context, listen: false).updateSelectedList(selectedList);
                    Navigator.of(context).pop(selectedList);
                  },
                  child: Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (selectAll) {
                        selectedItems = List.filled(itemlist.length, false);
                        itemlist.forEach((item) {
                          item.updateSelection(false);
                        });
                      } else {
                        selectedItems = List.filled(itemlist.length, true);
                        itemlist.forEach((item) {
                          item.updateSelection(true);
                        });
                      }
                      selectAll = !selectAll;
                    });
                  },
                  child: Text(selectAll ? 'Deselect All' : 'Select All'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  static List<ItemModel> getSelectedItems(List<ItemModel> itemlist, List<bool> selectedItems) {
    List<ItemModel> selectedList = [];
    for (int i = 0; i < selectedItems.length; i++) {
      if (selectedItems[i]) {
        itemlist[i].updateSelection(true);
        selectedList.add(itemlist[i]);
      }
    }
    return selectedList;
  }
}

