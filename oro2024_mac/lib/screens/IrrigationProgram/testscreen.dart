import 'package:flutter/material.dart';

class ListItem {
  String displayText;
  bool isSelected;

  ListItem({required this.displayText, this.isSelected = false});
}

class MultipleChoiceChipListExample extends StatefulWidget {
  @override
  _MultipleChoiceChipListExampleState createState() =>
      _MultipleChoiceChipListExampleState();
}

class _MultipleChoiceChipListExampleState
    extends State<MultipleChoiceChipListExample> {
  List<ListItem> items = [
    ListItem(displayText: 'Option 1'),
    ListItem(displayText: 'Option 2'),
    ListItem(displayText: 'Option 3'),
  ];

  void selectItem(int index) {
    setState(() {
      items[index].isSelected = !items[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Choice Chip List Example'),
      ),
      body: Center(
        child: Wrap(
          spacing: 8.0,
          children: <Widget>[
            for (var i = 0; i < items.length; i++)
              ChoiceChip(
                label: Text(items[i].displayText),
                selected: items[i].isSelected,
                selectedColor: Colors.amber,
                onSelected: (bool selected) {
                  selectItem(i);
                },
              ),
          ],
        ),
      ),
    );
  }
}
