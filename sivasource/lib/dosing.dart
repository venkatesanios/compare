import 'package:flutter/material.dart';

class dosing extends StatefulWidget {
  const dosing({super.key});

  @override
  State<dosing> createState() => _dosingState();
}

//203 FERTILIZATION
class _dosingState extends State<dosing> {
  String Sourcereturn = '';

  var centralDosing = [
    [
      [1, false, false, '1'],
      ['unselect', 1]
    ],
    [
      [1, false, true, '2'],
      [2, true, false, '3'],
      ['unselect', 2]
    ],
    [
      [1, true, true, '4'],
      [2, true, false, '5'],
      ['unselect', 3]
    ],
    [
      [1, false, false, '6'],
      ['unselect', 4]
    ],
    [
      [1, true, true, '7'],
      [2, false, true, '8'],
      ['unselect', 5]
    ],
    [
      [1, true, false, '9'],
      [2, true, true, '10'],
      ['unselect', 6]
    ]
  ];

  var localDosing = [
    [
      [1, true, false, '11'],
      [2, false, true, '12'],
      ['unselect', 1]
    ],
    [
      [1, false, true, '13'],
      [2, true, false, '14'],
      ['unselect', 2]
    ]
  ];

  String convertCentral(List<dynamic> irrigationline) {
    String value = '';
    String linevalue;

    for (var i = 0; i < irrigationline.length; i++) {
      if (i == (irrigationline[i].length - 1)) {
        linevalue = irrigationline[i][1].toString();
      } else {
        String srno = '';
        String booster = '';
        String fm = '';
        String ch = '';
        int j = 0;
        value = '';
        for (var j = 0; j < (irrigationline[i].length - 1); j++) {
          srno = irrigationline[i][j][3].toString();
          booster = irrigationline[i][j][2] == true ? "1" : "0";
          fm = irrigationline[i][j][1] == true ? "1" : "0";
          ch = irrigationline[i][j][0].toString();
          j = j + 1;
        }
        value += '$srno,1.${j},$booster,1.${j}.$ch,$fm';
      }

      Sourcereturn += '$value;';
    }
    return Sourcereturn;
  }

  String convertlocalDosing(List<dynamic> irrigationline) {
    String value = '';
    String linevalue;

    for (var i = 0; i < irrigationline.length; i++) {
      if (i == (irrigationline[i].length - 1)) {
        linevalue = irrigationline[i][1].toString();
      } else {
        String srno = '';
        String booster = '';
        String fm = '';
        String ch = '';
        int j = 0;
        value = '';
        for (var j = 0; j < (irrigationline[i].length - 1); j++) {
          srno = irrigationline[i][j][3].toString();
          booster = irrigationline[i][j][2] == true ? "1" : "0";
          fm = irrigationline[i][j][1] == true ? "1" : "0";
          ch = irrigationline[i][j][0].toString();
          j = j + 1;
        }
        value += '$srno,2.${j},$booster,2.${j}.$ch,$fm';
        print('$srno,2.${j},$booster,2.${j}.$ch,$fm');
      }

      Sourcereturn += '$value;';
    }
    return Sourcereturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('dosing')),
      body: Center(
        child: Container(
          child: FloatingActionButton(
            onPressed: () {
              String payload = convertCentral(centralDosing);
              String payloadfull = convertlocalDosing(localDosing);

              print("---------204-----------$payloadfull");
            },
            child: Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
