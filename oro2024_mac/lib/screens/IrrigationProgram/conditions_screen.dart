import 'package:flutter/material.dart';
import 'package:oro2024_mac/provider/irrigation_program_main_provider.dart';
 import 'package:provider/provider.dart';

 import '../../utils/widgets/SCustomWidgets/custom_text_container.dart';
import '../../utils/widgets/SCustomWidgets/custom_train_widget.dart';

class ConditionsScreen extends StatefulWidget {
  const ConditionsScreen({Key? key});

  @override
  State<ConditionsScreen> createState() => _ConditionsScreenState();
}

class _ConditionsScreenState extends State<ConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final conditionsProvider = Provider.of<IrrigationProgramMainProvider>(context);

    return ListView(
      children: [
        SizedBox(height: 10,),
        CustomTextContainer(
          text: 'SELECT CONDITIONS FOR PROGRAM',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(height: 10),
       ...conditionsProvider.conditionsType.asMap().entries.map((entry) {
         final conditionIndex = entry.key;
         final condition = entry.value;
         final iconList = [Icons.add, Icons.add, Icons.add, Icons.add];
         return Column(
           children: [
             CustomTrainWidget(
               title: '${condition['name']}',
               child: Expanded(
                 child: ListView.builder(
                   itemCount: conditionsProvider.programConditions.length,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index) {
                     return Column(
                       children: [
                         Row(
                           children: [
                             Text('${conditionsProvider.programConditions[index]['name'] ?? ''}'),
                             SizedBox(width: 10,)
                           ],
                         ),
                         Checkbox(
                           value: conditionsProvider.getValues(conditionIndex, condition['value'], index),
                           onChanged: (value) => conditionsProvider.updateCondition(conditionIndex, condition['value'], index, value!),
                         ),
                       ],
                     );
                   },
                 ),
               ),
             ),
             const SizedBox(height: 10,)
           ],
         );
       }).toList()
      ],
    );
  }
}
