import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oro2024_mac/provider/data_acquisition_provider.dart';
import 'package:provider/provider.dart';

import '../../services/http_service.dart';
import '../../utils/widgets/SCustomWidgets/custom_tab.dart';

class DataAcquisitionMain extends StatefulWidget {
  const DataAcquisitionMain({super.key});

  @override
  State<DataAcquisitionMain> createState() => _DataAcquisitionMainState();
}

class _DataAcquisitionMainState extends State<DataAcquisitionMain> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final HttpService httpService = HttpService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DataAcquisitionProvider>(context, listen: false).dataAcquisitionFromApi().then((_) {
      _tabController = TabController(
        length: Provider.of<DataAcquisitionProvider>(context, listen: false).dataModel?.data.length ?? 0,
        vsync: this,
      );
      _tabController.addListener(() {
        Provider.of<DataAcquisitionProvider>(context, listen: false).updateTabIndex(_tabController.index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataAcquisitionProvider>(context);

    if (dataProvider.dataModel != null && dataProvider.dataModel?.data != null) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final isScreenSizeLarge = constraints.maxWidth >= 565;

            final List<IconData> tabIcons= [Icons.leak_add, Icons.invert_colors, Icons.terrain];
            return DefaultTabController(
              length: dataProvider.dataModel!.data.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Data Acquisition'),
                  centerTitle: false,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(80.0),
                    child: Container(
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.background,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: dataProvider.dataModel!.data.length > 3 && !isScreenSizeLarge,
                        tabs: [
                          ...dataProvider.dataModel!.data.asMap().entries.map((entry) {
                            final index = entry.key;
                            final dataItem = entry.value;
                            final tab = dataItem.nameDescription;
                            final icon = index < tabIcons.length ? tabIcons[index] : Icons.sensor_occupied;

                            return CustomTab(
                              height: 80,
                              content: icon,
                              label: tab,
                              tabIndex: index,
                              selectedTabIndex: dataProvider.selectedTabIndex,
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  controller: _tabController,
                  children: dataProvider.dataModel!.data.asMap().entries.map((entry){
                    final dataIndex = entry.key;
                    final dataItem = entry.value;
                    final tab = dataItem.nameDescription;
                    final dataAcquisition = dataItem.dataAcquisition;
                    var rowIndex = 0;

                    return Container(
                      margin: isScreenSizeLarge ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20) : const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: {
                              0: !isScreenSizeLarge ? const FlexColumnWidth(1.2) : const FlexColumnWidth(1),
                              for (int i = 1; i < dataAcquisition.length + 1; i++)
                                i: const FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor
                                ),
                                children: const [
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Location', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ))),
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Object', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ))),
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ))),
                                  TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Sampling Rate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ))),
                                ],
                              )
                            ],
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: !isScreenSizeLarge ? const FlexColumnWidth(1.2) : const FlexColumnWidth(1),
                                    for (int i = 1; i < dataAcquisition.length + 1; i++)
                                      i: const FlexColumnWidth(1),
                                  },
                                  children: dataAcquisition.asMap().entries.map((entry) {
                                    rowIndex = entry.key;
                                    final rowIndex2 = entry.key;
                                    final item = entry.value;
                                    final name = item.name;
                                    final object = item.object;
                                    final location = item.location;
                                    final sampleRate = item.sampleRate;

                                    return TableRow(
                                      decoration: BoxDecoration(
                                        color: rowIndex % 2 == 0
                                            ? isScreenSizeLarge
                                            ? Theme.of(context).primaryColor.withOpacity(0.05)
                                            : Colors.white
                                            : Theme.of(context).primaryColor.withOpacity(0.2),
                                      ),
                                      children: [
                                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(location),
                                        ))),
                                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(object),
                                        ))),
                                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(name),
                                        ))),
                                        TableCell(verticalAlignment: TableCellVerticalAlignment.middle, child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 100,
                                            child: DropdownButton<String>(
                                              focusColor: Colors.transparent,
                                              isExpanded: true,
                                              value: sampleRate == '' ? 'None' : sampleRate,
                                              underline: Container(),
                                              onChanged: (newValue) => dataProvider.updateSelectedValue(dataIndex, rowIndex2, newValue!),
                                              items: _buildDropdownItems(DataAcquisitionProvider.durationList),
                                            ),
                                          ),
                                        ))),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                if(rowIndex == dataAcquisition.length -1)
                                  const SizedBox(height: 70,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () async {
                    final dataAcquisition = Provider.of<DataAcquisitionProvider>(context, listen: false).dataModel;
                    Map<String, dynamic> jsonData = {
                      "createUser" : 1,
                      "userId": 1,
                      "controllerId": 1,
                      "dataAcquisitions": dataAcquisition!.toJson(),
                    };

                    try {
                      final crateDataAcquisition = await httpService.postRequest('createUserDataAcquisition', jsonData);
                      final message = jsonDecode(crateDataAcquisition.body);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            message['message'],
                            textAlign: TextAlign.center,
                          )
                      ));
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to update because of $error'))
                      );
                      print("Error: $error");
                    }
                  },
                  child: const Icon(Icons.send),
                ),
              ),
            );
          }
      );
    } else {
      return Scaffold(
        body: Center(
          child: dataProvider.isLoading
              ? const CircularProgressIndicator()
              : Text('Error: Data not available'),
        ),
      );
    }
  }
  List<DropdownMenuItem<String>> _buildDropdownItems(List<String> items) {
    return items.map((contact) {
        return DropdownMenuItem<String>(
          value: contact,
          child: Text(contact),
        );
      }).toList();
  }
}
