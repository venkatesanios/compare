import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';

class SelectionScreen1 extends StatefulWidget {
  const SelectionScreen1({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen1> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  final Map<int, GlobalKey> itemKeys = {};
  List<ItemModel> itemList = [
    ItemModel(srno: '1', id: 'v1', name: 'valve1valve1valve1', selection: true),
    ItemModel(srno: '2', id: 'v2', name: 'valve2', selection: false),
    ItemModel(srno: '3', id: 'v3', name: 'valve3', selection: true),
    ItemModel(srno: '4', id: 'v4', name: 'valve4', selection: false),
    ItemModel(srno: '5', id: 'v1', name: 'valve5', selection: true),
    ItemModel(srno: '6', id: 'v2', name: 'valve6', selection: false),
    ItemModel(srno: '7', id: 'v3', name: 'valve7', selection: true),
    ItemModel(srno: '8', id: 'v4', name: 'valve8', selection: false),
    ItemModel(srno: '9', id: 'v4', name: 'valve9', selection: false),
  ];
  String filterSelection = "Central filter";
  String fertSelection = "Central fert";

  @override
  Widget build(BuildContext context) {
    final sequenceProvider =
    Provider.of<IrrigationProgramMainProvider>(context);
    List temporarySelection = List.filled(itemList.length, false);

    Widget buildCard(String title, String subtitle) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                if (title != null)
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (subtitle != null) ListTile(title: Text(subtitle)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: List.generate(itemList.length, (index) {
                      return ChoiceChip(
                        label: Text('Pump${index + 1}'),
                        selected: itemList[index].selection,
                        selectedColor: Colors.amber,
                        onSelected: (bool selected) {
                          if (title == 'MAIN VALVE') {
                            selectItem(index);
                          } else {
                            selectPump(index);
                          }
                        },
                      );
                    }),
                  ),
                ),
                if (subtitle != null) const Divider(),
              ],
            ),
          ),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 10),
        buildCard('MAIN VALVE', ''),
        const SizedBox(height: 10),
        buildCard('PUMP SELECTION', ''),
        const SizedBox(height: 10),
        buildCard('Fertilizer Selection', 'Central Fertilizer'),
        buildCard('', 'Local Fertilizer'),
        const SizedBox(height: 10),
        buildCard('Filter Selection', 'Central Filter'),
        buildCard('', 'Local Filter'),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
      ],
    );
  }

  void selectItem(int index) {
    setState(() {
      itemList[index].selection = !itemList[index].selection;
    });
  }

  void selectPump(int index) {
    setState(() {
      itemList[index].selection = !itemList[index].selection;
    });
  }

  Future<String> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      _selectedTime = picked;
    }

    final hour = _selectedTime.hour.toString().padLeft(2, '0');
    final minute = _selectedTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

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
}
