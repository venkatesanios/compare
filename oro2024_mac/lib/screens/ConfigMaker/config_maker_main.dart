import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/ConfigMakerProvider/config_maker_main_provider.dart';
import 'configeMakerScreens/source_pump.dart';

class ConfigMaker extends StatefulWidget {
  const ConfigMaker({super.key});

  @override
  State<ConfigMaker> createState() => _ConfigMakerState();
}

class _ConfigMakerState extends State<ConfigMaker> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    final tabIndexProvider = Provider.of<ConfigMakerMainProvider>(context);

    return DefaultTabController(
      length: 11,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Config Maker'),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90.0),
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.background,
              child: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                onTap: (index) {
                  tabIndexProvider.updateTabIndex(index);
                },
                tabs: [
                  _buildTab('Start', '',Icons.play_circle_filled, 0),
                  _buildTab('Source', 'Pump', Icons.water, 1),
                  _buildTab('Irrigation', 'Pump', Icons.waterfall_chart, 2),
                  _buildTab('Central', 'Dosing', Icons.local_drink, 3),
                  _buildTab('Central', 'Filtration', Icons.filter_alt, 4),
                  _buildTab('Irrigation', 'Lines', Icons.timeline, 5),
                  _buildTab('Local','Dosing', Icons.local_hospital, 6),
                  _buildTab('Local', 'Filtration', Icons.filter_vintage, 7),
                  _buildTab('Mapping', 'of Outputs', Icons.track_changes, 8),
                  _buildTab('Mapping', 'of Inputs', Icons.compare_arrows, 9),
                  _buildTab('Finish', '',Icons.check_circle, 10),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Tab 1 Content'),
            ),
            SourcePump(),
            Center(
              child: Text('Tab 3 Content'),
            ),
            Center(
              child: Text('Tab 4 Content'),
            ),
            Center(
              child: Text('Tab 5 Content'),
            ),
            Center(
              child: Text('Tab 6 Content'),
            ),
            Center(
              child: Text('Tab 7 Content'),
            ),
            Center(
              child: Text('Tab 8 Content'),
            ),
            Center(
              child: Text('Tab 9 Content'),
            ),
            Center(
              child: Text('Tab 10 Content'),
            ),
            Center(
              child: Text('Tab 11 Content'),
            ),
          ],
        ),
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: (){},
        //       child: Icon(Icons.add),
        //     ),
        //     SizedBox(width: 20,),
        //     FloatingActionButton(
        //       onPressed: (){},
        //       child: Icon(Icons.batch_prediction),
        //     ),
        //     SizedBox(width: 20,),
        //     FloatingActionButton(
        //       onPressed: (){},
        //       child: Icon(Icons.delete),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildTab(String? label1, label2, IconData iconData, int tabIndex) {
    final tabIndexProvider = Provider.of<ConfigMakerMainProvider>(context);

    Color avatarColor = tabIndex == tabIndexProvider.selectedTabIndex
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).primaryColor;

    Color iconColor = tabIndex == tabIndexProvider.selectedTabIndex
        ? Theme.of(context).primaryColor
        : Theme.of(context).colorScheme.secondary;

    return Tab(
      height: 105,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: CircleAvatar(
              backgroundColor: avatarColor,
              child: Icon(iconData, color: iconColor),
            ),
          ),
          const SizedBox(height: 4),
          Text(label1!),
          SizedBox(height: 2,),
          Text(label2),
        ],
      ),
    );
  }
}
