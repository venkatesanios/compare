import 'package:flutter/material.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_drop_down.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_list_tile.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_train_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';
import '../../utils/widgets/SCustomWidgets/custom_date_picker.dart';
import '../../utils/widgets/SCustomWidgets/custom_tab.dart';
import '../../utils/widgets/SCustomWidgets/custom_text_container.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    final scheduleProvider = Provider.of<IrrigationProgramMainProvider>(context, listen: false);

    scheduleProvider.updateRtcIndex(0);
    _tabController = TabController(
      length: scheduleProvider.rtc.asMap().entries.fold<int>(0, (totalLength, rtcEntry) => totalLength + rtcEntry.value.keys.length,),
      vsync: this,
    )..addListener(() {
      scheduleProvider.updateRtcIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = Provider.of<IrrigationProgramMainProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: DropdownButton(
            underline: Container(),
            items: scheduleProvider.scheduleTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value)),
              );
            }).toList(),
            value: scheduleProvider.selectedScheduleType,
            onChanged: (newValue) => scheduleProvider.updateSelectedValue(newValue),
          ),
        ),
        const SizedBox(height: 10,),
        if(scheduleProvider.selectedScheduleType != scheduleProvider.scheduleTypes[0])
          Expanded(
            child: Column(
              children: [
                CustomTrainWidget(
                  title: 'RTC',
                  child: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    tabs: scheduleProvider.rtc.asMap().entries.expand((rtcEntry) {
                      final int tabIndex = rtcEntry.key;
                      final List<String> rtcNames = rtcEntry.value.keys.toList();
                      return rtcNames.map((rtcName) {
                        final int rtcIndex = rtcNames.indexOf(rtcName);
                        return CustomTab(
                          height: 65,
                          radius: 25,
                          content: (rtcIndex + 1).toString(),
                          tabIndex: rtcIndex,
                          selectedTabIndex: scheduleProvider.selectedRtcIndex,
                        );
                      });
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: scheduleProvider.rtc.asMap().entries.expand((rtcEntry) {
                      final int tabIndex = rtcEntry.key;
                      final List<String> rtcNames = rtcEntry.value.keys.toList();

                      return rtcNames.map((rtcName) {
                        final int rtcIndex = rtcNames.indexOf(rtcName);
                        final onTime = rtcEntry.value[rtcName]['onTime'] ?? '00:00';
                        final offTime = rtcEntry.value[rtcName]['offTime'] ?? '00:00';
                        final interval = rtcEntry.value[rtcName]['interval'] ?? '00:00';
                        final noOfCycles = rtcEntry.value[rtcName]['noOfCycles'] ?? '00';
                        final maximumTime = rtcEntry.value[rtcName]['maximumTime'] ?? '00:00';
                        final condition = rtcEntry.value[rtcName]['condition'] ?? false;
                        return ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          children: [
                            Text(rtcName),
                            ...ListTile.divideTiles(
                                context: context,
                                tiles: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                                    ),
                                    child: CustomTimerTile(
                                      subtitle: 'RTC ON TIME',
                                      initialValue: onTime != '' ? onTime : '00:00',
                                      onChanged: (newTime){},
                                      isSeconds: false,
                                      is24HourMode: false,
                                      icon: Icons.timer_outlined,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: CustomTimerTile(
                                      subtitle: 'RTC OFF TIME',
                                      initialValue: offTime != '' ? offTime : '00:00',
                                      onChanged: (newTime){},
                                      isSeconds: false,
                                      is24HourMode: false,
                                      icon: Icons.timer_off_outlined,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: CustomTimerTile(
                                      subtitle: 'INTERVAL',
                                      initialValue: interval != '' ? interval : '00:00',
                                      onChanged: (newTime){},
                                      isSeconds: true,
                                      icon: Icons.av_timer_outlined,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: CustomTextFormTile(
                                      subtitle: 'NO OF CYCLES',
                                      hintText: noOfCycles,
                                      onChanged: (newValue){},
                                      icon: Icons.safety_check,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
                                    ),
                                    child: CustomTimerTile(
                                      subtitle: 'MAXIMUM TIME',
                                      initialValue: maximumTime != '' ? maximumTime : '00:00',
                                      onChanged: (newTime){},
                                      isSeconds: true,
                                      icon: Icons.fact_check
                                    ),
                                  ),
                                ]
                            ).toList(),
                            const SizedBox(height: 30,),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: CustomTile(
                                subtitle: 'Set all days',
                                content: '',
                                leading: const SizedBox.shrink(),
                                trailing: SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      for(int i = 0; i < 4; i++)
                                        CircleAvatar(
                                          radius: 22,
                                          child: IconButton(
                                            icon: Icon([
                                              Icons.playlist_remove_outlined,
                                              Icons.timer, Icons.water_drop,
                                              Icons.local_florist_rounded,][i],
                                              color: Colors.white,
                                            ), onPressed: () {  },
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            ...ListTile.divideTiles(
                                context: context,
                                tiles: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                    ),
                                    child: CustomTextFormTile(
                                      subtitle: 'NO OF DAYS',
                                      hintText: '00',
                                      onChanged: (newValue){},
                                      icon: Icons.format_list_numbered,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.white,
                                    child: CustomTile(
                                      subtitle: 'Start date',
                                      content: Icons.calendar_month,
                                      trailing: IntrinsicWidth(
                                          child: DatePickerField(value: DateTime.now(),
                                            onChanged: (newDate ) => print(newDate),
                                          )
                                      ),
                                    ),
                                  )
                                ]
                            ).toList(),
                          ]
                        );
                      });
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
