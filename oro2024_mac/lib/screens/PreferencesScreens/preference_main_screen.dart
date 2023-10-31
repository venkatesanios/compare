import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oro2024_mac/screens/PreferencesScreens/pump_screen.dart';
import 'package:oro2024_mac/screens/PreferencesScreens/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/preferences_screen_main_provider.dart';
import '../../services/http_service.dart';
import '../../services/mqtt.dart';
import '../../utils/widgets/SCustomWidgets/custom_tab.dart';
import 'contact_screen.dart';
import 'general_screen.dart';
import 'notification_screen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});
  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final HttpService httpService = HttpService();
  bool isScreenSizeLarge = false;
  final MqttService mqttService = MqttService();

  @override
  void initState() {
    super.initState();
    final preferencesMainProvider = Provider.of<PreferencesMainProvider>(context, listen: false);
    preferencesMainProvider.preferencesDataFromApi();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      preferencesMainProvider.updateTabIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    final preferencesProvider = Provider.of<PreferencesMainProvider>(context);
    final width = MediaQuery.of(context).size.width;
    isScreenSizeLarge = width >= 500;

    if(preferencesProvider.configuration != null){
      return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Preferences'),
            centerTitle: false,
            bottom: !isScreenSizeLarge
                ? PreferredSize(
              preferredSize: const Size.fromHeight(80.0),
              child: Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.background,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: !isScreenSizeLarge,
                  tabs: [
                    for (int i = 0; i < 5; i++)
                      CustomTab(
                        height: 80,
                        label: ['General', 'Contact', 'Pump', 'Settings', 'Notifications'][i],
                        content: [
                          Icons.settings_rounded,
                          Icons.connect_without_contact_rounded,
                          Icons.waterfall_chart_rounded,
                          Icons.settings_applications_rounded,
                          Icons.notifications_rounded
                        ][i],
                        tabIndex: i,
                        selectedTabIndex: preferencesProvider.selectedTabIndex,
                      ),
                  ],
                ),
              ),
            ) : null,
          ),
          body: Row(
            children: <Widget>[
              if (isScreenSizeLarge)
                Container(
                  width: (isScreenSizeLarge) ? 250 : 150,
                  child: Drawer(
                    child: ListView(
                      children: <Widget>[
                        for (int i = 0; i < 5; i++)
                          ListTile(
                            title: Text(
                              ['General', 'Contact', 'Pump', 'Settings', 'Notifications'][i],
                              style: TextStyle(color: _tabController.index == i ? Colors.white : null),
                            ),
                            leading: isScreenSizeLarge
                                ? Icon(
                              [
                                Icons.settings_rounded,
                                Icons.connect_without_contact_rounded,
                                Icons.waterfall_chart_rounded,
                                Icons.settings_applications_rounded,
                                Icons.notifications_rounded,
                              ][i],
                              color: _tabController.index == i ? Colors.white : null,
                            )
                                : null,
                            onTap: () {
                              _navigateToTab(i);
                            },
                            selected: _tabController.index == i,
                            selectedTileColor: _tabController.index == i ? Theme.of(context).primaryColor : null,
                          ),
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    GeneralScreen(),
                    ContactsScreen(),
                    PumpScreen(),
                    SettingsScreen(),
                    NotificationScreen(),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final dataToSend = Provider.of<PreferencesMainProvider>(context, listen: false).configuration;
              Map<String, dynamic> userData = {
                "userId": 8,
                "controllerId": 1,
                "createUser": 1
              };
              userData.addAll(dataToSend!.toJson());
              print(dataToSend.toMqtt());
              // print(userData);
              // print(dataToSend.eventNotifications.map((e) => e.value));
              mqttService.publish('get-tweet-response/86418005321234', '${dataToSend.toMqtt()}');
              try {
                final createUserPreference = await httpService.postRequest('createUserPreference', userData);
                final message = jsonDecode(createUserPreference.body);
                print(createUserPreference.body);
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
            child: Icon(Icons.send),
          ),
        ),
      );
    }
    else {
      return const Center(
        child: CircularProgressIndicator()
      );
    }
  }

  void _navigateToTab(int tabIndex) {
    if (_tabController.index != tabIndex) {
      _tabController.animateTo(tabIndex);
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
