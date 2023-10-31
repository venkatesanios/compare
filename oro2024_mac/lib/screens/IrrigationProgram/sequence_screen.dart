import 'package:flutter/material.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_list_tile.dart';
import 'package:oro2024_mac/utils/widgets/SCustomWidgets/custom_train_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';
import '../../utils/widgets/SCustomWidgets/custom_alert_dialog.dart';

class SequenceScreen extends StatefulWidget {
  const SequenceScreen({super.key});

  @override
  State<SequenceScreen> createState() => _SequenceScreenState();
}

class _SequenceScreenState extends State<SequenceScreen> {
  @override
  Widget build(BuildContext context) {
    final sequenceProvider = Provider.of<IrrigationProgramMainProvider>(context);
    final Map<int, GlobalKey> itemKeys = {};
    return Column(
      children: [
        const SizedBox(height: 10,),
        SizedBox(
          height: 60,
          child: sequenceProvider.sequencedValves.isNotEmpty
              ? ReorderableListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            onReorder: (oldIndex, newIndex) {
              sequenceProvider.reorderSelectedValves(oldIndex, newIndex);
            },
            proxyDecorator: (widget, animation, index) {
              return Transform.scale(
                scale: 1.2,
                child: widget,
              );
            },
            itemCount: sequenceProvider.sequencedValves.length,
            itemBuilder: (context, index) {
              final valveList = sequenceProvider.sequencedValves[index];
              final valveListAsString = valveList.join(' , ');
              final nonEmptyStrings = valveList.where((valve) => valve.isNotEmpty).toList();
              if (!itemKeys.containsKey(index)) {
                itemKeys[index] = GlobalKey();
              }

              return InkWell(
                key: itemKeys[index],
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      enableDrag: false,
                      isScrollControlled: true,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 20,),
                            IntrinsicWidth(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Theme.of(context).colorScheme.secondary,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Text(
                                      valveListAsString,
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Card(
                                surfaceTintColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: ListView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: ListTile.divideTiles(
                                    context: context,
                                      tiles: [
                                        ListTile(
                                          title: const Text('Select an option', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                          tileColor: Theme.of(context).primaryColor,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sequenceProvider.irrigationPump!.isNotEmpty,
                                          child: SizedBox(
                                            width: 120,
                                            child: CustomDropdownTile(
                                              subtitle: 'Irrigation Pumps',
                                              content: Icons.water,
                                              dropdownItems: sequenceProvider.irrigationPump
                                              !.map((e) => e.name)
                                                  .where((name) => name != null)
                                                  .cast<String>()
                                                  .toList(),
                                              selectedValue: 'None',
                                              onChanged: (newValue) => {},
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sequenceProvider.moistureSensor!.isNotEmpty,
                                          child: SizedBox(
                                            width: 120,
                                            child: CustomDropdownTile(
                                              subtitle: 'Moisture Sensors',
                                              content: Icons.water_drop,
                                              dropdownItems: sequenceProvider.moistureSensor!.map((e) => e.name)
                                                  .where((name) => name != null)
                                                  .cast<String>()
                                                  .toList(),
                                              selectedValue: 'None',
                                              onChanged: (newValue) => {},
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sequenceProvider.levelSensor!.isNotEmpty,
                                          child: SizedBox(
                                            width: 120,
                                            child: CustomDropdownTile(
                                              subtitle: 'Level Sensors',
                                              content: Icons.opacity,
                                              dropdownItems: sequenceProvider.levelSensor!.map((e) => e.name)
                                                  .where((name) => name != null)
                                                  .cast<String>()
                                                  .toList(),
                                              selectedValue: 'None',
                                              onChanged: (newValue) => {},
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sequenceProvider.conditions!.isNotEmpty,
                                          child: SizedBox(
                                            width: 120,
                                            child: CustomDropdownTile(
                                              subtitle: 'Conditions',
                                              content: Icons.fact_check,
                                              dropdownItems: sequenceProvider.conditions!.map((e) => e.name)
                                                  .where((name) => name != null)
                                                  .cast<String>()
                                                  .toList(),
                                              selectedValue: 'None',
                                              onChanged: (newValue) => {},
                                            ),
                                          ),
                                        ),
                                      ]
                                  ).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                                    fixedSize: MaterialStateProperty.all(const Size.fromWidth(100)),
                                  ),
                                  child: const Text('Cancel'),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),
                                    fixedSize: MaterialStateProperty.all(const Size.fromWidth(100)),
                                  ),
                                  child: const Text('Save'),
                                )
                              ],
                            ),
                            const SizedBox(height: 20,)
                          ],
                        );
                      });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        nonEmptyStrings.join(' , '),
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
              : const Center(child: Text('Select desired sequence')),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
            itemCount: sequenceProvider.lines?.length ?? 0,
            itemBuilder: (context, index) {
              final linesMap = sequenceProvider.lines?.asMap();
              if (linesMap != null && index < linesMap.length) {
                final entry = linesMap.entries.elementAt(index);
                final lineIndex = entry.key;
                final line = entry.value;

                return Column(
                  children: [
                    CustomTrainWidget(
                      title: line.name,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: line.value.length,
                          itemBuilder: (context, index) {
                            final valvesMap = line.value.asMap();
                            if(index < valvesMap.length) {
                              final valveEntry = valvesMap.entries.elementAt(index);
                              final valveIndex = valveEntry.key;
                              final valve = valveEntry.value;

                              return Row(
                                children: [
                                  InkWell(
                                      child: Card(
                                        shape: const CircleBorder(),
                                        elevation: 2,
                                        borderOnForeground: true,
                                        semanticContainer: true,
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: sequenceProvider.isSelected(valve, lineIndex)
                                              ? Theme.of(context).colorScheme.secondary
                                              : Colors.white,
                                          child: Center(child: Text('$valve', style: Theme.of(context).textTheme.bodyLarge))
                                        ),
                                      ),
                                      onTap: () {
                                        sequenceProvider.valveSelection(valve, lineIndex);
                                        if (sequenceProvider.isRecentlySelected) {
                                          showAdaptiveDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomAlertDialog(
                                                title: 'Warning',
                                                content: "Valve $valve of ${line.name} is recently added and it cannot be added again next to it",
                                                actions: [
                                                  TextButton(child: const Text("OK"), onPressed: () => Navigator.of(context).pop(),),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                  ),
                                  const SizedBox(width: 5,)
                                ],
                              );
                            } else {
                              return const Text('No Valves');
                            }
                          }
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,)
                  ],
                );
              } else {
                return const Text('No Name');
              }
            },
          ),
        ),
      ],
    );
  }
}
