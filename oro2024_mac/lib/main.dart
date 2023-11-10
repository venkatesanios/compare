import 'package:flutter/material.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/alert.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/filtersettings.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/multiselection.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/selection_screen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/testscreen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/vitual_meter_screen.dart';
import 'package:oro2024_mac/screens/config_maker/config_maker.dart';
import 'package:oro2024_mac/services/mqtt.dart';
import 'package:oro2024_mac/provider/ConfigMakerProvider/product_limit_provider.dart';
import 'package:oro2024_mac/provider/irrigation_program_main_provider.dart';
import 'package:oro2024_mac/provider/data_acquisition_provider.dart';
import 'package:oro2024_mac/provider/preferences_screen_main_provider.dart';
import 'package:oro2024_mac/screens/DataAcquisition/data_acquisition_main.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/irrigation_program_main.dart';
import 'package:oro2024_mac/screens/PreferencesScreens/preference_main_screen.dart';
import 'package:oro2024_mac/screens/SharedDevice.dart';
import 'package:oro2024_mac/state_management/config_maker_provider.dart';
import 'package:oro2024_mac/state_management/create_account_provide.dart';
import 'package:oro2024_mac/state_management/customer_device_provider.dart';
import 'package:oro2024_mac/state_management/device_list_provider.dart';
import 'package:oro2024_mac/state_management/sell_device_provider.dart';
import 'package:oro2024_mac/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  final MqttService mqttService = MqttService();
  mqttService.initMqtt();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CreateActProvider()),
      ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
      ChangeNotifierProvider(create: (context) => SellDeviceProvider()),
      ChangeNotifierProvider(create: (context) => DeviceListViewModel()),
      ChangeNotifierProvider(create: (context) => DeviceListProvider()),
      ChangeNotifierProvider(create: (context) => ConfigMakerProvider()),
      // ChangeNotifierProvider(create: (context) => MqttProvider(mqttClient: mqtt)),
      ChangeNotifierProvider(create: (context) => IrrigationProgramMainProvider()),
      ChangeNotifierProvider(create: (context) => PreferencesMainProvider()),
      ChangeNotifierProvider(create: (context) => DataAcquisitionProvider()),
      ChangeNotifierProvider(create: (context) => ProductLimitProvider()),
      ChangeNotifierProvider(create: (context) => SelectedListProvider()),
      // ChangeNotifierProvider(create: (context) => SelectionModelProvider())
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORO DRIP IRRIGATION',
      theme: myTheme,
      // home: const SplashScreen(),
      // home: const DeviceListScreen(),
      // home: ConfigMakerScreen(),
      // home: HomeScreen(),
      // home: SellDevice(purpose: '', title: '',),
      // home: const IrrigationProgram(),
      // home: const PreferencesScreen(),
      // home: const DataAcquisitionMain(),
      // home: const ProductLimitScreen(),
      // home:  FilterSettingScreenWidget(),
      home: VirtualwaterMeterUI(),
    );
  }
}
