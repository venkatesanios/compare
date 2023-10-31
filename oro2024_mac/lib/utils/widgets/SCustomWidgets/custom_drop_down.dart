import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget {
  final List<String> dropdownItems;
  final String selectedValue;
  final Function(String?) onChanged;

  const CustomDropdownWidget({super.key,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      underline: Container(),
      value: selectedValue,
      items: [
        const DropdownMenuItem<String>(
          value: 'None',
          child: Text('None'),
        ),
        ...dropdownItems
            .where((name) => name != null)
            .map((pumpName) {
          return DropdownMenuItem<String>(
            value: pumpName,
            child: Text(pumpName),
          );
        }).toList(),
      ],
      onChanged: onChanged,
    );
  }
}
