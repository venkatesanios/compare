import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oro2024_mac/model/valve_data.dart';

import 'controllers_location.dart';

class ControllerDashboardScreen3 extends StatefulWidget {
  const ControllerDashboardScreen3({super.key});

  @override
  State<ControllerDashboardScreen3> createState() => _ControllerDashboardScreen3State();
}

class _ControllerDashboardScreen3State extends State<ControllerDashboardScreen3> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> blinkAnimation;
  bool l1v1Switch = false;
  String dropdownValue = 'Manual';
  bool deviceList = true;
  bool mapScreen = false;

  Map<String, String> waterSources = {
    'WS1': 'Source A',
    'WS2': 'Source B',
    'WS3': 'Source C',
  };
  Map<String, String> waterPumps = {
    'P1': 'Pump 1',
    'P2': 'Pump 2',
    'P3': 'Pump 3',
  };
  Map<String, String> channels = {
    'C1': 'Channel 1',
    'C2': 'Channel 2',
    'C3': 'Channel 3',
  };
  Map<String, String> filters = {
    'F1': 'Filters 1',
    'F2': 'Filters 2',
    'F3': 'Filters 3',
  };

  List<String> activeWaterSources = [];
  List<String> activeWaterPumps = [];
  List<String> activeChannels = [];
  List<String> activeFilters = [];

  bool isBlinking = false;
  bool isLoading = true;

  // Simulating fetching active status from API
  void fetchActiveStatusFromAPI() {
    List<String> fetchedActiveSources = ['WS2'];
    List<String> fetchedActivePumps = ['P3'];
    List<String> fetchedActiveChannels = ['C2'];
    List<String> fetchedActiveFilters = ['F3'];

    setState(() {
      activeWaterSources = fetchedActiveSources;
      activeWaterPumps = fetchedActivePumps;
      activeChannels = fetchedActiveChannels;
      activeFilters = fetchedActiveFilters;
    });
  }

  List<ValveData> deviceDataList = [];

  Future<void> fetchDataFromAPI() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });

    // Example data fetched from API
    List<ValveData> fetchedData = [
      ValveData(
        name: 'Valve 01',
        description: 'Coconut tree',
        status: DeviceStatus.running,
        setTime: '00:10:00',
        remTime: '00:00:00',
        setFlow: '10 m³/h',
        remFlow: '00 m³/h',
        switchState: DeviceStatus.running,
      ),
      ValveData(
        name: 'Valve 02',
        description: 'Coconut tree',
        status: DeviceStatus.error,
        setTime: '15:00:00',
        remTime: '15:00:00',
        setFlow: '30 m³/h',
        remFlow: '30 m³/h',
        switchState: DeviceStatus.error,
      ),
      ValveData(
        name: 'Valve 03',
        description: 'Coconut tree',
        status: DeviceStatus.notSet,
        setTime: '00:00:00',
        remTime: '00:00:00',
        setFlow: '00 m³/h',
        remFlow: '00 m³/h',
        switchState: DeviceStatus.notSet,
      ),
      ValveData(
        name: 'Valve 04',
        description: 'Coconut tree',
        status: DeviceStatus.completed,
        setTime: '00:00:00',
        remTime: '00:00:00',
        setFlow: '00 m³/h',
        remFlow: '00 m³/h',
        switchState: DeviceStatus.completed,
      ),
      ValveData(
        name: 'Valve 05',
        description: 'Coconut tree',
        status: DeviceStatus.running,
        setTime: '00:00:00',
        remTime: '00:00:00',
        setFlow: '00 m³/h',
        remFlow: '00 m³/h',
        switchState: DeviceStatus.running,
      ),
      ValveData(
        name: 'Valve 06',
        description: 'Coconut tree',
        status: DeviceStatus.upcoming,
        setTime: '00:00:00',
        remTime: '00:00:00',
        setFlow: '00 m³/h',
        remFlow: '00 m³/h',
        switchState: DeviceStatus.upcoming,
      ),
    ];

    setState(() {
      deviceDataList = fetchedData;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    blinkAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
    fetchActiveStatusFromAPI();
    fetchDataFromAPI();
    fetchDeviceLocations();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        isBlinking = !isBlinking;
      });
    });

  }

  int? selectedValue = 1;

  Future<void> fetchDeviceLocations() async {
    List<DeviceLocation> dummyDeviceLocations = [
      DeviceLocation(deviceId: 'Device1', latitude: 37.7749, longitude: -122.4194),
      DeviceLocation(deviceId: 'Device2', latitude: 34.0522, longitude: -118.2437),
      DeviceLocation(deviceId: 'Device3', latitude: 40.7128, longitude: -74.0060),
      // Add more device locations as needed
    ];
    // final response = await http.get('YOUR_API_ENDPOINT_HERE');
    //
    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   // Assuming data is a list of devices with latitude and longitude properties
    //   for (var device in data) {
    //     final marker = Marker(
    //       markerId: MarkerId(device['deviceId']),
    //       position: LatLng(device['latitude'], device['longitude']),
    //       // You can customize the marker's appearance here
    //     );
    //     _markers.add(marker);
    //   }
    //   setState(() {});
    // } else {
    //   throw Exception('Failed to load device locations');
    // }
  }

  void handleRadioValueChanged(int? value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));

    // GoogleMapController? _controller;
    // Set<Marker> _markers = {};

    List<String> orderedKeys = waterSources.keys.toList();
    orderedKeys.removeWhere((key) => activeWaterSources.contains(key));
    orderedKeys.insertAll(0, activeWaterSources);

    List<String> pumpOrderedKeys = waterPumps.keys.toList();
    pumpOrderedKeys.removeWhere((key) => activeWaterPumps.contains(key));
    pumpOrderedKeys.insertAll(0, activeWaterPumps);

    List<String> channelOrderKeys = channels.keys.toList();
    channelOrderKeys.removeWhere((key) => activeChannels.contains(key));
    channelOrderKeys.insertAll(0, activeChannels);

    List<String> filtersOrderKeys = filters.keys.toList();
    filtersOrderKeys.removeWhere((key) => activeFilters.contains(key));
    filtersOrderKeys.insertAll(0, activeFilters);

    orderedKeys.addAll(pumpOrderedKeys);
    orderedKeys.addAll(channelOrderKeys);
    orderedKeys.addAll(filtersOrderKeys);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ORO GEM'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: fetchActiveStatusFromAPI,
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            color: deviceList ? Theme.of(context).primaryColor : null,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!deviceList) {
                                  deviceList = true;
                                  mapScreen = false;
                                }
                              });
                            },
                            icon: Icon(Icons.view_list, color: deviceList ? Theme.of(context).colorScheme.secondary : null),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                            color: mapScreen ? Theme.of(context).primaryColor : null,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (!mapScreen) {
                                  mapScreen = true;
                                  deviceList = false;
                                }
                              });
                            },
                            icon: Icon(Icons.map_outlined, color: mapScreen ? Theme.of(context).colorScheme.secondary : null),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButton<String>(
                        underline: Container(),
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Manual',
                          'Program 1',
                          'Program 2',
                          'Banana South',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Card(
                  surfaceTintColor: Colors.white,
                  child: SizedBox(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb_rounded, color: Theme.of(context).colorScheme.secondary,),
                          Icon(Icons.lightbulb_rounded, color: Theme.of(context).colorScheme.secondary,),
                          const Icon(Icons.lightbulb_outline)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: deviceList,
              child: Flexible(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            spreadRadius:0,
                          ),
                        ],
                        color: Colors.white,

                      ),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: 80,
                        ),
                        itemCount: orderedKeys.length,
                        itemBuilder: (context, index) {
                          String key = orderedKeys[index];
                          String? value;

                          if (waterSources.containsKey(key)) {
                            value = waterSources[key];
                          } else if (waterPumps.containsKey(key)) {
                            value = waterPumps[key];
                          }else if (channels.containsKey(key)) {
                            value = channels[key];
                          }else if (filters.containsKey(key)) {
                            value = filters[key];
                          }

                          bool isActiveWaterSource = activeWaterSources.contains(key);
                          bool isActiveWaterPump = activeWaterPumps.contains(key);
                          bool isActiveChannels = activeChannels.contains(key);
                          bool isActiveFilters = activeFilters.contains(key);

                          return buildAvatarColumn(isActiveWaterSource || isActiveWaterPump  || isActiveChannels || isActiveFilters, value, key, context);
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 1,
                              groupValue: selectedValue,
                              onChanged: handleRadioValueChanged,
                            ),
                            const Text('Default'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 2,
                              groupValue: selectedValue,
                              onChanged: handleRadioValueChanged,
                            ),
                            const Text('Time'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                              value: 3,
                              groupValue: selectedValue,
                              onChanged: handleRadioValueChanged,
                            ),
                            const Text('Flow'),
                          ],
                        ),            ],
                    ),
                    Row(
                      children: [
                        // Container(height: 2, width: 30, color: Theme.of(context).primaryColor,),
                        Expanded(
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Line 1', style: TextStyle(fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight, fontSize: 19),),
                                Column(
                                  children: [
                                    const Icon(Icons.input),
                                    Text('0.5 bar', style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Icon(Icons.output),
                                    Text('0.5 bar', style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if(selectedValue == 2)
                          Row(
                            children: [
                              Text('Total : ', style: Theme.of(context).textTheme.bodyMedium),
                              Text('01:00:00', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        if(selectedValue == 2)
                          Row(
                            children: [
                              Text('Rem : ', style: Theme.of(context).textTheme.bodyMedium),
                              Text('00:45:00', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        if(selectedValue == 3)
                          Row(
                            children: [
                              Text('Total : ', style: Theme.of(context).textTheme.bodyMedium),
                              Text('500 m³/h', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                        if(selectedValue == 3)
                          Row(
                            children: [
                              Text('Rem : ', style: Theme.of(context).textTheme.bodyMedium),
                              Text('100 m³/h', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                      ],
                    ),
                    if(selectedValue == 2 || selectedValue == 3)
                      const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: deviceDataList.length,
                        itemBuilder: (context, index) {
                          final deviceData = deviceDataList[index];

                          return Column(
                              children: [
                                buildDeviceCard(deviceData, context),
                                if(index == deviceDataList.length - 1)
                                  const SizedBox(height: 70,)
                              ]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Visibility(
            //   visible: mapScreen,
            //   child: Expanded(
            //     child: GoogleMap(
            //     onMapCreated: (controller) {
            //       setState(() {
            //         _controller = controller;
            //       });
            //     },
            //     initialCameraPosition: CameraPosition(
            //       target: LatLng(0.0, 0.0), // Initial map location
            //       zoom: 10.0, // Initial zoom level
            //     ),
            //     markers: _markers,
            // ),
            //   ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  Widget buildAvatarColumn(bool isActive, String? value, String key, BuildContext context) {
    Widget icon;
    if (waterSources.containsKey(key)) {
      icon = Icon(
        Icons.water_outlined,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (waterPumps.containsKey(key)) {
      icon = Icon(
        Icons.local_drink,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (channels.containsKey(key)) {
      icon = Icon(
        Icons.propane_tank,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else if (filters.containsKey(key)) {
      icon = Icon(
        Icons.filter_alt_rounded,
        color: isActive
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.secondary,
        size: isActive ? 24.0 * blinkAnimation.value : 24.0,
      );
    } else {
      icon = const Icon(Icons.error);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isActive
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).primaryColor,
            child: icon,
          ),
          Center(
            child: Text(
              '$value',
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDeviceCard(ValveData deviceData, BuildContext context) {
    double progress = 0.0;

    if (deviceData.status == DeviceStatus.running) {
      // Calculate progress as a percentage
      DateTime setTime = DateTime.parse('2023-09-02 ${deviceData.setTime}');
      DateTime remTime = DateTime.parse('2023-09-02 ${deviceData.remTime}');
      DateTime currentTime = DateTime.now();

      if (remTime.isAfter(setTime) && currentTime.isAfter(setTime)) {
        double totalTime = remTime.difference(setTime).inMilliseconds.toDouble();
        double elapsedTime = currentTime.difference(setTime).inMilliseconds.toDouble();
        progress = (elapsedTime / totalTime).clamp(0.0, 1.0);
      }
    }

    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    color: getColorForStatus(deviceData.status),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/valve.png',
                          height: 40,
                          width: 40,
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Text(deviceData.name),
                            Text(deviceData.description),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        if (selectedValue == 1)
                          Switch(
                            value: (deviceData.switchState == DeviceStatus.running) ? true : false,
                            onChanged: (newValue) {
                              setState(() {
                                newValue = l1v1Switch;
                              });
                            },
                          ),
                        if (selectedValue == 2)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('ST : ', style: Theme.of(context).textTheme.bodyMedium,),
                                  Text(deviceData.setTime, style: Theme.of(context).textTheme.bodyLarge,),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('RT : ', style: Theme.of(context).textTheme.bodyMedium,),
                                  Text(deviceData.remTime,
                                    style: TextStyle(
                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                        color: getColorForStatus(deviceData.status),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (selectedValue == 3)
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text('SF : ', style: Theme.of(context).textTheme.bodyMedium,),
                                  Text(deviceData.setFlow, style: Theme.of(context).textTheme.bodyLarge,),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('RF : ', style: Theme.of(context).textTheme.bodyMedium,),
                                  Text(deviceData.remFlow,
                                    style: TextStyle(
                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                        color: getColorForStatus(deviceData.status),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        // if (selectedValue == 2)
                        //   CircularProgressIndicator(
                        //     value: progress,
                        //     valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        //   ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }

}
