import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:oro2024_mac/model/IrrigationProgramModel/selection_model.dart';
import 'package:oro2024_mac/model/IrrigationProgramModel/virtual_water_meter_model.dart';
import 'package:oro2024_mac/services/http_service.dart';

import '../../utils/constants/custom_switch.dart';

class VirtualwaterMeterUI extends StatefulWidget {
  const VirtualwaterMeterUI({Key? key});

  @override
  State<VirtualwaterMeterUI> createState() => _VirtualwaterMeterUIState();
}

class _VirtualwaterMeterUIState extends State<VirtualwaterMeterUI>
    with TickerProviderStateMixin {
  dynamic jsondata;
  List<String> virtualmeterhdrlist = [
    'Srno',
    'Name',
    'Function',
    'Formula',
    'Protection Limit m3',
    'Object',
    'Action',
    'Radio m3/pulse',
  ];
  List<String> formulaEditlist = [
    'srno',
    'ID',
    'Name',
    'Location',
    '+',
    '-',
  ];
   String actiondropdownstr = '';
  String formulastr = '';
  List<String> usedprogramdropdownlist = [
    '',
    'open',
    'close',
  ];
  String functiondropdownstr = '';
  VirtualWaterMeterModel _virtualWaterMeterModel = VirtualWaterMeterModel();
  String hint = 'Enter Flow Values';
  String dropdowntitle = '';
  String valueforwhentrue = '';
  int Selectindexrow = 0;
  String programstr = '';
  String zonestr = '';
  List<dynamic> virtualmeter = [];

  @override
  void initState() {
    super.initState();
    fetchData();

  }

  Future<void> fetchData() async {
    Map<String, Object> body = {"userId": '15', "controllerId": '1'};
    final response = await HttpService()
        .postRequest("getUserPlanningVirtualWaterMeter", body);
    if (response.statusCode == 200) {
      setState(() {
        var jsondata1 = jsonDecode(response.body);
         _virtualWaterMeterModel = VirtualWaterMeterModel.fromJson(jsondata1);
         virtualmeter = jsondata1['data']['virtualWaterMeter'];
        virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![0]!.formula ?? '');
       });
    } else {
      //_showSnackBar(response.body);
    }
  }

  @override
  void virtualmetercheckbox(String checkstr) async {
 setState(() {
  if(checkstr.isNotEmpty) {
    checkstr = checkstr.trimLeft();
    List<String> virtual_list = checkstr.split(" ");

    for (var j = 0; j < virtualmeter.length; j++) {
      virtualmeter[j]['plus'] = false;
      virtualmeter[j]['minus'] = false;
      for (var i = 0; i < virtual_list.length; i++) {
        if (virtual_list[i].contains('+')) {
         String strid = (virtual_list[i].toString()).replaceAll("+", "");
            if (virtualmeter[j]['id'] == strid) {
            virtualmeter[j]['plus'] = true;
            virtualmeter[j]['minus'] = false;
          }
          // else {
          //   virtualmeter[j]['minus'] = true;
          // }
        }
        else if (virtual_list[i].contains('-')) {
          String strid = (virtual_list[i].toString()).replaceAll("-", "");
           if (virtualmeter[j]['id'] == strid) {
            virtualmeter[j]['minus'] = true;
            virtualmeter[j]['plus'] = false;
          }
         }
       }
    }
  }
  else
    {
      for (var j = 0; j < virtualmeter.length; j++) {
        virtualmeter[j]['plus'] = false;
        virtualmeter[j]['minus'] = false;
      }
    }
 });
  }

  @override
  void checklistdropdown() async {
    usedprogramdropdownlist = [];
    dropdowntitle = '';
    hint = '';
  }

  Widget build(BuildContext context) {
    if (_virtualWaterMeterModel.data == null) {
      return Center(child: CircularProgressIndicator());
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
                            for (int i = 0; i < virtualmeterhdrlist.length; i++)
                              DataColumn2(
                                label: Center(
                                    child: Text(
                                  virtualmeterhdrlist[i].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  softWrap: true,
                                )),
                              ),
                          ],
                          rows: List<DataRow>.generate(
                              _virtualWaterMeterModel.data!.plan!.length,
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
                                          i < virtualmeterhdrlist.length;
                                          i++)
                                        if (virtualmeterhdrlist[i] == 'Function')
                                          DataCell(
                                            onTap: () {
                                              setState(() {
                                                Selectindexrow = index;
                                                virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                              });
                                            },
                                            DropdownButton(
                                              items: usedprogramdropdownlist
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
                                                  functiondropdownstr =
                                                      value.toString();
                                                  _virtualWaterMeterModel.data!.plan![index].function = value;

                                                  //   print(jsonEncode(_conditionModel.data!.dropdown));
                                                });
                                              },
                                              value: _virtualWaterMeterModel.data!.plan![index].function,
                                            ),
                                          )
                                        else if (virtualmeterhdrlist[i] ==
                                                'Action')
                                          DataCell(
                                            onTap: () {
                                              setState(() {
                                                Selectindexrow = index;
                                                virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                              });
                                            },
                                            DropdownButton(
                                              items: usedprogramdropdownlist
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
                                                  actiondropdownstr =
                                                      value.toString();
                                                  _virtualWaterMeterModel.data!.plan![index].action = value;
                                                  });
                                              },
                                              value:  _virtualWaterMeterModel.data!.plan![index].action,
                                            ),
                                          )
                                        else if (virtualmeterhdrlist[i] ==
                                              'Srno')
                                            DataCell(onTap: () {
                                              setState(() {
                                                Selectindexrow = index;
                                                virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                              });
                                            },
                                                Center(
                                                    child: InkWell(
                                                      child: Text(
                                                        '${_virtualWaterMeterModel.data!.plan![index].sNo}',
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    )))

                                          else if (virtualmeterhdrlist[i] ==
                                            'Formula')
                                          DataCell(onTap: () {
                                            setState(() {
                                              Selectindexrow = index;
                                              virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                            });
                                          },
                                              Center(
                                                  child: InkWell(
                                                child: Text(
                                                  '${_virtualWaterMeterModel.data!.plan![index].formula}',
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              )))
                                        else if (virtualmeterhdrlist[i] ==
                                            'Protection Limit m3')
                                          DataCell(onTap: () {
                                            setState(() {
                                              Selectindexrow = index;
                                              virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                            });
                                          },
                                              Center(
                                                  child: InkWell(
                                                child: TextFormField(initialValue: _virtualWaterMeterModel.data!.plan![index].protectionLimit ?? 'Protection',onChanged: (value){
                                                  _virtualWaterMeterModel.data!.plan![index].protectionLimit = value;
                                                },)

                                              )))
                                        else if (virtualmeterhdrlist[i] ==
                                            'Object')
                                          DataCell(onTap: () {
                                            setState(() {
                                              Selectindexrow = index;
                                              virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                            });
                                          },
                                              Center(
                                                  child: InkWell(
                                                child: Text(
                                                  '${_virtualWaterMeterModel.data!.plan![index].object ?? 'object'}',
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              )))
                                        else
                                          DataCell(onTap: () {
                                            setState(() {
                                              Selectindexrow = index;
                                              virtualmetercheckbox(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula!);
                                            });
                                          },
                                              Center(
                                                  child: InkWell(
                                                child:
                                                      Text(
                                                            '${_virtualWaterMeterModel.data!.plan![index].radio ?? 'radio'}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                          ),
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
                      _virtualWaterMeterModel.data!.plan![Selectindexrow].formula!.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(_virtualWaterMeterModel.data!.plan![Selectindexrow].formula.toString()),
                                  )),
                            )
                          : Container(),
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
//:- Heading table column
                                      for (int i = 0;
                                          i < formulaEditlist.length;
                                          i++)
                                        DataColumn2(
                                          label: Center(
                                              child: Text(formulaEditlist[i],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                            softWrap: true,
                                          ),
                                          ),
                                        ),
                                    ],
                                    rows: List<DataRow>.generate(
                                        _virtualWaterMeterModel.data!.virtualWaterMeter!.length,
                                        (index) => DataRow(
                                              color: MaterialStateColor
                                                  .resolveWith((states) {
                                                return Color.fromARGB(
                                                    0, 176, 35, 35);
                                              }),
                                              cells: [
                                                for (int i = 0;
                                                    i < formulaEditlist.length;
                                                    i++)
                                                  if ((formulaEditlist[i] ==
                                                      '+'))
                                                    DataCell(

                                                      Checkbox(
                                                        value: virtualmeter[index]['plus'],
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            virtualmeter[index]['plus'] = value!;
                                                            virtualmeter[index]['minus'] = !value!;
                                                            formulastr =
                                                                generateFormulaString(virtualmeter);
                                                            // virtualmeter[index]['plus'] = value;
                                                            // virtualmeter[index]['minus'] = !value;

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
                                                        virtualmeter[index]['minus'],
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            virtualmeter[index]['minus'] = value!;
                                                            virtualmeter[index]['plus'] = !value!;
                                                            formulastr =
                                                                generateFormulaString(virtualmeter);
                                                            // virtualmeter[index]['plus'] = !value;
                                                            //
                                                            // virtualmeter[index]['minus'] = value;
                                                            // _value = value!;
                                                          });
                                                        },
                                                      ),
                                                    )
                                                  else
                                                    DataCell(Center(
                                                        child: InkWell(
                                                      child: (formulaEditlist[
                                                                  i] !=
                                                              'ID')
                                                          ? Text(
                                                              '${formulaEditlist[i]}',
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            )
                                                          : Text(
                                                              '${_virtualWaterMeterModel.data!.virtualWaterMeter![index].id}'),
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
                      if (functiondropdownstr.isNotEmpty) Text('text'),
                      if (actiondropdownstr.contains('Sensor') ||
                          actiondropdownstr.contains('Combined') ||
                          actiondropdownstr.contains('Contact'))
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
                            setState(() {
                              formulastr = generateFormulaString(virtualmeter!);
                              _virtualWaterMeterModel.data!.plan![Selectindexrow].formula = formulastr;
                            });
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



  String generateFormulaString( List<dynamic>? items)
  {
     List<String> plusList = [];
    List<String> minusList = [];

    for (var item in items!) {
       if (item['plus'] == true) {
        plusList.add(item['id'] ?? '');
      }
      if (item['minus'] == true) {
        minusList.add(item['id'] ?? '');
      }
    }


    String plusString =
        plusList.isNotEmpty ? plusList.map((e) => ' +$e').join('') : '';

    String minusString =
        minusList.isNotEmpty ? minusList.map((e) => ' -$e').join('') : '';
    String mergedString = plusString + '' + minusString;

    if (mergedString.startsWith('+')) {
      mergedString = mergedString.replaceFirst('+', '');
    }
      return mergedString;
  }

  updateconditions() async {
    Map<String, dynamic> virtualJson = _virtualWaterMeterModel.toJson();
    Map<String, Object> body = {
      "userId": '15',
      "controllerId": "1",
      "virtualWaterMeter": virtualJson['data'],
      "createUser": "1"
    };
     final response =
    await HttpService().postRequest("createUserPlanningVirtualWaterMeter", body);
    final jsonDataresponse = json.decode(response.body);
     print("jsonDataresponse:- ${jsonDataresponse['message']} ");
  }
}
