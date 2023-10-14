import 'package:flutter/material.dart';

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _dosingState();
}

//204 FILTRATION
class _dosingState extends State<filter> {
  String Sourcereturn = '';
  int Srofilder = 0;

  var centralFilter = [
    [
      1,
      true,
      true,
      ['unselect', '4']
    ],
    [
      2,
      true,
      false,
      ['unselect', '6']
    ],
    [
      1,
      true,
      false,
      ['unselect', '7']
    ],
    [
      3,
      false,
      true,
      ['unselect', '8']
    ]
  ];

  var localFilter = [
    [
      1,
      true,
      true,
      ['unselect', '2']
    ],
    [
      2,
      true,
      false,
      ['unselect', '4']
    ],
    [
      1,
      true,
      false,
      ['unselect', '3']
    ],
  ];

  String convertcentralfilter(List<dynamic> sourcePump) {
    for (var i = 0; i < sourcePump.length; i++) {
      List<dynamic> innerList = sourcePump[i];
      String fsite = innerList[3][1].toString();
      String dwvalve = innerList[1] == true ? "1" : "0";
      String dprs = innerList[2] == true ? "1" : "0";
      int srno = i + 1;
      Srofilder = i + 1;
      Sourcereturn += "$srno,1.$srno,$fsite,$dwvalve,$dprs;";
    }
    return Sourcereturn;
  }

  String convertlocalfilter(List<dynamic> sourcePump) {
    for (var i = 0; i < sourcePump.length; i++) {
      List<dynamic> innerList = sourcePump[i];
      String fsite = innerList[3][1].toString();
      String dwvalve = innerList[1] == true ? "1" : "0";
      String dprs = innerList[2] == true ? "1" : "0";
      int srno = Srofilder + i + 1;
      int ival = i + 1;
      Sourcereturn += "$srno,2.$ival,$fsite,$dwvalve,$dprs;";
    }
    return Sourcereturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('filter')),
      body: Center(
        child: Container(
          child: FloatingActionButton(
            onPressed: () {
              String payload = convertcentralfilter(centralFilter);
              String payloadfull = convertlocalfilter(localFilter);

              print("---------205-----------$payloadfull");
            },
            child: Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
