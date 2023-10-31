import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/IrrigationProgramModel/irrigation_program_model.dart';
import '../services/http_service.dart';

class IrrigationProgramMainProvider extends ChangeNotifier {

  Map<String, dynamic> sampleData = {
    "program": {
      "id": "",
      "sno": 1,
      "value": {
        "sequence": [],
        "schedule": [],
        "conditions": [],
        "waterAndFert": [],
        "selection": [],
        "alarm": [],
        "done": []
      }
    },
    "irrigationPumpName": [
      {"sNo": 7, "id": "IP1", "location": "", "name": "Irrigation Pump 1"},
      {"sNo": 9, "id": "IP2", "location": "", "name": "Irrigation Pump 2"},
      {"sNo": 11, "id": "IP3", "location": "", "name": "Irrigation Pump 3"},
      {"sNo": 13, "id": "IP4", "location": "", "name": "Irrigation Pump 4"}
    ],
    "moistureSensors": [
      {"sNo": 7, "id": "MS1", "location": "", "name": "Moisture Sensor 1"},
      {"sNo": 9, "id": "MS2", "location": "", "name": "Moisture Sensor 2"},
      {"sNo": 11, "id": "MS3", "location": "", "name": "Moisture Sensor 3"},
      {"sNo": 13, "id": "MS4", "location": "", "name": "Moisture Sensor 4"}
    ],
    "levelSensors": [
      {"sNo": 7, "id": "LS1", "location": "", "name": "Level Sensor 1"},
      {"sNo": 9, "id": "LS2", "location": "", "name": "Level Sensor 2"},
      {"sNo": 11, "id": "LS3", "location": "", "name": "Level Sensor 3"},
      {"sNo": 13, "id": "LS4", "location": "", "name": "Level Sensor 4"}
    ],
    "conditions": [
      {"sNo": 7, "id": "COND1", "location": "", "name": "Conditions 1"},
      {"sNo": 9, "id": "COND2", "location": "", "name": "Conditions 2"},
      {"sNo": 11, "id": "COND3", "location": "", "name": "Conditions 3"},
      {"sNo": 13, "id": "COND4", "location": "", "name": "Conditions 4"}
    ],
    "line" : [
      {"sno": 1, "id": 1, "name": "Line1", "value": ["0","2","3","4"]},
      {"sno": 2, "id": 2, "name": "Line2", "value": ["2","2","3","4"]},
      {"sno": 3, "id": 3, "name": "Line3", "value": ["3","2","3","4"]},
      {"sno": 4, "id": 4, "name": "Line4", "value": ["4","2","3","4"]},
      {"sno": 5, "id": 5, "name": "Line5", "value": ["5","2","3","4"]}
    ],
    "group" : [
      {"sno": 1, "id": 1, "name": "Group1", "location":"Line 1", "value": ["1.1","1.2","1.3","1.4"]},
      {"sno": 2, "id": 2, "name": "Group2", "location":"Line 2", "value": ["2.1","2.2","2.4"]},
      {"sno": 3, "id": 3, "name": "Group3", "location":"Line 3", "value": ["3.1","3.2","3.3","3.4"]},
      {"sno": 4, "id": 4, "name": "Group4", "location":"Line 4", "value": ["4.1","4.2","4.3","4.4"]}
    ],
    // "conditions":[
    //   {"id":"", "name": ""},{"id":"", "name": ""},{"id":"", "name": ""},{"id":"", "name": ""}
    // ]
  };

  final HttpService httpService = HttpService();

  Program? _program;
  List<Line>? _lines;
  List<Group>? _groups;
  List<Devices>? _irrigationPump;
  List<Devices>? _moistureSensor;
  List<Devices>? _levelSensor;
  List<Devices>? _conditions;

  Program? get program => _program;
  List<Line>? get lines => _lines;
  List<Group>? get groups => _groups;
  List<Devices>? get irrigationPump => _irrigationPump;
  List<Devices>? get moistureSensor => _moistureSensor;
  List<Devices>? get levelSensor => _levelSensor;
  List<Devices>? get conditions => _conditions;


  Future<void> planningData() async {
    try{
      final userData = {
        "userId": 8,
        "controllerId": 1,
      };
      final getUserPreference = await httpService.postRequest('defaultUserPreference', userData);
      if(getUserPreference.statusCode == 200) {
        final responseJson = getUserPreference.body;
        final convertedJson = jsonDecode(responseJson);
        _program = Program.fromJson(sampleData["program"]);
        _lines = List<Line>.from(sampleData["line"].map((element) => Line.fromJson(element)));
        _irrigationPump = List<Devices>.from(sampleData["irrigationPumpName"].map((element) => Devices.fromJson(element)));
        _moistureSensor = List<Devices>.from(sampleData["moistureSensors"].map((element) => Devices.fromJson(element)));
        _levelSensor = List<Devices>.from(sampleData["levelSensors"].map((element) => Devices.fromJson(element)));
        _conditions = List<Devices>.from(sampleData["conditions"].map((element) => Devices.fromJson(element)));
        _groups = List<Group>.from(sampleData["group"].map((element) => Group.fromJson(element)));
      }else {
        print("HTTP Request failed or received an unexpected response.");
      }
    } catch (error) {
      print("Error: $error");
    }

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  void initData(sampleData) {
    _program = Program.fromJson(sampleData["program"]);
    _lines = List<Line>.from(sampleData["line"].map((element) => Line.fromJson(element)));
    _irrigationPump = List<Devices>.from(sampleData["irrigationPumpName"].map((element) => Devices.fromJson(element)));
    _moistureSensor = List<Devices>.from(sampleData["moistureSensors"].map((element) => Devices.fromJson(element)));
    _levelSensor = List<Devices>.from(sampleData["levelSensors"].map((element) => Devices.fromJson(element)));
    _groups = List<Group>.from(sampleData["group"].map((element) => Group.fromJson(element)));
    _conditions = List<Devices>.from(sampleData["conditions"].map((element) => Condition.fromJson(element)));

    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void updateTabIndex(int newIndex) {
    _selectedTabIndex = newIndex;
    notifyListeners();
  }

  List<String> selectedValves = <String>[];
  List<List<String>> sequencedValves = [];
  bool isRecentlySelected = false;

  void valveSelection(String valves, int titleIndex) {
    final bool groupContainsValue = groups!.any((group) => group.value.contains(valves));
    final String currentVal = groupContainsValue ? valves : '${titleIndex + 1}.$valves';

    if (sequencedValves.isNotEmpty) {
      final lastList = sequencedValves.last;
      if (lastList.isNotEmpty && lastList.last == currentVal) {
        isRecentlySelected = true;
      } else {
        isRecentlySelected = false;
        updateSequencedValves(currentVal);
      }
    } else {
      isRecentlySelected = false;
      updateSequencedValves(currentVal);
    }

    print(sequencedValves);
    notifyListeners();
  }

  void reorderSelectedValves(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final valve = sequencedValves[oldIndex];
    sequencedValves.removeAt(oldIndex);
    sequencedValves.insert(newIndex, valve);
  }

  void updateSequencedValves(String currentVal) {
    if (isSingleValveMode) {
      sequencedValves.add(<String>[currentVal]);
    }
    else{
      if(sequencedValves.isEmpty){
        sequencedValves.add(<String>[currentVal]);
      }else{
        final List<String> lastList = sequencedValves.last.cast<String>();
        lastList.add(currentVal);
      }
    }
  }

  bool isSingleValveMode = true;
  bool isMultipleValveMode = false;
  void enableMultipleValveMode() {
    isSingleValveMode = false;
    isMultipleValveMode = true;
    isDelete = false;
    notifyListeners();
  }

  void enableSingleValveMode() {
    isSingleValveMode = true;
    isMultipleValveMode = false;
    isDelete = false;
    notifyListeners();
  }

  bool isDelete = false;
  void deleteFunction() {
    isDelete = true;
    isMultipleValveMode = false;
    isSingleValveMode = false;
    notifyListeners();
  }

  void deleteButton() {
    sequencedValves.clear();
    notifyListeners();
  }

  bool isSelected(String valves, int titleIndex) {
    final bool groupContainsValue = groups!.any((group) => group.value.contains(valves));
    final String currentVal = groupContainsValue ? valves : '${titleIndex + 1}.$valves';

    return sequencedValves.any((list) => list.contains(currentVal));
  }

  void updatePump(index, newValue) {
    irrigationPump![index] = newValue;
    notifyListeners();
  }

  //TODO: SCHEDULE SCREEN PROVIDERS
  List<String> scheduleTypes = ['NO SCHEDULE', 'SCHEDULE AS RUN LIST', 'SCHEDULE BY DAYS'];

  String _selectedValue = 'NO SCHEDULE';
  String get selectedScheduleType => _selectedValue;

  void updateSelectedValue(newValue) {
    _selectedValue = newValue;
    notifyListeners();
  }


  List<Map<String, dynamic>> rtc = [
    {
      'RTC1': {
        'onTime': '',
        'offTime': '',
        'interval': '',
        'noOfCycles': '',
        'maximumTime': '',
        'condition': '',
      },
      'RTC2': {
        'onTime': '',
        'offTime': '',
        'interval': '',
        'noOfCycles': '',
        'maximumTime': '',
        'condition': '',
      },
      'RTC3': {
        'onTime': '',
        'offTime': '',
        'interval': '',
        'noOfCycles': '',
        'maximumTime': '',
        'condition': '',
      },
    }
  ];
  int _selectedRtcIndex = 0;

  int get selectedRtcIndex => _selectedRtcIndex;

  void updateRtcIndex(int newIndex) {
    _selectedRtcIndex = newIndex;
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }
}