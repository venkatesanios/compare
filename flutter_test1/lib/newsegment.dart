// import 'package:flutter/material.dart';

// class TestPage extends StatefulWidget {
//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   late int _index;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(16),
//         child: SegmentedWidget(
//           onChanged: (i) {
//             setState(() => _index = _index == i ? null : i);
//           },
//           index: _index,
//           color: Colors.purple,
//           children: [
//             Text('Text'),
//             Icon(Icons.thumb_up, size: 32),
//             Column(
//               children: <Widget>[
//                 Text('Hello', textScaleFactor: 0.8),
//                 Text('World', textScaleFactor: 1.25),
//               ],
//             // ),
//             FlutterLogo(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SegmentedWidget extends StatelessWidget {
//   const SegmentedWidget({
//     Key key,
//     @required this.onChanged,
//     this.index,
//     this.color,
//     this.textColor,
//     this.children,
//   }) : super(key: key);

//   final ValueChanged<int> onChanged;
//   final int index;
//   final Color color;
//   final Color textColor;
//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     final color = this.color ?? Theme.of(context).accentColor;

//     final shape = RoundedRectangleBorder(
//       side: BorderSide(color: color),
//       borderRadius: BorderRadius.circular(8),
//     );
//     return ClipPath(
//       clipper: ShapeBorderClipper(shape: shape),
//       child: Container(
//         foregroundDecoration: ShapeDecoration(
//           shape: shape,
//         ),
//         child: IntrinsicHeight(
//           child: Row(
//             children: [..._buildChildren(context)],
//           ),
//         ),
//       ),
//     );
//   }

//   Iterable<Widget> _buildChildren(BuildContext context) sync* {
//     final theme = Theme.of(context);
//     final color = this.color ?? theme.accentColor;
//     final textColor = this.textColor ??
//         (this.color == null
//             ? theme.accentTextTheme.button.color
//             : (ThemeData.estimateBrightnessForColor(color) == Brightness.dark
//                 ? Colors.white
//                 : Colors.black));
//     final style1 = theme.textTheme.button.copyWith(color: color);
//     final style2 = theme.textTheme.button.copyWith(color: textColor);
//     final data1 = theme.iconTheme.copyWith(color: color);
//     final data2 = theme.iconTheme.copyWith(color: textColor);
//     final duration = kThemeAnimationDuration;

//     for (int i = 0; i < children.length; i++) {
//       if (i > 0) {
//         yield Container(
//           color: color,
//           width: 1,
//         );
//       }
//       final selected = i == index;
//       yield Expanded(
//         child: GestureDetector(
//           onTap: onChanged != null ? () => onChanged(i) : null,
//           child: AnimatedContainer(
//             duration: duration,
//             color: selected ? color : color.withAlpha(0),
//             padding: EdgeInsets.all(4),
//             alignment: Alignment.center,
//             child: AnimatedTheme(
//               data: theme.copyWith(
//                 iconTheme: selected ? data2 : data1,
//               ),
//               child: AnimatedDefaultTextStyle(
//                 duration: duration,
//                 style: selected ? style2 : style1,
//                 child: children[i],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//   }
// }
