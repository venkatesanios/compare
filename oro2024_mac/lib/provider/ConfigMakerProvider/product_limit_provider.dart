import 'package:flutter/cupertino.dart';

class ProductLimitProvider extends ChangeNotifier{
  List<String> selectedValues = [];
  List<List<String>> valueCounts = [];


  String selectedValue(configIndex){
    // print(selectedValues);
    return selectedValues[configIndex];
  }

  List<String> valueCount(configIndex){
    return valueCounts[configIndex];
  }

  void updateSelectedValue(int configIndex, String newValue) {
    selectedValues[configIndex] = newValue;
    notifyListeners();
  }

  void updateAll(myAssets) {
    selectedValues = [
      myAssets!.waterSource,
      myAssets!.valve,
      myAssets!.mainValve,
      myAssets!.mainFilterValve,
      myAssets!.sourcePump,
      myAssets!.irrigationPump,
      myAssets!.filter,
      myAssets!.fertilizers,
      myAssets!.dosingChannel,
      myAssets!.dosingBooster,
      myAssets!.selector,
      myAssets!.agitator,
      myAssets!.weatherStations,
      myAssets!.rtu,
      myAssets!.xtend,
      myAssets!.sense,
      myAssets!.level,
      myAssets!.switches,
      myAssets!.conditions,
      myAssets!.alarmGroups,
      myAssets!.radiationSets,
      myAssets!.satellites,
      myAssets!.analogSensors,
      myAssets!.contacts,
      myAssets!.sites,
      myAssets!.cooling,
      myAssets!.waterHeater,
      myAssets!.virtualWaterMeter,
      myAssets!.freeWaterMeters,
      myAssets!.ecOpen,
      myAssets!.ecClose,
      myAssets!.ecPump,
      myAssets!.sameAsRelay,
    ];
    valueCounts = [
      List.generate(int.parse(myAssets?.waterSource ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.valve ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.mainValve ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.mainFilterValve ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.sourcePump ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.irrigationPump ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.filter ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.fertilizers ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.dosingChannel ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.dosingBooster ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.selector ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.agitator ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.weatherStations ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.rtu ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.xtend ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.sense ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.level ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.switches ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.conditions ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.alarmGroups ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.radiationSets ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.satellites ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.analogSensors ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.contacts ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.sites ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.cooling ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.waterHeater ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.virtualWaterMeter ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.freeWaterMeters ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.ecOpen ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.ecClose ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.ecPump ?? '0'), (index) => (index + 1).toString()),
      List.generate(int.parse(myAssets?.sameAsRelay ?? '0'), (index) => (index + 1).toString()),
    ];
    notifyListeners();
  }
}