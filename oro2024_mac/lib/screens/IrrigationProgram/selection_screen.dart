import 'dart:convert';

import 'package:flutter/material.dart';
import '../../model/IrrigationProgramModel/selection_model.dart';
import '../../utils/constants/http_services.dart';
import 'package:provider/provider.dart';


class SelectionModelProvider extends ChangeNotifier {
  SelectionModel _selectionModel = SelectionModel();

  SelectionModel get selectionModel => _selectionModel;

  void updateSelectionModel(SelectionModel newSelectionModel) {
    _selectionModel = newSelectionModel;
    notifyListeners();
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {

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
     final jsonData = json.decode(response.body);
    try {
      setState(() {
        final selectionModelProvider = Provider.of<SelectionModelProvider>(context, listen: false);
        selectionModelProvider.updateSelectionModel(SelectionModel.fromJson(jsonData));
       });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
     // _selectionModel = SelectionModel.fromJson(jsondata);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<SelectionModelProvider>(
        builder: (context, selectionModelProvider, child)
    {
      final _selectionModel = selectionModelProvider.selectionModel;
      selectionModelProvider.updateSelectionModel(_selectionModel);

      Widget buildCard(List<generalData> itemList,
          List<generalData> itemList2,
          String title, String subtitle, String subtitle2) {
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
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
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
                          avatar: CircleAvatar(child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text('${itemList[index].sNo}',
                                style: TextStyle(fontSize: 17),
                                softWrap: true,)),),
                          label: Text('${itemList[index].name}'),
                          selected: itemList[index].selected ?? false,
                          selectedColor: Colors.amber,
                          onSelected: (bool selected) {
                            selectItem(
                                index, subtitle.isEmpty ? title : subtitle,selectionModelProvider);
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
                          selectItem(index, subtitle2,selectionModelProvider);
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
            child: CircularProgressIndicator());
      } else {
        return ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 10),
            _selectionModel.data!.mainValve!.isNotEmpty ? buildCard(
                _selectionModel.data!.mainValve!, [], 'Main Valve Selection',
                'MAIN VALVE', '') : Container(),
            // buildCard(_selectionModel.data!.mainValve!,[],'MAIN VALVE', '',''),
            const SizedBox(height: 10),
            _selectionModel.data!.irrigationPump!.isNotEmpty ? buildCard(
                _selectionModel.data!.irrigationPump!, [],
                'Irrigation Pump Selection',
                'PUMP SELECTION', '') : Container(),

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
            const SizedBox(height: 20),
          ],
        );
      }
    });
  }
  // void selectItem(int index,String title,SelectionModelProvider selectionModelProvider) {
  //   switch (title) {
  //     case 'MAIN VALVE':
  //       setState(() {
  //         _selectionModel.data!.mainValve![index].selected = !_selectionModel.data!.mainValve![index].selected!;
  //       });
  //       break;
  //     case 'PUMP SELECTION':
  //       setState(() {
  //         _selectionModel.data!.irrigationPump![index].selected = !_selectionModel.data!.irrigationPump![index].selected!;
  //       });
  //       break;
  //     case 'Central Fertilizer':
  //       setState(() {
  //         _selectionModel.data!.centralFertilizationSite![index].selected = !_selectionModel.data!.centralFertilizationSite![index].selected!;
  //       });
  //       break;
  //     case 'Local Fertilizer':
  //       setState(() {
  //         _selectionModel.data!.localFertilizer![index].selected = !_selectionModel.data!.localFertilizer![index].selected!;
  //       });
  //       break;
  //     case 'Central Filter':
  //       setState(() {
  //         _selectionModel.data!.centralFilterSite![index].selected = !_selectionModel.data!.centralFilterSite![index].selected!;
  //       });
  //       break;
  //     case 'Local Filter':
  //       setState(() {
  //         _selectionModel.data!.localFilter![index].selected = !_selectionModel.data!.localFilter![index].selected!;
  //       });
  //       break;
  //     default:
  //       print('No match found');
  //   }
  // }
  void selectItem(int index, String title, SelectionModelProvider selectionModelProvider) {
    switch (title) {
      case 'MAIN VALVE':
        setState(() {
          selectionModelProvider.selectionModel.data!.mainValve![index].selected = !(selectionModelProvider.selectionModel.data!.mainValve![index].selected ?? false);
        });
        break;
      case 'PUMP SELECTION':
        setState(() {
          selectionModelProvider.selectionModel.data!.irrigationPump![index].selected = !(selectionModelProvider.selectionModel.data!.irrigationPump![index].selected ?? false);
        });
        break;
      case 'Central Fertilizer':
        setState(() {
          selectionModelProvider.selectionModel.data!.centralFertilizationSite![index].selected = !(selectionModelProvider.selectionModel.data!.centralFertilizationSite![index].selected ?? false);
        });
        break;
      case 'Local Fertilizer':
        setState(() {
          selectionModelProvider.selectionModel.data!.localFertilizer![index].selected = !(selectionModelProvider.selectionModel.data!.localFertilizer![index].selected ?? false);
        });
        break;
      case 'Central Filter':
        setState(() {
          selectionModelProvider.selectionModel.data!.centralFilterSite![index].selected = !(selectionModelProvider.selectionModel.data!.centralFilterSite![index].selected ?? false);
        });
        break;
      case 'Local Filter':
        setState(() {
          selectionModelProvider.selectionModel.data!.localFilter![index].selected = !(selectionModelProvider.selectionModel.data!.localFilter![index].selected ?? false);
        });
        break;
      default:
        print('No match found');
    }
  }
}
