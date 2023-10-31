import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControllerDashboardScreen2 extends StatefulWidget {
  const ControllerDashboardScreen2({super.key});

  @override
  State<ControllerDashboardScreen2> createState() => _ControllerDashboardScreen2State();
}

class _ControllerDashboardScreen2State extends State<ControllerDashboardScreen2> with SingleTickerProviderStateMixin{
  String dropdownValue = 'Manual';
  bool deviceList = true;
  bool mapScreen = false;
  final int itemsPerPage = 3;
  int currentPageIndex = 0;

  Map<String, String> waterSources = {
    'WS1': 'Source A',
    'WS2': 'Source B',
    'WS3': 'Source C',
    'WS4': 'Source D',
    'WS5': 'Source E',
    'WS6': 'Source F',
  };

  List<String> activeWaterSources = [];
  bool isBlinking = false;

  // Simulating fetching active status from API
  void fetchActiveStatusFromAPI() {
    List<String> fetchedActiveSources = ['WS2'];
    setState(() {
      activeWaterSources = fetchedActiveSources;
    });
  }

  Map<String, String> pumps = {
    'P1': 'Pump 1',
    'P2': 'Pump 2',
    'P3': 'Pump 3',
    'P4': 'Pump 4',
    'P5': 'Pump 5',
    'P6': 'Pump 6',
  };

  @override
  void initState() {
    fetchActiveStatusFromAPI();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        isBlinking = !isBlinking;
      });
    });

    super.initState();
  }

  void handleScroll(double scrollPosition) {
    setState(() {
      currentPageIndex = (scrollPosition / MediaQuery.of(context).size.width).round();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    List<String> orderedKeys = waterSources.keys.toList();
    orderedKeys.removeWhere((key) => activeWaterSources.contains(key));
    orderedKeys.insertAll(0, activeWaterSources);

    int totalPages = (waterSources.length / itemsPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ORO GEM'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: fetchActiveStatusFromAPI,
              icon: const Icon(Icons.refresh)),
          IconButton(onPressed: () {  },
              icon: const Icon(Icons.settings)),
          IconButton(onPressed: () {  },
              icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
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
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    surfaceTintColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      height: 140,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.secondary,
                                    child: Icon(Icons.water_outlined, color: Theme.of(context).primaryColor),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Text('Available Water sources', style: Theme.of(context).textTheme.bodyLarge,)
                              ],
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              itemCount: totalPages,  // Update itemCount
                              itemBuilder: (context, pageIndex) {
                                int startIndex = pageIndex * itemsPerPage;
                                int endIndex = (startIndex + itemsPerPage) <= orderedKeys.length
                                    ? (startIndex + itemsPerPage)
                                    : orderedKeys.length;

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(endIndex - startIndex, (index) {
                                    int sourceIndex = startIndex + index;
                                    String key = orderedKeys[sourceIndex];
                                    String? value = waterSources[key];
                                    bool isActive = activeWaterSources.contains(key);

                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          height: isActive ? (isBlinking ? 50 : 40) : 40,
                                          decoration: BoxDecoration(
                                            color: isActive
                                                ? Theme.of(context).colorScheme.secondary
                                                : Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$value',
                                              style: TextStyle(
                                                color: isActive ? Colors.black : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                              onPageChanged: (index) {
                                setState(() {
                                  currentPageIndex = index;
                                });
                              },
                            ),
                          ),
                          buildPageIndicator(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPageIndicator() {
    int totalPages = (waterSources.length / itemsPerPage).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPageIndex == index ? Theme.of(context).primaryColor : Colors.grey,
            ),
          ),
        );
      }),
    );
  }
}
