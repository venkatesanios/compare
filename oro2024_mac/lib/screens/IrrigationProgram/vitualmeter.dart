import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:oro2024_mac/model/IrrigationProgramModel/selection_model.dart';

import '../../utils/constants/custom_switch.dart';

class VirtualwaterMeterUI extends StatefulWidget {
  const VirtualwaterMeterUI({Key? key});

  @override
  State<VirtualwaterMeterUI> createState() => _VirtualwaterMeterUIState();
}

class _VirtualwaterMeterUIState extends State<VirtualwaterMeterUI>
    with TickerProviderStateMixin {
  dynamic jsondata;
  TimeOfDay _selectedTime = TimeOfDay.now();
  List<String> conditionhdrlist = [
    'ID',
    'Name',
    'Function',
    'Formula',
    'Protection Limit m3',
    'Object',
    'Action',
    'Radio m3/pulse',
  ];
  List<String> formulaEditlist = [
    'ID',
    'Name',
    'Location',
    '+',
    '-',
  ];
  List<Map<String, dynamic>> formulajson = [
    {
      'ID': 'wm1',
      'Name': 'wm1 water',
      'Location': 'line1',
      '+': true,
      '-': false
    },
    {
      'ID': 'wm2',
      'Name': 'wm2 water',
      'Location': 'line1',
      '+': true,
      '-': false
    },
    {
      'ID': 'wm3',
      'Name': 'wm3 water',
      'Location': 'line3',
      '+': false,
      '-': false
    },
    {
      'ID': 'wm4',
      'Name': 'wm4 water',
      'Location': 'line1',
      '+': true,
      '-': true
    },
    {
      'ID': 'wm5',
      'Name': 'wm5 water',
      'Location': 'line1',
      '+': true,
      '-': true
    }
  ];
  String usedprogramdropdownstr = '';
  List? usedprogramdropdownlist = [];
  String usedprogramdropdownstr2 = '';
  // ConditionModel _conditionModel = SelectionModel();
  String hint = 'Enter Flow Values';
  String dropdowntitle = '';
  String valueforwhentrue = '';
  int Selectindexrow = 0;
  String programstr = '';
  String zonestr = '';

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  // Future<void> fetchData() async {
  //
  //   Map<String, Object> body = {"userId": '8', "controllerId": '1'};
  //   final response = await HttpService().postRequest("getUserPlanningConditionLibrary", body);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       var jsondata1 = jsonDecode(response.body);
  //       _conditionModel = ConditionModel.fromJson(jsondata1);
  //       _conditionModel.data!.dropdown!.insert(0, '');
  //     });
  //   } else {
  //     //_showSnackBar(response.body);
  //   }
  // }

  @override
  void checklistdropdown() async {
    usedprogramdropdownlist = [];
    dropdowntitle = '';
    hint = '';

    // if (usedprogramdropdownstr.contains('Program'))  {
    //   usedprogramdropdownlist = _conditionModel.data!.program;
    //   dropdowntitle = 'Program';
    //   hint = 'Programs';
    // }
    // if (usedprogramdropdownstr.contains('Contact')) {
    //   usedprogramdropdownlist = _conditionModel.data!.contact;
    //   dropdowntitle = 'Contact';
    //   hint = 'Contacts';
    // }
    // if (usedprogramdropdownstr.contains('Sensor')) {
    //   usedprogramdropdownlist = _conditionModel.data!.analogSensor;
    //   dropdowntitle = 'Sensor';
    //   hint = 'Values';
    // }
    // if (usedprogramdropdownstr.contains('Water')) {
    //   usedprogramdropdownlist = _conditionModel.data!.waterMeter;
    //   dropdowntitle = 'Water Meter';
    //   hint = 'Flow';
    // }
    // if (usedprogramdropdownstr.contains('Conbined')) {
    //   usedprogramdropdownlist = _conditionModel.data!.waterMeter;
    //   dropdowntitle = 'Expression';
    //   hint = 'Expression';
    // }
    if (usedprogramdropdownlist!.isNotEmpty) {
      if (usedprogramdropdownstr2 == '') {
        usedprogramdropdownstr2 = usedprogramdropdownstr2 == ''
            ? '${usedprogramdropdownlist?[0].id} (${usedprogramdropdownlist?[0].name})'
            : usedprogramdropdownstr2;
      } else {
        usedprogramdropdownstr2 =
            '${usedprogramdropdownlist?[0].id} (${usedprogramdropdownlist?[0].name})';
      }
    }
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

  Widget build(BuildContext context) {
    if (conditionhdrlist == null) {
      return Center(
          child:
              CircularProgressIndicator()); // Or handle the null case in a way that makes sense for your application
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Vitual Water Meter'),
            backgroundColor: const Color.fromARGB(255, 31, 164, 231),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      height: double.infinity,
                      width: 1100,
                      child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 580,
                          columns: [
                            for (int i = 0; i < conditionhdrlist.length; i++)
                              DataColumn2(
                                label: Center(
                                    child: Text(
                                  conditionhdrlist[i].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                )),
                              ),
                          ],
                          rows: List<DataRow>.generate(
                              conditionhdrlist.length,
                              (index) => DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) {
                                      if (index == Selectindexrow) {
                                        return Colors.blue.withOpacity(
                                            0.5); // Selected row color
                                      }
                                      return Color.fromARGB(0, 176, 35, 35);
                                    }),
                                    cells: [
                                      for (int i = 0;
                                          i < conditionhdrlist.length;
                                          i++)
                                        if ((conditionhdrlist[i] ==
                                                'Function') ||
                                            (conditionhdrlist[i] == 'Action'))
                                          DataCell(
                                            onTap: () {
                                              setState(() {
                                                Selectindexrow = index;
                                              });
                                            },
                                            DropdownButton(
                                              items: conditionhdrlist
                                                  .map((String? items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        items!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 8.6),
                                                      )),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  usedprogramdropdownstr =
                                                      value.toString();
                                                  checklistdropdown();
                                                  //   print(jsonEncode(_conditionModel.data!.dropdown));
                                                });
                                              },
                                              value: usedprogramdropdownstr ==
                                                      ''
                                                  ? conditionhdrlist[i].isEmpty
                                                      ? (conditionhdrlist[0])
                                                      : conditionhdrlist[i]
                                                  : usedprogramdropdownstr,
                                            ),
                                          )
                                        else
                                          DataCell(onTap: () {
                                            setState(() {
                                              Selectindexrow = index;
                                            });
                                          },
                                              Center(
                                                  child: InkWell(
                                                child: (conditionhdrlist[i] !=
                                                        'ID')
                                                    ? Text(
                                                        '${conditionhdrlist[i]}',
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    : Text('${index + 1}'),
                                              )))
                                    ],
                                    //                          onSelectChanged: (isSelected) {
                                    //    print('Row $index selected: $isSelected');
                                    // },
                                  )))),
                ),
              ),
              //TODO: Formula Edit
              Flexible(
                  child: Padding(
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
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: double.infinity,
                        color: Colors.amber,
                        child: const Center(
                            child: Text(
                          'Formula Editor',
                        )),
                      ),
                      const Text(''),
                      if (Selectindexrow != null)
                        Flexible(
                          flex: 3,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                height: double.infinity,
                                width: 300,
                                child: DataTable2(
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 80,
                                    columns: [
                                      for (int i = 0;
                                          i < formulaEditlist.length;
                                          i++)
                                        DataColumn2(
                                          label: Center(
                                              child: Text(
                                            formulaEditlist[i].toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                          )),
                                        ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        formulaEditlist.length,
                                        (index) => DataRow(
                                              color: MaterialStateColor
                                                  .resolveWith((states) {

                                                return Color.fromARGB(
                                                    0, 176, 35, 35);
                                              }),
                                              cells: [
                                                for (int i = 0;
                                                    i < formulajson.length;
                                                    i++)
                                                  if ((formulaEditlist[i] ==
                                                      '+'))
                                                    DataCell(
                                                      Checkbox(
                                                        value:
                                                            formulajson[index]
                                                                ['+'],
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            formulajson[index]
                                                                ['+'] = value!;
                                                            formulajson[index]
                                                            ['-'] = !value!;
                                                            // _value = value!;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  else if ((formulaEditlist[
                                                          i] ==
                                                      '-'))
                                                    DataCell(
                                                      Checkbox(
                                                        value:
                                                            formulajson[index]
                                                                ['-'],
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            formulajson[index]
                                                                ['-'] = value!;
                                                            formulajson[index]
                                                            ['+'] = !value!;
                                                            // _value = value!;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  else
                                                    DataCell(
                                                        Center(
                                                            child: InkWell(
                                                          child: (formulaEditlist[
                                                                      i] !=
                                                                  'ID')
                                                              ? Text(
                                                                  '${formulaEditlist[i]}',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              : Text(
                                                                  '${formulajson[index]['ID']}'),
                                                        )))
                                              ],
                                              //                          onSelectChanged: (isSelected) {
                                              //    print('Row $index selected: $isSelected');
                                              // },
                                            )))),
                          ),
                        ),
                      if (usedprogramdropdownlist?.length != 0)
                        Text(dropdowntitle),
                      if (usedprogramdropdownstr2.isNotEmpty) Text('text'),
                      if (usedprogramdropdownstr.contains('Sensor') ||
                          usedprogramdropdownstr.contains('Combined') ||
                          usedprogramdropdownstr.contains('Contact'))
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              initialValue:
                                  "_conditionModel.data!.conditionLibrary![Selectindexrow].dropdownValue",
                              showCursor: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}'))
                              ],
                              decoration: InputDecoration(
                                  hintText: hint, border: OutlineInputBorder()),
                              onChanged: (value) {
                                valueforwhentrue = value;
                              },
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: const Text('Apply Changes'))
                    ],
                  ),
                ),
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              updateconditions();
            },
            tooltip: 'Send',
            child: const Icon(Icons.send),
          ),
        ),
      );
    }
  }

  updateconditions() async {
    // List<Map<String, dynamic>> conditionJson =  _conditionModel.data!.conditionLibrary!.map((condition) => condition.toJson()).toList();
    Map<String, Object> body = {
      "userId": '8',
      "controllerId": "1",
      "condition": "conditionJson",
      "createUser": "1"
    };
    // final response =
    // await HttpService().postRequest("createUserPlanningConditionLibrary", body);
    // final jsonDataresponse = json.decode(response.body);
    // AlertDialogHelper.showAlert(context, '', jsonDataresponse['message']);
    // print("jsonDataresponse:- ${jsonDataresponse['message']} ");
  }
}
