import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/schedule_screen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/selection_screen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/sequence_screen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/testscreen.dart';
import 'package:oro2024_mac/screens/IrrigationProgram/water_fert_screen.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_alert_dialog.dart';
import 'package:provider/provider.dart';
import '../../provider/irrigation_program_main_provider.dart';
import '../../utils/widgets/SCustomWidgets/custom_overlay_widget.dart';
import '../../utils/widgets/SCustomWidgets/custom_tab.dart';
import 'alarm_screen.dart';
import 'conditions_screen.dart';

class IrrigationProgram extends StatefulWidget {
  const IrrigationProgram({super.key});
  @override
  State<IrrigationProgram> createState() => _IrrigationProgramState();
}

class _IrrigationProgramState extends State<IrrigationProgram>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isPressed = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(() {
      Provider.of<IrrigationProgramMainProvider>(context, listen: false).updateTabIndex(_tabController.index);});
    Provider.of<IrrigationProgramMainProvider>(context, listen: false).planningData();
    Provider.of<IrrigationProgramMainProvider>(context, listen: false).fetchData();
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

    final mainProvider = Provider.of<IrrigationProgramMainProvider>(context);
    int selectedIndex = mainProvider.selectedTabIndex;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Program'),
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
              width: double.infinity,
              color: Theme.of(context).colorScheme.background,
              child: TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: [
                  for (int i = 0; i < 7; i++)
                    CustomTab(
                      height: 80,
                      label: ['Sequence', 'Schedule', 'Conditions', 'Water & Fert', 'Selection', 'Alarm', 'Done'][i],
                      content: [
                        Icons.view_headline_rounded,
                        Icons.calendar_month,
                        Icons.fact_check,
                        Icons.local_florist_rounded,
                        Icons.checklist,
                        Icons.alarm_rounded,
                        Icons.done_rounded,
                      ][i],
                      tabIndex: i,
                      selectedTabIndex: mainProvider.selectedTabIndex,
                    ),
                ],
              ),
            ),
          ),
          actions: [
            if (selectedIndex == 0) ...[
              _buildIconButton(mainProvider.isSingleValveMode, Icons.fiber_manual_record_outlined, mainProvider.enableSingleValveMode),
              _buildIconButton(mainProvider.isMultipleValveMode, Icons.join_full_outlined, mainProvider.enableMultipleValveMode),
              _buildIconButton(mainProvider.isDelete, Icons.delete, mainProvider.deleteFunction),
              const SizedBox(width: 10),
            ],
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            SequenceScreen(),
            ScheduleScreen(),
            ConditionsScreen(),
            WaterAndFertScreen(),
            // SelectionScreen(),
            SelectionScreen(),
            AlarmScreen(),

            Center(child: Text('Tab 7 Content')),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(selectedIndex),
      ),
    );
  }

  Widget? _buildFloatingActionButton(int selectedIndex) {
    switch (selectedIndex) {
      case 6:
        return FloatingActionButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(Icons.send),
            ],
          ),
        );
      default:
        return null;
    }
  }

  Widget _buildIconButton(bool isActive, IconData iconData, VoidCallback onPressed) {
    final mainProvider = Provider.of<IrrigationProgramMainProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          if (iconData == Icons.delete) {
            showAdaptiveDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomAlertDialog(
                  title: 'Verify to delete',
                  content: 'Are you sure to erase the sequence?',
                  actions: [
                    TextButton(
                      child: const Text("CANCEL", style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        setState(() {
                          mainProvider.deleteButton();
                          Navigator.of(context).pop();
                          CustomOverlayWidget.showOverlay(context, "The sequence is erased!");
                        });
                      },
                    ),
                  ],
                );
              },
            );
          } else if (iconData == Icons.fiber_manual_record_outlined) {
            CustomOverlayWidget.showOverlay(context, "Single valve selection is enabled");
            onPressed();
          } else {
            CustomOverlayWidget.showOverlay(context, "Multiple valve selection is enabled");
            onPressed();
          }
        },
        icon: Icon(
          iconData,
          color: isActive ? Theme.of(context).primaryColor : Colors.white,
        ),
      ),
    );
  }
}
