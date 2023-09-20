// import 'package:flutter/material.dart';

// class MetadataScreen extends StatelessWidget {
//   const MetadataScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Metadata'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             MetadataItem(label: 'Name', value: 'ORO PUMP'),
//             MetadataItem(label: 'Model', value: 'XYZ123'),
//             MetadataItem(label: 'Type', value: 'Pump Controller'),
//             MetadataItem(label: 'Serial Number', value: 'SN123221456'),
//             MetadataItem(label: 'Hardware Version', value: '1.0'),
//             MetadataItem(label: 'Software Version', value: '2.0'),
//             MetadataItem(label: 'Start Date', value: '2023-01-01'),
//             MetadataItem(label: 'Subscription', value: 'Active'),
//             MetadataItem(label: 'Warranty', value: '2 years'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MetadataItem extends StatelessWidget {
//   final String label;
//   final String value;

//   MetadataItem({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 18,
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class MetadataScreen extends StatelessWidget {
  const MetadataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metadata'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            showCheckboxColumn: false,
            // headingRowColor: Colors.black,
            // Hide column headers

            border: TableBorder.all(width: 1.0, style: BorderStyle.solid),
            // dividerThickness: 5.0,
            columns: const [
              DataColumn(label: Text('Meta Data')),
              DataColumn(
                label: Text('Details'),
              ),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Name')),
                DataCell(Text('Thottam Pump')),
              ]),
              DataRow(cells: [
                DataCell(Text('Model')),
                DataCell(Text('XYZ123')),
              ]),
              DataRow(cells: [
                DataCell(Text('Type')),
                DataCell(Text('Pump Controler')),
              ]),
              DataRow(cells: [
                DataCell(Text('Serial Number')),
                DataCell(Text('SN123456')),
              ]),
              DataRow(cells: [
                DataCell(Text('Hardware Version')),
                DataCell(Text('1.0')),
              ]),
              DataRow(cells: [
                DataCell(Text('Software Version')),
                DataCell(Text('2.0')),
              ]),
              DataRow(cells: [
                DataCell(Text('Start Date')),
                DataCell(Text('2024-01-01')),
              ]),
              DataRow(cells: [
                DataCell(Text('Subscription')),
                DataCell(Text('Active')),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Warranty')),
                  DataCell(Text('2 years')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
