

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/IrrigationProgramModel/selection_model.dart';
import '../../provider/irrigation_program_main_provider.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});
  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final Map<int, GlobalKey> itemKeys = {};
  String filterselection = "Central filter";
  String fertselection = "Central fert";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final selectionpvd = Provider.of<IrrigationProgramMainProvider>(context,listen: true);


    Widget buildCard(List<generalData> itemList, List<generalData> itemList2,
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
                          selectionpvd.selectItem(
                              index, subtitle2.isEmpty ? title : subtitle );
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
                        selectionpvd.selectItem(index, subtitle2);
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

    if (selectionpvd.selectionModel.data == null) {
      return Center(
          child: CircularProgressIndicator()); // Or handle the null case in a way that makes sense for your application
    } else {
      return ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10),
          selectionpvd.selectionModel.data!.mainValve!.isNotEmpty ? buildCard(
              selectionpvd.selectionModel.data!.mainValve!, [], 'MAIN VALVE',
              'List of Valves', '') : Container(),
           const SizedBox(height: 10),
          selectionpvd.selectionModel.data!.irrigationPump!.isNotEmpty ? buildCard(
              selectionpvd.selectionModel.data!.irrigationPump!, [], 'PUMP SELECTION',
              'List of Pump', '') : Container(),
           const SizedBox(height: 10),
          (selectionpvd.selectionModel.data!.centralFertilizationSite!.isNotEmpty ||
              selectionpvd.selectionModel.data!.localFertilizer!.isNotEmpty) ? buildCard(
              selectionpvd.selectionModel.data!.centralFertilizationSite!,
              selectionpvd.selectionModel.data!.localFertilizer!, 'Fertilizer Selection',
              'Central Fertilizer', 'Local Fertilizer') : Container(),
          const SizedBox(height: 10),
          (selectionpvd.selectionModel.data!.centralFilterSite!.isNotEmpty ||
              selectionpvd.selectionModel.data!.localFilter!.isNotEmpty) ? buildCard(
              selectionpvd.selectionModel.data!.centralFilterSite!,
              selectionpvd.selectionModel.data!.localFilter!, 'Filter Selection',
              'Central Filter', 'Local Filter') : Container(),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
        ],
      );
    }
  }
}