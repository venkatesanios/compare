import 'dart:convert';

import 'package:flutter/material.dart';
 import '../../model/IrrigationProgramModel/selection_model.dart';
 import '../../utils/constants/http_services.dart';

class SelectionScreen3 extends StatefulWidget {
  const SelectionScreen3({super.key});

  @override
  State<SelectionScreen3> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen3> {

  final Map<int, GlobalKey> itemKeys = {};
  String filterselection = "Central filter";
  String fertselection = "Central fert";
  SelectionModel _selectionModel = SelectionModel();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Map<String, Object> body = {
      "userId": 8,
      "controllerId": 4
    };
    final response = await HttpService().postRequest("getUserProgramSelection", body);
    print(response.body);
    final jsonData = json.decode(response.body);
    try {
      setState(() {
        _selectionModel = SelectionModel.fromJson(jsonData);
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
     print(json.encode(_selectionModel));
    // _selectionModel = SelectionModel.fromJson(jsondata);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildCard(List<generalData> itemList, List<generalData> itemList2,
        String title, String subtitle, String subtitle2) {
      print("itemList");
      print(json.encode(itemList));
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
                if (title != null && itemList.isNotEmpty)
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
                (subtitle != null && itemList.isNotEmpty) ? ListTile(
                    title: Text(subtitle)) : Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 5.0,
                    children: List.generate(itemList.length, (index) {
                      return ChoiceChip(
                        label: Text('${itemList[index].name}'),
                        selected: itemList[index].selected ?? false,
                        selectedColor: Colors.amber,
                        onSelected: (bool selected) {
                          selectItem(
                              index, subtitle.isEmpty ? title : subtitle);
                        },
                      );
                    }),
                  ),
                ),
                if (subtitle2 != '') const Divider(),
                if (subtitle2 != '' && itemList2.isNotEmpty) ListTile(
                    title: Text(subtitle2)),
                if (subtitle2 != '') Wrap(
                  spacing: 10.0,
                  runSpacing: 5.0,
                  children: List.generate(itemList2.length, (index) {
                    return ChoiceChip(
                      label: Text('${itemList2[index].name}'),
                      selected: itemList2[index].selected ?? false,
                      selectedColor: Colors.amber,
                      onSelected: (bool selected) {
                        selectItem(index, subtitle2);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_selectionModel.data == null) {
      return Center(
          child: CircularProgressIndicator()); // Or handle the null case in a way that makes sense for your application
    } else {
      return ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10),
          _selectionModel.data!.mainValve!.isNotEmpty ? buildCard(
              _selectionModel.data!.mainValve!, [], 'MAIN VALVE',
              'List of Valves', '') : Container(),
          // buildCard(_selectionModel.data!.mainValve!,[],'MAIN VALVE', '',''),
          const SizedBox(height: 10),
          _selectionModel.data!.irrigationPump!.isNotEmpty ? buildCard(
              _selectionModel.data!.irrigationPump!, [], 'PUMP SELECTION',
              'List of Pump', '') : Container(),

          // buildCard(_selectionModel.data!.irrigationPump!,[],'PUMP SELECTION', '',''),
          const SizedBox(height: 10),
          (_selectionModel.data!.centralFertilizationSite!.isNotEmpty ||
              _selectionModel.data!.localFertilizer!.isNotEmpty) ? buildCard(
              _selectionModel.data!.centralFertilizationSite!,
              _selectionModel.data!.localFertilizer!, 'Fertilizer Selection',
              'Central Fertilizer', 'Local Fertilizer') : Container(),

          // buildCard(_selectionModel.data!.centralFertilizationSite!,_selectionModel.data!.localFertilizer!,'Fertilizer Selection', 'Central Fertilizer','Local Fertilizer'),
          // buildCard('', 'Local Fertilizer',''),
          const SizedBox(height: 10),
          (_selectionModel.data!.centralFilterSite!.isNotEmpty ||
              _selectionModel.data!.localFilter!.isNotEmpty) ? buildCard(
              _selectionModel.data!.centralFilterSite!,
              _selectionModel.data!.localFilter!, 'Filter Selection',
              'Central Filter', 'Local Filter') : Container(),

          // buildCard(_selectionModel.data!.centralFilterSite!,_selectionModel.data!.localFilter!,'Filter Selection', 'Central Filter','Local Filter'),
          // buildCard(_selectionModel.data!.mainValve!,'', 'Local Filter',''),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
        ],
      );
    }
  }
  void selectItem(int index,String title) {
    switch (title) {
      case 'MAIN VALVE':
        setState(() {
          _selectionModel.data!.mainValve![index].selected = !_selectionModel.data!.mainValve![index].selected!;
        });
        break;
      case 'PUMP SELECTION':
        setState(() {
          _selectionModel.data!.irrigationPump![index].selected = !_selectionModel.data!.irrigationPump![index].selected!;
        });
        break;
      case 'Central Fertilizer':
        setState(() {
          _selectionModel.data!.centralFertilizationSite![index].selected = !_selectionModel.data!.centralFertilizationSite![index].selected!;
        });
        break;
      case 'Local Fertilizer':
        setState(() {
          _selectionModel.data!.localFertilizer![index].selected = !_selectionModel.data!.localFertilizer![index].selected!;
        });
        break;
      case 'Central Filter':
        setState(() {
          _selectionModel.data!.centralFilterSite![index].selected = !_selectionModel.data!.centralFilterSite![index].selected!;
        });
        break;
      case 'Local Filter':
        setState(() {
          _selectionModel.data!.localFilter![index].selected = !_selectionModel.data!.localFilter![index].selected!;
        });
        break;
      default:
        print('No match found');
    }
  }
}
