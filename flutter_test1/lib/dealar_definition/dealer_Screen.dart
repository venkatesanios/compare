import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DealerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTabView(),
    );
  }
}

class MyTabView extends StatefulWidget {
  @override
  _MyTabViewState createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  List<String> gentrallist = [
    "Use USA units",
    "Water accumulation unit",
    "Cycles",
    "Priority",
    "Named groups",
    "Start together",
    "Dosage per area",
    "Evaporation control",
    "Notify about fertilizer left",
    "Accumulated radiation",
    "Special water before",
    "Use fertilizer sets",
  ];
  List<String> valvedefaultlist = [
    "Local fert mode liter/m3",
    "Local fert mode sec/min",
    "Local fert mode min.sec/m3",
    "Local fert mode min.sec/m3",
    "Local fert liter/min",
    "Local fert proportional",
  ];
  List<String> fertilizationlist = [
    "Local fert mode l/m3",
    "Local fert mode sec/min",
    "Local fert mode min sec/m3",
    "Local fert l/min",
    "Local fert proportional",
    "Local fert bulk by time",
    "Local fert bulk by volume",
    "Central fert mode l/m3",
    "Centrall fert mode sec/min",
    "Central fert mode min sec/m3",
    "Central fert l/min",
    "Central fert proportional",
  ];

  List<String> memorylist = [
    "Programs",
    "Groups",
    "Water jobs",
    "Fert jobs",
    "Reports",
    "Virtual water meter",
    "Condition",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dealer Definition'),
          bottom: TabBar(
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
        body: TabBarView(
          children: [
            buildTab('General'),
            buildTab('Fertilizer'),
            buildTab('Filter'),
            buildTab('Memory'),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String tabTitle) {
    int count = 0;
    List Listofvalue = [];
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
      itemCount: count, // Change this to the number of items you have.
      itemBuilder: (context, index) {
        if (index == 0) {
          String selectedDropdownValue = 'hh:mm:ss';
          // Include a dropdown for the first item.
          return ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('${Listofvalue[index]}'),
            subtitle: Text(
              'Details: ${Listofvalue[index]}',
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

                // Handle dropdown selection.
              },
              value: selectedDropdownValue, // Set the initial dropdown value.
            ),
          );
        } else if (index == 1) {
          return ListTile(
            leading: Icon(Icons.sports_baseball),
            title: Text('${Listofvalue[index]}'),
            subtitle: Text(
              'Details: ${Listofvalue[index]}',
              style: TextStyle(fontSize: 11),
            ),
            trailing: SizedBox(
              width: 150,
              child: TextField(
                decoration: InputDecoration(
                  labelText: '00',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.grey), // Specify your desired border color
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .blue), // Specify the border color when the field is focused
                  ),
                ),
                onChanged: (text) {
                  // Handle text input changes.
                },
              ),
            ),
          );
        } else {
          // Include a text input for other items.
          return ListTile(
            leading: Icon(Icons.abc_rounded),
            title: Text('${Listofvalue[index]}'),
            subtitle: Text(
              'Details: ${Listofvalue[index]}',
              style: TextStyle(fontSize: 11),
            ),
            trailing: Switch(
              value: false, // Change this value according to your switch logic.
              onChanged: (value) {
                // Implement your switch logic here.
              },
            ),
          );
        }
      },
    );
  }
}

// class _MyTabViewState extends State<MyTabView> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Dealer Definition'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'General'),
//               Tab(text: 'Fertilizer'),
//               Tab(text: 'Filter'),
//               Tab(text: 'Memory'),
//             ],
//           ),
//         ),
//         body: LayoutBuilder(
//           builder: (context, constraints) {
//             // if (constraints.maxWidth < 600) {
//             //   // For mobile screens, show a ListView with adaptive items.
//             //   return TabBarView(
//             //     children: [
//             //       buildTab('General'),
//             //       buildTab('Fertilizer'),
//             //       buildTab('Filter'),
//             //       buildTab('Memory'),
//             //     ],
//             //   );
//             // } else {
//             return Container(
//                 child: Column(
//               children: [
//                 Container(
//                   height: double.infinity,
//                   width: 300,
//                   child: ListView.builder(
//                     itemCount:
//                         10, // Change this to the number of items you have.
//                     itemBuilder: (context, index) {
//                       if (index == 0) {
//                         // Include a dropdown for the first item.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: DropdownButton<String>(
//                             items: ['Option 1', 'Option 2', 'Option 3']
//                                 .map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               // Handle dropdown selection.
//                             },
//                             value:
//                                 'Option 1', // Set the initial dropdown value.
//                           ),
//                         );
//                       } else if (index == 1) {
//                         // Include a switch for the second item.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: Switch(
//                             value:
//                                 false, // Change this value according to your switch logic.
//                             onChanged: (value) {
//                               // Implement your switch logic here.
//                             },
//                           ),
//                         );
//                       } else {
//                         // Include a text input for other items.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: SizedBox(
//                             width: 150,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Input',
//                                 border: OutlineInputBorder(),
//                               ),
//                               onChanged: (text) {
//                                 // Handle text input changes.
//                               },
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//                 Container(
//                   height: double.infinity,
//                   width: 300,
//                   child: ListView.builder(
//                     itemCount:
//                         10, // Change this to the number of items you have.
//                     itemBuilder: (context, index) {
//                       if (index == 0) {
//                         // Include a dropdown for the first item.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: DropdownButton<String>(
//                             items: ['Option 1', 'Option 2', 'Option 3']
//                                 .map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             onChanged: (String? newValue) {
//                               // Handle dropdown selection.
//                             },
//                             value:
//                                 'Option 1', // Set the initial dropdown value.
//                           ),
//                         );
//                       } else if (index == 1) {
//                         // Include a switch for the second item.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: Switch(
//                             value:
//                                 false, // Change this value according to your switch logic.
//                             onChanged: (value) {
//                               // Implement your switch logic here.
//                             },
//                           ),
//                         );
//                       } else {
//                         // Include a text input for other items.
//                         return ListTile(
//                           title: Text('tabTitle Item $index'),
//                           subtitle: Text('Subtitle for Item $index'),
//                           trailing: SizedBox(
//                             width: 150,
//                             child: TextField(
//                               decoration: InputDecoration(
//                                 labelText: 'Input',
//                                 border: OutlineInputBorder(),
//                               ),
//                               onChanged: (text) {
//                                 // Handle text input changes.
//                               },
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//                 ListView.builder(
//                   itemCount: 10, // Change this to the number of items you have.
//                   itemBuilder: (context, index) {
//                     if (index == 0) {
//                       // Include a dropdown for the first item.
//                       return ListTile(
//                         title: Text('tabTitle Item $index'),
//                         subtitle: Text('Subtitle for Item $index'),
//                         trailing: DropdownButton<String>(
//                           items: ['Option 1', 'Option 2', 'Option 3']
//                               .map((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                           onChanged: (String? newValue) {
//                             // Handle dropdown selection.
//                           },
//                           value: 'Option 1', // Set the initial dropdown value.
//                         ),
//                       );
//                     } else if (index == 1) {
//                       // Include a switch for the second item.
//                       return ListTile(
//                         title: Text('tabTitle Item $index'),
//                         subtitle: Text('Subtitle for Item $index'),
//                         trailing: Switch(
//                           value:
//                               false, // Change this value according to your switch logic.
//                           onChanged: (value) {
//                             // Implement your switch logic here.
//                           },
//                         ),
//                       );
//                     } else {
//                       // Include a text input for other items.
//                       return ListTile(
//                         title: Text('tabTitle Item $index'),
//                         subtitle: Text('Subtitle for Item $index'),
//                         trailing: SizedBox(
//                           width: 150,
//                           child: TextField(
//                             decoration: InputDecoration(
//                               labelText: 'Input',
//                               border: OutlineInputBorder(),
//                             ),
//                             onChanged: (text) {
//                               // Handle text input changes.
//                             },
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             )

//                 //[
//                 // SizedBox(
//                 //   width: 200, // Adjust the width as needed.
//                 //   child: TabBar(
//                 //     tabs: [
//                 //       Tab(text: 'General'),
//                 //       Tab(text: 'Fertilizer'),
//                 //       Tab(text: 'Filter'),
//                 //       Tab(text: 'Memory'),
//                 //     ],
//                 //   ),
//                 // ),

//                 //],
//                 );
//             // }
//           },
//         ),
//       ),
//     );
//   }

//   Widget buildTab(String tabTitle) {
//     return ListView.builder(
//       itemCount: 10, // Change this to the number of items you have.
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           // Include a dropdown for the first item.
//           return ListTile(
//             title: Text('$tabTitle Item $index'),
//             subtitle: Text('Subtitle for Item $index'),
//             trailing: DropdownButton<String>(
//               items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 // Handle dropdown selection.
//               },
//               value: 'Option 1', // Set the initial dropdown value.
//             ),
//           );
//         } else if (index == 1) {
//           // Include a switch for the second item.
//           return ListTile(
//             title: Text('$tabTitle Item $index'),
//             subtitle: Text('Subtitle for Item $index'),
//             trailing: Switch(
//               value: false, // Change this value according to your switch logic.
//               onChanged: (value) {
//                 // Implement your switch logic here.
//               },
//             ),
//           );
//         } else {
//           // Include a text input for other items.
//           return ListTile(
//             title: Text('$tabTitle Item $index'),
//             subtitle: Text('Subtitle for Item $index'),
//             trailing: SizedBox(
//               width: 150,
//               child: TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Input',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (text) {
//                   // Handle text input changes.
//                 },
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
