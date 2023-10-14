import 'package:flutter/material.dart';
import 'package:sivasource/Filderation.dart';
import 'package:sivasource/dosing.dart';
import 'package:sivasource/io.dart';
import 'package:sivasource/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
//201SOURCE IRRIGATION PUMP
  List<dynamic> sourcePump = [
    ['A', true, 'unselect', 1],
    ['-', false, 'unselect', 2],
    ['B', true, 'unselect', 3],
    ['-', true, 'unselect', 4],
    ['-', false, 'unselect', 5],
    ['F', true, 'unselect', 6]
  ];
  var irrigationPump = [
    [
      true,
      ['unselect', 1]
    ],
    [
      true,
      ['unselect', 2]
    ],
    [
      false,
      ['unselect', 3]
    ],
    [
      false,
      ['unselect', 4]
    ],
    [
      true,
      ['unselect', 5]
    ]
  ];

//centralDosing : [[[1, true, false], [unselect, 1]], [[1, false, true], [unselect, 2]], [[1, true, true], [2, false, false], [3, true, true], [unselect, 3]], [[1, true, true], [2, false, false], [3, true, true], [unselect, 4]], [[1, true, true], [2, true, true], [unselect, 5]], [[1, false, true], [2, true, true], [unselect, 6]]]

// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Home Page'),
      home: inputoutput(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late List<List<dynamic>> nestedList;
  late List<List<dynamic>> transformedList;
  String Sourcereturn = '';

  @override
  void initState() {
    super.initState();

    nestedList = [
      [
        true,
        ['unselect', 4]
      ],
      [
        true,
        ['unselect', 6]
      ],
      [
        true,
        ['unselect', 9]
      ]
    ];

    transformedList = nestedList.map((item) {
      return [item[0], item[1][0], item[1][1]];
    }).toList();
  }

//[[D, true, unselect, 1], [D, true, unselect, 3], [-, true, unselect, 7]]
//[[true, [unselect, 4]], [true, [unselect, 6]], [true, [unselect, 9]]]

  void _incrementCounter() {
    String str = convertSource([
      ["D", true, 'unselect', 1],
      ['D', true, 'unselect', 3],
      ['-', true, 'unselect', 7]
    ]);

    String irrstr = convertIrrigation(transformedList);
    print(irrstr);
  }

  String convertSource(List<dynamic> sourcePump) {
    for (var i = 0; i < sourcePump.length; i++) {
      List<dynamic> innerList = sourcePump[i];
      String innerListsro = innerList[3].toString();
      int innerListpositionint = i + 1;
      String innerListposition = innerListpositionint.toString();
      String innerListwm = innerList[1] == true ? "1" : "0";
      Sourcereturn += "$innerListsro,1,$innerListposition,$innerListwm;";
    }
    return Sourcereturn;
  }

  String convertIrrigation(List<dynamic> irrigationPump) {
    for (var i = 0; i < irrigationPump.length; i++) {
      List<dynamic> innerList = irrigationPump[i];
      String innerListsro = innerList[2].toString();
      int innerListpositionint = i + 1;
      String innerListposition = innerListpositionint.toString();
      String innerListwm = innerList[0] == true ? "1" : "0";
      Sourcereturn += "$innerListsro,2,$innerListposition,$innerListwm;";
    }
    return Sourcereturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
