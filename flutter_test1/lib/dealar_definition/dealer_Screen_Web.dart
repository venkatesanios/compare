import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_test1/dealar_definition/constant/custom_text.dart';
import 'package:flutter_test1/product/widgets/custom_switch.dart';

class WebContent extends StatelessWidget {
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 300).floor();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 239, 252),
      appBar: AppBar(
        title: Text('Dealer defination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 10, // Spacing between rows
                crossAxisSpacing: 10,
                childAspectRatio: 0.5),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: buildTab('General', true),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: buildTab('Fertilizer', true),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: buildTab('Filter', true),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: buildTab('Memory', true),
                ),
              ),
              // Add more GridItem widgets as needed
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.send),
      ),
    );
  }

  Widget buildTab(String tabTitle, bool titlestatus) {
    int count = 0;
    int oddeven = 0;
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
          const Divider(color: Colors.grey),
          Flexible(
            child: ListView.builder(
              itemCount: Listofvalue.length,
              itemBuilder: (context, index) {
                oddeven = index.isEven ? 0 : 1;
                if (Listofvalue[index]['type'] == '1') {
                  String selectedDropdownValue = 'hh:mm:ss';
                  return Column(
                    children: [
                      Container(
                        // color: index.isEven
                        //     ? const Color.fromARGB(255, 223, 239, 252)
                        //     : const Color.fromARGB(255, 192, 216, 252),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            // leading: const Icon(Icons.account_balance),
                            title: Text('${Listofvalue[index]['name']}'),
                            subtitle: Text(
                              'Details: ${Listofvalue[index]['name']}',
                              style: const TextStyle(fontSize: 11),
                            ),
                            trailing: DropdownButton<String>(
                              items: ['hh:mm:ss', 'm3', 'Lts/h']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // setState(() {
                                //   selectedDropdownValue = newValue!;
                                // });
                              },
                              value: selectedDropdownValue,
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
                        // color: index.isEven
                        //     ? const Color.fromARGB(255, 223, 239, 252)
                        //     : const Color.fromARGB(255, 192, 216, 252),
                        child: ListTile(
                          // leading: const Icon(Icons.sports_baseball),
                          title: Text('${Listofvalue[index]['name']}'),
                          subtitle: Text(
                            'Details: ${Listofvalue[index]['name']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          trailing: SizedBox(
                              width: 50,
                              child: CustomTextField(
                                controller: TextEditingController(),
                                onChanged: (text) {},
                                labelText: '${Listofvalue[index]['value']}',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Warranty is required';
                                  } else {
                                    // dealerviewmodel.updatevalue;
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
                          // leading: const Icon(Icons.abc_rounded),
                          title: Text('${Listofvalue[index]['name']}'),
                          subtitle: Text(
                            'Details: ${Listofvalue[index]['name']}',
                            style: const TextStyle(fontSize: 11),
                          ),
                          trailing: MySwitch(
                            value: false,
                            onChanged: ((value) {
                              print(value);
                            }),
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//  {
//   "message" : "Succès ",
//   "code" : 200,
//   "General" : [
// {"title" : "USA. unite","description" : "Details of use Use units","value" : "1234","valuetype" : "dropdown","dropdownlist" : []},{"title" : "USA. unite","description" : "Details of use Use units","value" : "1234","valuetype" : "dropdown","dropdownlist" : []}
//   ],
//     "Fertilizer" : [
// {"title" : "USA. unite","description" : "Details of use Use units","value" : "1234","valuetype" : "dropdown","dropdownlist" : []}

//   ],
//     "Valve" : [
// {"title" : "USA. unite","description" : "Details of use Use units","value" : "1234","valuetype" : "dropdown","dropdownlist" : []}

//   ],
//     "Memory" : [
// {"title" : "USA. unite","description" : "Details of use Use units","value" : "1234","valuetype" : "dropdown","dropdownlist" : []}

//   ]
// }
