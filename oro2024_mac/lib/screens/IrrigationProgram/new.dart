// import 'package:flutter/material.dart';
// import 'package:oro2024_mac/model/IrrigationProgramModel/selection_model.dart';
// import 'package:provider/provider.dart';
//
// import '../../provider/irrigation_program_main_provider.dart';
//
// class SelectionScreen1 extends StatefulWidget {
//   const SelectionScreen1({Key? key}) : super(key: key);
//
//   @override
//   _SelectionScreenState createState() => _SelectionScreenState();
// }
//
// class _SelectionScreenState extends State<SelectionScreen1> {
//   TimeOfDay _selectedTime = TimeOfDay.now();
//   SelectionModel _selectionModel = SelectionModel();
//
//   final Map<int, GlobalKey> itemKeys = {};
//
//   String filterSelection = "Central filter";
//   String fertSelection = "Central fert";
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     Widget buildCard(String title, String subtitle, String subtitle2) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 if (title != null)
//                   Container(
//                     width: double.infinity,
//                     height: 40,
//                     child: Center(
//                       child: Text(
//                         title,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 if (subtitle != null) ListTile(title: Text(subtitle)),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Wrap(
//                     spacing: 10.0,
//                     runSpacing: 5.0,
//                     children: List.generate(itemList.length, (index) {
//                       return ChoiceChip(
//                         label: Text('Pump${index + 1}'),
//                         selected: itemList[index].selection,
//                         selectedColor: Colors.amber,
//                         onSelected: (bool selected) {
//                           if (title == 'MAIN VALVE') {
//                             selectItem(index);
//                           } else {
//                             selectPump(index);
//                           }
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//                 if (subtitle2 != null) const Divider(),
//                 if (subtitle2 != null) ListTile(title: Text(subtitle2)),
//                 if (subtitle2 != null) Wrap(
//                   spacing: 10.0,
//                   runSpacing: 5.0,
//                   children: List.generate(itemList.length, (index) {
//                     return ChoiceChip(
//                       label: Text('Pump${index + 1}'),
//                       selected: itemList[index].selection,
//                       selectedColor: Colors.amber,
//                       onSelected: (bool selected) {
//                         if (title == 'MAIN VALVE') {
//                           selectItem(index);
//                         } else {
//                           selectPump(index);
//                         }
//                       },
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     }
//
//     return ListView(
//       shrinkWrap: true,
//       children: [
//         const SizedBox(height: 10),
//         buildCard('MAIN VALVE', '',''),
//         const SizedBox(height: 10),
//         buildCard('PUMP SELECTION', '',''),
//         const SizedBox(height: 10),
//         buildCard('Fertilizer Selection', 'Central Fertilizer',''),
//         buildCard('', 'Local Fertilizer',''),
//         const SizedBox(height: 10),
//         buildCard('Filter Selection', 'Central Filter',''),
//         buildCard('', 'Local Filter',''),
//         const SizedBox(height: 10),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
//
//   void selectItem(int index,String title) {
//        switch (title) {
//         case 'MAIN VALVE':
//           setState(() {
//             _selectionModel.data!.mainValve![index].selection = !_selectionModel.data!.mainValve![index].selection!;
//           });
//            break;
//         case 'PUMP SELECTION':
//           setState(() {
//             _selectionModel.data!.irrigationPump![index].selection = !_selectionModel.data!.irrigationPump![index].selection!;
//           });
//           break;
//         case 'Central Fertilizer':
//           setState(() {
//             _selectionModel.data!.centralFertilizer![index].selection = !_selectionModel.data!.centralFertilizer![index].selection!;
//           });
//           break;
//          case 'Local Fertilizer':
//            setState(() {
//              _selectionModel.data!.localFertilizer![index].selection = !_selectionModel.data!.localFertilizer![index].selection!;
//            });
//            break;
//          case 'Central Filter':
//            setState(() {
//              _selectionModel.data!.centralFilter![index].selection = !_selectionModel.data!.centralFilter![index].selection!;
//            });
//            break;
//          case 'Local Filter':
//            setState(() {
//              _selectionModel.data!.localFilter![index].selection = !_selectionModel.data!.localFilter![index].selection!;
//            });
//            break;
//         default:
//           print('No match found');
//       }
//     }
//
//
//
//
//
//
//
//
//   Future<String> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//     );
//     if (picked != null && picked != _selectedTime) {
//       _selectedTime = picked;
//     }
//
//     final hour = _selectedTime.hour.toString().padLeft(2, '0');
//     final minute = _selectedTime.minute.toString().padLeft(2, '0');
//     return '$hour:$minute';
//   }
// }
//
//
