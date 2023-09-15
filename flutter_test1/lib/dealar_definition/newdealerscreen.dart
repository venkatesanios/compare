import 'package:flutter/material.dart';

class DealerScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabView(),
    );
  }
}

class MyTabView extends StatefulWidget {
  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dealer Definition'),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //       text: 'General',
        //       icon: Icon(Icons.ac_unit),
        //     ),
        //     Tab(
        //       text: 'Fertilizer',
        //       icon: Icon(Icons.free_breakfast),
        //     ),
        //     Tab(
        //       text: 'Valve default',
        //       icon: Icon(Icons.file_download_rounded),
        //     ),
        //     Tab(
        //       text: 'Memory',
        //       icon: Icon(Icons.memory),
        //     ),
        //   ],
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          child: GridView(children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          color: const Color.fromARGB(255, 177, 215, 246),
                          child: Text('General')),
                      Divider(height: 5),
                      Container(
                          width: 300, height: 450, child: buildTab('General')),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          color: const Color.fromARGB(255, 177, 215, 246),
                          child: Text('Fertilizer')),
                      Divider(height: 5),
                      Container(
                          width: 300,
                          height: 450,
                          child: buildTab('Fertilizer')),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          color: const Color.fromARGB(255, 177, 215, 246),
                          child: Text('Filter')),
                      Divider(height: 5),
                      Container(
                          width: 300, height: 450, child: buildTab('Filter')),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                          color: const Color.fromARGB(255, 177, 215, 246),
                          child: Text('Memory')),
                      Divider(height: 5),
                      Container(
                          width: 300, height: 450, child: buildTab('Memory')),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Color getTileColor(int index) {
    final Color oddColor = const Color.fromARGB(255, 202, 231, 254);
    final Color evenColor = Color.fromARGB(255, 185, 221, 253);

    return index.isOdd ? oddColor : evenColor;
  }

  Widget buildTab(String tabTitle) {
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
    return ListView.builder(
      itemCount: Listofvalue.length,
      itemBuilder: (context, index) {
        oddeven = index.isEven ? 0 : 1;
        if (Listofvalue[index]['type'] == '1') {
          String selectedDropdownValue = 'hh:mm:ss';
          return Column(
            children: [
              Container(
                color: index.isEven
                    ? Color.fromARGB(255, 223, 239, 252)
                    : Color.fromARGB(255, 192, 216, 252),
                child: ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text('${Listofvalue[index]['name']}'),
                  subtitle: Text(
                    'Details: ${Listofvalue[index]['name']}',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: DropdownButton<String>(
                    items: ['hh:mm:ss', 'm3', 'Lts/h'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDropdownValue = newValue!;
                      });
                    },
                    value: selectedDropdownValue,
                  ),
                ),
              ),
            ],
          );
        } else if (Listofvalue[index]['type'] == '2') {
          return Column(
            children: [
              Container(
                color: index.isEven
                    ? Color.fromARGB(255, 223, 239, 252)
                    : Color.fromARGB(255, 192, 216, 252),
                child: ListTile(
                  leading: Icon(Icons.sports_baseball),
                  title: Text('${Listofvalue[index]['name']}'),
                  subtitle: Text(
                    'Details: ${Listofvalue[index]['name']}',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: SizedBox(
                    width: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '00',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      onChanged: (text) {},
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Container(
                color: index.isEven
                    ? Color.fromARGB(255, 223, 239, 252)
                    : Color.fromARGB(255, 192, 216, 252),
                child: ListTile(
                  leading: Icon(Icons.abc_rounded),
                  title: Text('${Listofvalue[index]['name']}'),
                  subtitle: Text(
                    'Details: ${Listofvalue[index]['name']}',
                    style: TextStyle(fontSize: 11),
                  ),
                  trailing: Switch(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
