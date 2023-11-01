// main.dart
 import 'dart:async';
 import 'package:flutter/material.dart';


// This widget is reusable
class MultiSelection extends StatefulWidget {
  final List<String> items;

  const MultiSelection(
      {Key? key, required this.items,})
      : super(key: key);
  @override
  State<MultiSelection> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelection> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

  /// This function is triggered when a checkbox is checked or unchecked
  /// this function get two paramerers string itemvalue of array elements and isselected value
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      isSelected
          ? _selectedItems.add(itemValue)
          : _selectedItems.remove(itemValue);
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    // alertanimation(context, ['No item Select']);
  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Duplicate Program'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
