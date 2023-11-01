import 'package:flutter/material.dart';

class AlertDialogHelper {
  static void showAlert1(BuildContext context, String title, String message, List<String> itemlist) {
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
                      title: Text(itemlist[index]),
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
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (selectAll) {
                        selectedItems = List.filled(itemlist.length, false);
                      } else {
                        selectedItems = List.filled(itemlist.length, true);
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
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
 }

