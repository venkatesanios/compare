import 'package:flutter/material.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';
import '../../utils/widgets/SCustomWidgets/custom_alert_dialog.dart';
import '../../utils/widgets/SCustomWidgets/custom_train_widget.dart';
import 'alert.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
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
  String filterselection = "Central filter";
  String fertselection = "Central fert";
  @override
  Widget build(BuildContext context) {
    final sequenceProvider =
        Provider.of<IrrigationProgramMainProvider>(context);
    List temporarySelection = List.filled(itemList.length, false);

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                    child: Text(
                      'MAIN VALVE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: [
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text(itemList[i].name),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Center(
                    child: Text(
                      'PUMP SELECTION',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text('Pump${i + 1}'),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                      child: Text(
                    'Fertilizer Selection',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                // ListTile(
                //   title: Text('Fertilizer chanel'),
                //   trailing: DropdownButton(
                //     items: ['Central fert', 'Local fert'].map((String items) {
                //       return DropdownMenuItem(
                //         value: items,
                //         child: Container(
                //             padding: const EdgeInsets.only(left: 10),
                //             child: Text(items)),
                //       );
                //     }).toList(),
                //     onChanged: (value) {
                //       setState(() {
                //         fertselection = value!;
                //       });
                //     },
                //     value: 'Central fert',
                //   ),
                // ),
                 ListTile(
                  title: Text('central fertilizer '),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text('Pump${i+1}'),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Local fertilizer '),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text('Pump${i+1}'),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                      child: Text(
                        'Filter Selection',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ),
                 ListTile(
                  title: Text('Central Filter '),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text('Pump${i+1}'),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
Divider(),
                ListTile(
                  title: Text('Local Filter '),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: <Widget>[
                      for (var i = 0; i < itemList.length; i++)
                        ChoiceChip(
                          label: Text('Pump${i+1}'),
                          selected: itemList[i].selection,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(i);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),

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

    // return '${_selectedTime.hour}:${_selectedTime.minute}';
  }
}
