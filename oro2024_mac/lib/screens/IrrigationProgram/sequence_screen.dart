import 'package:flutter/material.dart';
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

              return Card(
                key: itemKeys[index],
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
