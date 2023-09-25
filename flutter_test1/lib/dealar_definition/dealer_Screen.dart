import 'package:flutter/material.dart';
import 'package:flutter_test1/dealar_definition/constant/custom_text.dart';
import 'package:flutter_test1/dealar_definition/dealer_Screen_Web.dart';
import 'package:flutter_test1/dealar_definition/dealer_viewmodel.dart';
import 'package:flutter_test1/keyboard_dismiss.dart';
import 'package:flutter_test1/product/widgets/custom_switch.dart';
import 'package:flutter_test1/product/widgets/drop_down_button.dart';
import 'package:flutter_test1/sevices/http_services.dart';
import 'package:provider/provider.dart';

class DealerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 800) {
              // Render mobile content
              return MobileContent();
            } else {
              // Render web content
              return WebContent();
            }
          },
        ),
      ),
    );
  }
}

class MobileContent extends StatelessWidget {
  List<Map<String, dynamic>> gentrallist = [
    {
      'name': 'Use USA units',
      'value': "0",
      'type': '1',
    },
    {
      'name': 'Water accumulation unit',
      'value': "1",
      'type': '2',
    },
    {
      'name': 'Cycles',
      'value': "2",
      'type': '2',
    },
    {
      'name': 'Priority',
      'value': "3",
      'type': '3',
    },
    {
      'name': 'Named groups',
      'value': "4",
      'type': '1',
    },
    {
      'name': 'Start together',
      'value': "5",
      'type': '2',
    },
    {
      'name': 'Dosage per area',
      'value': "6",
      'type': '3',
    },
    {
      'name': 'Evaporation control',
      'value': "7",
      'type': '1',
    },
    {
      'name': 'Notify about fertilizer left',
      'value': "8",
      'type': '2',
    },
    {
      'name': 'Accumulated radiation',
      'value': "9",
      'type': '3',
    },
    {
      'name': 'Special water before',
      'value': "10",
      'type': '1',
    },
    {
      'name': 'Use fertilizer sets',
      'value': "11",
      'type': '2',
    },
  ];

  List<Map<String, dynamic>> valvedefaultlist = [
    {
      'name': "Local fert mode liter/m3",
      'value': '3',
      'type': '2',
    },
    {
      'name': "Local fert mode sec/min",
      'value': '5',
      'type': '2',
    },
    {
      'name': "Local fert mode min.sec/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert mode min.sec/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert liter/min",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert proportional",
      'value': '1',
      'type': '2',
    },
  ];

  List<Map<String, dynamic>> fertilizationlist = [
    {
      'name': "Local fert mode l/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert mode sec/min",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert mode min sec/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert l/min",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert proportional",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert bulk by time",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Local fert bulk by volume",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Central fert mode l/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Centrall fert mode sec/min",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Central fert mode min sec/m3",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Central fert l/min",
      'value': '1',
      'type': '2',
    },
    {
      'name': "Central fert proportional",
      'value': '1',
      'type': '2',
    },
  ];

  List<Map<String, dynamic>> memorylist = [
    {
      'name': "Programs",
      'value': "Program A",
      'type': "2",
    },
    {
      'name': "Groups",
      'value': "Group 1",
      'type': "2",
    },
    {
      'name': "Water jobs",
      'value': "Job 1",
      'type': "2",
    },
    {
      'name': "Fert jobs",
      'value': "Job 2",
      'type': "1",
    },
    {
      'name': "Reports",
      'value': "Report 1",
      'type': "2",
    },
    {
      'name': "Virtual water meter",
      'value': "Meter 1",
      'type': "2",
    },
    {
      'name': "Condition",
      'value': "Condition 1",
      'type': "2",
    },
  ];
  final _formKeydealer = GlobalKey<FormState>();
  var dealerviewmodel = DealerViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dealer Definition'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'General',
                icon: Icon(Icons.ac_unit),
              ),
              Tab(
                text: 'Fertilizer',
                icon: Icon(Icons.free_breakfast),
              ),
              Tab(
                text: 'Valve default',
                icon: Icon(Icons.file_download_rounded),
              ),
              Tab(
                text: 'Memory',
                icon: Icon(Icons.memory),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
          child: TabBarView(
            children: [
              buildTab('General', false),
              buildTab('Fertilizer', false),
              buildTab('Filter', false),
              buildTab('Memory', false),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dealerviewmodel.savedealerdefinition();

            Map<String, Object> body = {
              "categoryId": '1',
              "modifyUser": '1',
            };
            final response =
                await HttpService().putRequest("inactiveCategory", body);
            print('response:------------$response');

            // final response2 = await HttpService().putRequest("updateUser", body);
            // print(response2);
          },
          child: Icon(Icons.send),
        ),
      ),
    );
  }

  Widget buildTab(String tabTitle, bool titlestatus) {
    int count = 0;
    int oddeven = 0;
    var dealerviewmodel = DealerViewModel();
    List<Map<String, dynamic>> Listofvalue = [];
    if (tabTitle == "General") {
      count = gentrallist.length;
      Listofvalue = gentrallist;
    } else if (tabTitle == "Fertilizer") {
      count = fertilizationlist.length;
      Listofvalue = fertilizationlist;
    } else if (tabTitle == "Filter") {
      count = valvedefaultlist.length;
      Listofvalue = valvedefaultlist;
    } else if (tabTitle == "Memory") {
      count = memorylist.length;
      Listofvalue = memorylist;
    }
    return Column(
      children: [
        titlestatus
            ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  tabTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Container(),
        Flexible(
          child: Form(
            key: _formKeydealer,
            child: ListView.builder(
              itemCount: Listofvalue.length,
              itemBuilder: (context, index) {
                oddeven = index.isEven ? 0 : 1;
                if (Listofvalue[index]['type'] == '1') {
                  String selectedDropdownValue = 'hh:mm:ss';
                  return Column(
                    children: [
                      Container(
                        child: ListTile(
                          //   leading: const Icon(Icons.account_balance),
                          title: Text('${Listofvalue[index]['name']}'),
                          subtitle: Text(
                            'Details: ${Listofvalue[index]['name']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          trailing: Container(
                            color: Colors.white,
                            width: 80,
                            child: MyDropDown(
                              itemList: const [
                                '--/--',
                                'hh:mm:ss',
                                'm3',
                                'Model 3',
                              ],
                              setValue: dealerviewmodel.updatevalue,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                        ),
                        child: Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else if (Listofvalue[index]['type'] == '2') {
                  return Column(
                    children: [
                      Container(
                        child: ListTile(
                          title: Text('${Listofvalue[index]['name']}'),
                          subtitle: Text(
                            'Details: ${Listofvalue[index]['name']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          trailing: SizedBox(
                              width: 50,
                              child: CustomTextField(
                                onChanged: (text) {},
                                initialValue: '${Listofvalue[index]['value']}',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Warranty is required';
                                  } else {
                                    dealerviewmodel.updatevalue;
                                  }
                                  return null;
                                },
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                        ),
                        child: Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        child: ListTile(
                          title: Text('${Listofvalue[index]['name']}'),
                          subtitle: Text(
                            'Details: ${Listofvalue[index]['name']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          trailing: MySwitch(
                            value: false,
                            onChanged: ((value) {
                              print(value);
                              dealerviewmodel.updatevalue;
                            }),
                          ),
                          // trailing: Switch(
                          //   value: false,
                          //   onChanged: (value) {},
                          // ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                        ),
                        child: Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
