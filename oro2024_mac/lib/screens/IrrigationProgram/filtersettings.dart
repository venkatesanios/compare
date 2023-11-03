import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/IrrigationProgramModel/filtersettings_model.dart';
import '../../utils/constants/custom_switch.dart';
import '../../utils/constants/http_services.dart';
 
class FilterSettingScreenWidget extends StatefulWidget {
  const FilterSettingScreenWidget({Key? key});

  @override
  State<FilterSettingScreenWidget> createState() => _FilterSettingScreenWidgetState();
}

class _FilterSettingScreenWidgetState extends State<FilterSettingScreenWidget>
     {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // if (constraints.maxWwidgetTypeIdth <= 600) {
          // Render mobile content
          return FilterBckwaskSettingsUI();
        // }
        // else {
          // Render web content
          // return  ConditionwebUI();
        // }
      }
    );
  }
}


class FilterBckwaskSettingsUI extends StatefulWidget {
  const FilterBckwaskSettingsUI({Key? key});

  @override
  State<FilterBckwaskSettingsUI> createState() => _FilterBckwaskSettingsUIState();
}

class _FilterBckwaskSettingsUIState extends State<FilterBckwaskSettingsUI>   {
   TimeOfDay _selectedTime = TimeOfDay.now();
    FiltersettingsModel _FiltersettingsModel = FiltersettingsModel();
   final _formKey = GlobalKey<FormState>();

var jsondata = {
  "code": 200,
  "message": "User Filter Settings listed successfully",
  "data": {
    "filterBackwashing": [
      {"title": "FILTER Operation MODE", "widgetTypeId": 3, "iconCodePoint": "0xe473", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "FLUSHING TIME", "widgetTypeId": 5, "iconCodePoint": "0xe273", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "FLUSHING Interval", "widgetTypeId": 5, "iconCodePoint": "0xe373", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "FLUSHING TIME", "widgetTypeId": 5, "iconCodePoint": "0xe473", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "FLUSHING Interval", "widgetTypeId": 5, "iconCodePoint": "0xe173", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "FILTER Interval", "widgetTypeId": 5, "iconCodePoint": "0xe171", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "PRE TIME", "widgetTypeId": 5, "iconCodePoint": "0xe172", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "POST TIME", "widgetTypeId": 5, "iconCodePoint": "0xe173", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "NO.OF CYCLES", "widgetTypeId": 1, "iconCodePoint": "0xe174", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "PRESSURE VALUES", "widgetTypeId": 1, "iconCodePoint": "0xe175", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "DELTA PRESSURE DELAY", "widgetTypeId": 5, "iconCodePoint": "0xe176", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "DWELL TIME MAIN FILTER", "widgetTypeId": 5, "iconCodePoint": "0xe177", "iconFontFamily": "MaterialIcons", "value": "", "hidden": false},
      {"title": "MANUAL FLUSHING STATUS", "widgetTypeId": 2, "iconCodePoint": "0xe178", "iconFontFamily": "MaterialIcons", "value": "false", "hidden": false},
      {"title": "FLUSHING STATUS", "widgetTypeId": 2, "iconCodePoint": "0xe179", "iconFontFamily": "MaterialIcons", "value": "false", "hidden": false}
    ]
  }
};

  @override
  void initState() {
    super.initState();
     fetchData();
  }

  Future<void> fetchData() async {
  //   Map<String, Object> body = {"userwidgetTypeId": '8', "controllerwidgetTypeId": '1'};
  //   final response = await HttpService().postRequest("getUserPlanningConditionLibrary", body);
   //   if (response.statusCode == 200) {
  //     setState(() {
  //       var jsondata1 = jsonDecode(response.body);
  //       _FiltersettingsModel = ConditionModel.fromJson(jsondata1);
  //       _FiltersettingsModel.data!.dropdown!.insert(0, '');
  //     });
  //   } else {
  //     //_showSnackBar(response.body);
  //   }
    _FiltersettingsModel = FiltersettingsModel.fromJson(jsondata);
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

  @override
  Widget build(BuildContext context) {
    if (_FiltersettingsModel.data == null) {
      return Center(child: CircularProgressIndicator()); // Or handle the null case in a way that makes sense for your application
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Filter Settings'),
          backgroundColor: Color.fromARGB(255, 31, 164, 231),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(15.0),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 5,
            //       blurRadius: 7,
            //       offset: Offset(0, 3),
            //     ),
            //   ],
            // ),
            child:
              SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: 10,),

                  Card(child: ListTile(leading: Icon(
        IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![0].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![0].iconFontFamily ?? "MaterialIcons")), title: Text(_FiltersettingsModel.data!.filterBackwashing![0].title.toString()),trailing:  DropdownButton(
                    items: ["None","Off","On"].map((String? items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(padding: const EdgeInsets.only(left: 10), child: Text(items!)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _FiltersettingsModel.data!.filterBackwashing![0].value = value;
                       });
                    },
                    value: _FiltersettingsModel.data!.filterBackwashing![0].value == '' ? "None" : _FiltersettingsModel.data!.filterBackwashing![0].value,
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![1].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![1].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![1].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![1].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![1].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![1].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![2].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![2].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![2].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![2].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![2].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![2].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![3].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![3].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![3].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![3].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![3].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![3].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![4].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![4].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![4].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![4].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![4].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![4].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![5].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![5].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![5].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![5].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![5].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![5].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![6].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![6].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![6].title.toString()),trailing: Container(
                    width: 100,
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      initialValue: _FiltersettingsModel.data!.filterBackwashing![6].value,
                      showCursor: true,
                      decoration: InputDecoration(hintText: '0'),
                      onChanged: (value) {
                        _FiltersettingsModel.data!.filterBackwashing![6].value = value;
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![7].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![7].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![7].title.toString()),trailing: Container(
                    width: 100,
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      initialValue: _FiltersettingsModel.data!.filterBackwashing![7].value,
                      showCursor: true,
                      decoration: InputDecoration(hintText: "0.0 bar"),
                      onChanged: (value) {
                        _FiltersettingsModel.data!.filterBackwashing![7].value = value;
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![8].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![8].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![8].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![8].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![8].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![8].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![9].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![9].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![9].title.toString()),trailing: Container(
                    child: InkWell(
                      child: Text(
                        '${_FiltersettingsModel.data!.filterBackwashing![9].value == "" ? "00:00" : _FiltersettingsModel.data!.filterBackwashing![9].value}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      onTap: () async{
                        String time =  await _selectTime(context);
                        setState(()  {
                          _FiltersettingsModel.data!.filterBackwashing![9].value = time;
                        });
                      },
                    ),
                  ),)),
                  Card(child: ListTile(leading: Icon(
                      IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![10].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![10].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![10].title.toString()),trailing: MySwitch(
                    value: _FiltersettingsModel.data!.filterBackwashing![10].value == "true" ? true : false,
                    onChanged: ((value) {
                      setState(() {
                         _FiltersettingsModel.data!.filterBackwashing![10].value = '$value';
                      });
                    }),
                  ),)),
                   Card(child: ListTile(leading: Icon(
                       IconData(int.parse(_FiltersettingsModel.data!.filterBackwashing![11].iconCodePoint.toString()), fontFamily: _FiltersettingsModel.data!.filterBackwashing![11].iconFontFamily ?? "MaterialIcons")),title: Text(_FiltersettingsModel.data!.filterBackwashing![11].title.toString()),trailing: MySwitch(
                    value: _FiltersettingsModel.data!.filterBackwashing![11].value == "true" ? true : false,
                    onChanged: ((value) {
                      setState(() {
                         _FiltersettingsModel.data!.filterBackwashing![11].value = '$value';
                      });
                    }),
                  ),)),
                  SizedBox(height: 10,),
                  TextButton(onPressed: (){
                    print(jsonEncode(_FiltersettingsModel.data!.filterBackwashing));
                   }, child: Container(height: 50, child: Text(' Save ')))
                ]),
              ),),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     setState(() {
        //       updateconditions();
        //     });
        //   },
        //   tooltip: 'Send',
        //   child: const Icon(Icons.send),
        // ),
      );
    }
  }
   // updateconditions() async
   // {
   //   List<Map<String, dynamic>>? conditionJson =  _FiltersettingsModel.data!.filterBackwashing?.map((condition) => condition.toJson()).toList();
   //
   //   Map<String, Object> body = {
   //     "userwidgetTypeId": '8',
   //     "controllerwidgetTypeId": "1",
   //     "condition": conditionJson!,
   //     "createUser": "1"
   //   };
   //   final response =
   //   await HttpService().postRequest("createUserPlanningConditionLibrary", body);
   //   final jsonDataresponse = json.decode(response.body);
   //   AlertDialogHelper.showAlert(context, '', jsonDataresponse['message']);
   // }

}
