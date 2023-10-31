import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/ConfigMakerProvider/product_limit_provider.dart';


class SourcePump extends StatefulWidget {
  const SourcePump({Key? key}) : super(key: key);

  @override
  State<SourcePump> createState() => _SourcePumpState();
}

class _SourcePumpState extends State<SourcePump> {

  String selectedValue = '';
  String selectedSource = '';
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    final provider1 = Provider.of<ProductLimitProvider>(context,listen: false);
    selectedValue = provider1.selectedValue(4);
    selectedSource = provider1.selectedValue(0);
    print('selectedSource : $selectedSource');
  }

  @override
  Widget build(BuildContext context) {

    final provider1 = Provider.of<ProductLimitProvider>(context,listen: false);

    return Column(
      children: [
        const SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.background,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 5,
                spreadRadius:0,
              ),
            ],
          ),
          child: Column(
            children: [
              Text('Source Pumps', style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: int.parse(selectedValue),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(
                                'SP${index + 1}',
                                style: TextStyle(
                                    fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                    color: Theme.of(context).colorScheme.background,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            print('Tapped item at index $index');
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFF0D5D9A).withOpacity(0.1),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(Icons.water, color: Theme.of(context).primaryColor),
                    ),
                    title: const Text('Water Source'),
                    trailing: DropdownButton<String>(
                      value: selectedSource,
                      onChanged: (newValue) {
                        setState(() {
                          selectedSource = newValue!;
                        });
                      },
                      items: [
                        const DropdownMenuItem<String>(
                          value: 'None',
                          child: Text('None'),
                        ),
                        if (selectedSource != 'None')
                          ...List.generate(int.parse(selectedSource), (index) {
                            final value = index + 1;
                            // print(value);
                            final alphabetChar = String.fromCharCode('A'.codeUnitAt(0) + index);
                            return DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text('$value'),
                            );
                          }),
                      ],
                      menuMaxHeight: 210,
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Icon(Icons.speed, color: Theme.of(context).primaryColor),
                    ),
                    title: const Text('Water meter'),
                    trailing: Switch(
                      value: switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      ],
    );
  }
}
