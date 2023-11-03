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
  @override
  Widget build(BuildContext context) {
    final sequenceProvider =
        Provider.of<IrrigationProgramMainProvider>(context);
    final Map<int, GlobalKey> itemKeys = {};
    List<ItemModel> itemList = [
      ItemModel(srno: '1', id: 'v1', name: 'valve1', selection: true),
      ItemModel(srno: '2', id: 'v2', name: 'valve2', selection: false),
      ItemModel(srno: '3', id: 'v3', name: 'valve3', selection: true),
      ItemModel(srno: '4', id: 'v4', name: 'valve4', selection: false),
    ];
   List temporarySelection = List.filled(itemList.length, false);
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          child: IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              AlertDialogHelper.showAlert1(
                context,
                'Select Items',
                'Select items from the list',
                itemList,
              );
              // MyAppm();
            },
          ),
        ),
        Container(
          height: 70, // Set the height of the inner list
          child: Scrollbar(
            trackVisibility: true,
            child: ListView.builder(
              controller: ScrollController(),
              scrollDirection: Axis.horizontal,
              itemCount: itemList.length,
              itemBuilder: (context, innerIndex) {
                ItemModel currentItem = itemList[innerIndex];

                return Container(
                   margin: const EdgeInsets.all(4),
                  child: Center(
                    child: ChoiceChip(
                      label: Text(
                          'Choice $innerIndex'), // Replace with your label text
                      selected: currentItem
                          .selection, // Set based on the selection of the current item
                      onSelected: (bool selected) {
                        print('selected:$selected');
                        setState(() {
                          temporarySelection[innerIndex] = selected;
                          // currentItem.updateSelection(selected);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
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
                    'Differential Pressure',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                CustomSwitchTile(
                    subtitle: 'Enable/disable diff pressure',
                    value: false,
                    onChanged: (newValue) {}),
                ListTile(
                  title: Text('Pressure Values'),
                  trailing: Container(
                    height: 40,
                    width: 100,
                    child: TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      initialValue: '0.0bar',
                      showCursor: true,
                      decoration: InputDecoration(hintText: '0.0bar'),
                      onChanged: (value) {
                        validator:
                        (value) {};
                      },
                    ),
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
                ListTile(
                  title: Text('Fertilizer chanel'),
                  trailing: DropdownButton(
                    items: ['Central fert', 'Local fert'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {});
                    },
                    value: 'Central fert',
                  ),
                ),
                ListTile(
                  title: Text('central fertilizer '),
                  trailing: DropdownButton(
                    items: ['1', '2'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {});
                    },
                    value: '1',
                  ),
                ),
                ListTile(
                  title: Text('Local fertilizer '),
                  trailing: DropdownButton(
                    items: ['1', '2'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {});
                    },
                    value: '1',
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
                  title: Text('central filter '),
                  trailing: DropdownButton(
                    items: ['1', '2'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {});
                    },
                    value: '1',
                  ),
                ),
                ListTile(
                  title: Text('Local filter '),
                  trailing: DropdownButton(
                    items: ['1', '2'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {});
                    },
                    value: '1',
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(2, (index) {
            final linesMap = sequenceProvider.lines?.asMap();
            if (linesMap != null && index < linesMap.length) {
              final entry = linesMap.entries.elementAt(index);
              final lineIndex = entry.key;
              final line = entry.value;
              final lineName = ['Main Valve', 'Pump'];

              return Column(
                children: [
                  CustomTrainWidget(
                    title: lineName[index],
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(line.value.length, (index) {
                            final valvesMap = line.value.asMap();
                            if (index < valvesMap.length) {
                              final valveEntry =
                                  valvesMap.entries.elementAt(index);
                              final valveIndex = valveEntry.key;
                              final valve = valveEntry.value;

                              return Row(
                                children: [
                                  InkWell(
                                    child: Card(
                                      shape: const CircleBorder(),
                                      elevation: 2,
                                      borderOnForeground: true,
                                      semanticContainer: true,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: sequenceProvider
                                                .isSelected(valve, lineIndex)
                                            ? Theme.of(context)
                                                .colorScheme
                                                .secondary
                                            : Colors.white,
                                        child: Center(
                                          child: Text(
                                            '$valve',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      sequenceProvider.valveSelection(
                                          valve, lineIndex);
                                      if (sequenceProvider.isRecentlySelected) {
                                        showAdaptiveDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomAlertDialog(
                                              title: 'Warning',
                                              content:
                                                  "Valve $valve of ${line.name} is recently added and it cannot be added again next to it",
                                              actions: [
                                                TextButton(
                                                  child: const Text("OK"),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  )
                                ],
                              );
                            } else {
                              return const Text('No Valves');
                            }
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            } else {
              return const Text('No Name');
            }
          }),
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
                    'Backwash ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
                ListTile(
                  title: Text('Backwash Duration'),
                  trailing: InkWell(
                    child: Text(
                      '00:00',
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () async {
                      String time = await _selectTime(context);
                      setState(() {});
                    },
                  ),
                ),
                Card(
                    child: ListTile(
                  title: Text('Backwash interval '),
                  trailing: InkWell(
                    child: Text(
                      '00:00',
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () async {
                      String time = await _selectTime(context);
                      setState(() {});
                    },
                  ),
                )),
                ListTile(
                    title: Text('No.of Backwash filters'), trailing: Text('2')),
              ],
            ),
          ),
        ),
      ],
    );
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
