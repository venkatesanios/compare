import 'package:flutter/material.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_list_tile.dart';
 import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    final alarmProvider = Provider.of<IrrigationProgramMainProvider>(context);

    final items = {
      'general': [
        {
          'title': 'High flow',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {'title': 'Low flow', 'delayTime': '', 'irrigation': '', 'dosing': '',},
        {'title': 'No flow', 'delayTime': '', 'irrigation': '', 'dosing': '',},
        {
          'title': 'Dose channel leakage',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Dose channel fault',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'External pause',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Dosing booster protection',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Low pressure',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'RTU error',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Host error',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
      ],
      'ec/ph': [
        {
          'title': 'High flow',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Low flow',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'No flow',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Dose channel leakage',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Dose channel fault',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'External pause',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Dosing booster protection',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Low pressure',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'RTU error',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
        {
          'title': 'Host error',
          'delayTime': '',
          'irrigation': '',
          'dosing': '',
        },
      ]
    };

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      itemCount: items['general']?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: ListTile.divideTiles(
              context: context,
              tiles: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: (index == 0)
                          ? BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
                          : (index == (items['general']!.length - 1))
                          ? BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15))
                          : BorderRadius.zero
                  ),
                  child: CustomCheckBoxListTile(
                    subtitle: (items['general']![index]['title']!),
                    value: false,
                    onChanged: (newValue) {  },
                  ),
                )
              ]
          ).toList(),
        );
      },
    );
  }
}
