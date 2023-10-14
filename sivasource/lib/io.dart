import 'package:flutter/material.dart';

class inputoutput extends StatefulWidget {
  const inputoutput({super.key});

  @override
  State<inputoutput> createState() => _dosingState();
}

//203 FERTILIZATION
class _dosingState extends State<inputoutput> {
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

  String Sourcereturn = '';
  late List<List<dynamic>> nestedList;
  late List<List<dynamic>> transformedList;

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

  List<dynamic> mapppingofoutputs = [
    {
      '1': {
        'valve': [
          ['L 1 : V1', 'ORO Smart RTU', '1', '1', '34'],
          ['L 1 : V2', 'ORO Smart RTU', '1', '2', '35'],
          ['L 1 : V3', '-', '-', '-', '36'],
          ['L 1 : V4', '-', '-', '-', '37'],
          ['L 1 : V5', '-', '-', '-', '38']
        ],
        'main_valve': [
          ['L 1 : MV1', '-', '-', '-', '39'],
          ['L 1 : MV2', '-', '-', '-', '40']
        ],
        'injector': [
          ['L 1 : injector1', '-', '-', '-', '7', '41'],
          ['L 1 : injector2', '-', '-', '-', '8', '42']
        ],
        'Booster': [
          ['L 1 : Booster1', '-', '-', '-', '7', '43'],
          ['L 1 : Booster2', '-', '-', '-', '8', '44']
        ],
        'filter': [
          ['L 1 : filter1', '-', '-', '-', '45']
        ],
        'D_valve': ['L 1 : D_valve', '-', '-', '-', '46']
      }
    },
    {
      '2': {
        'valve': [
          ['L 2 : V1', '-', '-', '-', '47'],
          ['L 2 : V2', '-', '-', '-', '48'],
          ['L 2 : V3', '-', '-', '-', '49'],
          ['L 2 : V4', '-', '-', '-', '50'],
          ['L 2 : V5', '-', '-', '-', '51']
        ],
        'main_valve': [
          ['L 2 : MV1', '-', '-', '-', '52']
        ],
        'injector': [
          ['L 2 : injector1', '-', '-', '-', '9', '53']
        ],
        'Booster': [
          ['L 2 : Booster1', '-', '-', '-', '9', '54']
        ],
        'filter': [
          ['L 2 : filter1', '-', '-', '-', '55']
        ],
        'D_valve': []
      }
    }
  ];
  List<dynamic> SP_MO = [
    {
      '1': {
        'pump': ['1', '-', '-', '-', '1'],
        'water_meter': [true, '-', '-', '-', '-', '2']
      }
    },
    {
      '2': {
        'pump': ['1', '-', '-', '-', '3'],
        'water_meter': [false, '-', '-', '-', '-', '4']
      }
    }
  ];
  List<dynamic> IP_MO = [
    {
      '3': {
        'pump': ['1', '-', '-', "-", '5'],
        'water_meter': [true, '-', '-', '-', '-', '6']
      }
    },
    {
      '4': {
        'pump': ['1', '-', '-', '-', '7'],
        'water_meter': [true, '-', '-', '-', '-', '8']
      }
    }
  ];
  List<dynamic> CF_for_MO = [
    {
      '1': {
        'filter': [
          ['1', '-', '-', '-', '27'],
          ['2', '-', '-', '-', '33']
        ],
        'D_S_valve': [true, '-', '-', '-', '28'],
        'P_sensor': [false, '-', '-', '-', '-', '21']
      }
    },
    {
      '2': {
        'filter': [
          ['1', '-', '-', '-', '30']
        ],
        'D_S_valve': [true, '-', '-', '-', '31'],
        'P_sensor': [true, '-', '-', '-', '-', '32']
      }
    }
  ];
  List<dynamic> CD_for_MO = [
    {
      '1': {
        'injector': [
          ['1', '-', '-', '-', '1', '9']
        ],
        'dosing_meter': [
          [true, '-', '-', '-', '-', '1', '10']
        ],
        'booster': [
          [false, '-', '-', '-', '4', '3']
        ]
      }
    },
    {
      '2': {
        'injector': [
          ['1', '-', '-', '-', '2', '12']
        ],
        'dosing_meter': [
          [true, '-', '-', '-', '-', '2', '13']
        ],
        'booster': [
          [true, '-', '-', '-', '2', '14']
        ]
      }
    },
    {
      '3': {
        'injector': [
          ['1', '-', '-', '-', '3', '15'],
          ['2', '-', '-', '-', '4', '18']
        ],
        'dosing_meter': [
          [true, '-', '-', '-', '-', '3', '16'],
          [true, '-', '-', '-', '-', '4', '19']
        ],
        'booster': [
          [true, '-', '-', '-', '3', '17'],
          [true, '-', '-', '-', '4', '20']
        ]
      }
    },
    {
      4: {
        'injector': [
          ['1', '-', '-', '-', '5', '21'],
          ['2', '-', '-', '-', '6', '24']
        ],
        'dosing_meter': [
          [true, '-', '-', '-', '-', '5', '22'],
          [true, '-', '-', '-', '-', '6', '25']
        ],
        'booster': [
          [true, '-', '-', '-', '5', '23'],
          [true, '-', '-', '-', '6', '26']
        ]
      }
    }
  ];
//201

  String convertSourcepump(List<dynamic> sourcePump) {
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

  String convertIrrigationpump(List<dynamic> irrigationPump) {
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

  //Dosing
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
  String Dosingreturn = '';
  String convertCentralDosing(List<dynamic> irrigationline) {
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

      Dosingreturn += '$value;';
    }
    return Dosingreturn;
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
      }

      Dosingreturn += '$value;';
    }
    return Dosingreturn;
  }

//IrrigationLine
  List<dynamic> irrigationline = [
    {
      "valve": "10",
      "main_valve": "1",
      "Central_dosing_site": "1",
      "Central_filtration_site": "-",
      "Local_dosing_site": true,
      "local_filtration_site": true,
      "pressure_sensor": true,
      "irrigationPump": "1",
      "water_meter": true,
      "ORO_Smart_RTU": "1",
      "RTU": "1",
      "ORO_switch": "1",
      "ORO_sense": "1",
      "isSelected": "unselect",
      "myRTU_list": ["-", "ORO Smart RTU", "ORO RTU", "ORO Switch"],
      "myOroSmartRtu": [1],
      "myRTU": [1],
      "myOROswitch": [1],
      "autoIncrement": "1"
    },
    {
      "valve": "12",
      "main_valve": "2",
      "Central_dosing_site": "-",
      "Central_filtration_site": "2",
      "Local_dosing_site": false,
      "local_filtration_site": false,
      "pressure_sensor": true,
      "irrigationPump": "-",
      "water_meter": false,
      "ORO_Smart_RTU": "1",
      "RTU": "1",
      "ORO_switch": "1",
      "ORO_sense": "1",
      "isSelected": "unselect",
      "myRTU_list": ["-", "ORO Smart RTU", "ORO RTU", "ORO Switch"],
      "myOroSmartRtu": [2],
      "myRTU": [2],
      "myOROswitch": [2],
      "autoIncrement": "2"
    },
    {
      "valve": "2",
      "main_valve": "1",
      "Central_dosing_site": "2",
      "Central_filtration_site": "1",
      "Local_dosing_site": false,
      "local_filtration_site": true,
      "pressure_sensor": false,
      "irrigationPump": "2",
      "water_meter": true,
      "ORO_Smart_RTU": "1",
      "RTU": "1",
      "ORO_switch": "1",
      "ORO_sense": "1",
      "isSelected": "unselect",
      "myRTU_list": ["-", "ORO Smart RTU", "ORO RTU", "ORO Switch"],
      "myOroSmartRtu": [3],
      "myRTU": [3],
      "myOROswitch": [3],
      "autoIncrement": "3"
    }
  ];
  String irrigationreturn = '';
  String convertIrrigation(List<dynamic> irrigationline) {
    for (var i = 0; i < irrigationline.length; i++) {
      String autoIncrement = irrigationline[i]['autoIncrement'] == '-'
          ? "0"
          : irrigationline[i]['autoIncrement'].toString();
      String valve = irrigationline[i]['valve'] == '-'
          ? "0"
          : irrigationline[i]['valve'].toString();
      String main_valve1 = irrigationline[i]['main_valve'] == '-'
          ? "0"
          : irrigationline[i]['main_valve'].toString();
      String main_valve = '${i + 1}.$main_valve1';
      String Central_dosing_site =
          irrigationline[i]['Central_dosing_site'] == '-'
              ? "0"
              : irrigationline[i]['Central_dosing_site'].toString();
      String Central_filtration_site =
          irrigationline[i]['Central_filtration_site'] == '-'
              ? "0"
              : irrigationline[i]['Central_filtration_site'].toString();
      String Local_dosing_site =
          irrigationline[i]['Local_dosing_site'] == true ? "1" : "0";
      String local_filtration_site =
          irrigationline[i]['local_filtration_site'] == true ? "1" : "0";
      String pressure_sensor =
          irrigationline[i]['pressure_sensor'] == true ? "1" : "0";
      String irrigationPump = irrigationline[i]['irrigationPump'] == '-'
          ? "0"
          : irrigationline[i]['irrigationPump'].toString();
      String water_meter = irrigationline[i]['water_meter'] == true ? "1" : "0";
      String ORO_Smart_RTU = irrigationline[i]['ORO_Smart_RTU'] == '-'
          ? "0"
          : irrigationline[i]['ORO_Smart_RTU'].toString();
      String RTU = irrigationline[i]['RTU'] == '-'
          ? "0"
          : irrigationline[i]['RTU'].toString();
      String ORO_switch = irrigationline[i]['ORO_switch'] == '-'
          ? "0"
          : irrigationline[i]['ORO_switch'].toString();
      String ORO_sense = irrigationline[i]['ORO_sense'] == '-'
          ? "0"
          : irrigationline[i]['ORO_sense'].toString();

      irrigationreturn +=
          "$autoIncrement,$valve,$main_valve,$Central_dosing_site,$Central_filtration_site,$Local_dosing_site,$local_filtration_site,$pressure_sensor,$irrigationPump,$water_meter,$ORO_Smart_RTU,$RTU,$ORO_switch,$ORO_sense,0;";
    }
    return irrigationreturn;
  }

//Filteration
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
  String Filterreturn = '';
  String convertcentralfilter(List<dynamic> sourcePump) {
    for (var i = 0; i < sourcePump.length; i++) {
      List<dynamic> innerList = sourcePump[i];
      String fsite = innerList[3][1].toString();
      String dwvalve = innerList[1] == true ? "1" : "0";
      String dprs = innerList[2] == true ? "1" : "0";
      int srno = i + 1;
      Srofilder = i + 1;
      Filterreturn += "$srno,1.$srno,$fsite,$dwvalve,$dprs;";
    }
    return Filterreturn;
  }

  String convertlocalfilter(List<dynamic> sourcePump) {
    for (var i = 0; i < sourcePump.length; i++) {
      List<dynamic> innerList = sourcePump[i];
      String fsite = innerList[3][1].toString();
      String dwvalve = innerList[1] == true ? "1" : "0";
      String dprs = innerList[2] == true ? "1" : "0";
      int srno = Srofilder + i + 1;
      int ival = i + 1;
      Filterreturn += "$srno,2.$ival,$fsite,$dwvalve,$dprs;";
    }
    return Filterreturn;
  }

//i/O
  String ioreturn = '';
  List<dynamic> mappingOfInputs = [
    {
      '1': {
        'pressure_sensor': [
          'L 1 : Pressure sensor',
          'ORO Smart RTU',
          '1',
          '1',
          'A-I',
          '56'
        ],
        'water_meter': [
          'L 1 : water meter',
          'ORO Smart RTU',
          '1',
          '2',
          'RS485',
          '57'
        ],
        'ORO_sense': [
          ['L 1 : ORO Sense1', '-', '-', '-', '-', '58']
        ],
        'dosing_meter': [
          ['L 1 : dosing_meter1', '-', '-', '-', '-', '7', '59'],
          ['L 1 : dosing_meter2', '-', '-', '-', '-', '8', '60']
        ],
        'D_pressure_sensor': []
      }
    },
    {
      '2': {
        'pressure_sensor': ['L 2 : Pressure sensor', '-', '-', '-', '-', '61'],
        'water_meter': ['L 2 : water meter', '-', '-', '-', '-', '62'],
        'ORO_sense': [
          ['L 2 : ORO Sense1', '-', '-', '-', '-', '63']
        ],
        'dosing_meter': [
          ['L 2 : dosing_meter1', '-', '-', '-', '-', '9', '64']
        ],
        'D_pressure_sensor': [
          'L 2 : D_pressure_sensor',
          '-',
          '-',
          '-',
          '-',
          '65'
        ]
      }
    }
  ];

  String rtunum(String name) {
    if (name == "Oro Gem") {
      return '1';
    } else if (name == "Oro Smart RTU") {
      return '2';
    } else if (name == "Oro RTU") {
      return '3';
    } else if (name == "Oro Pump") {
      return '4';
    } else if (name == "Oro Switch") {
      return '5';
    } else if (name == "Oro Level") {
      return '6';
    } else if (name == "Oro Sense") {
      return '7';
    } else if (name == "Oro Xtend") {
      return '8';
    } else if (name == "Oro Weather") {
      return '9';
    } else if (name == "Oro Gem Lite") {
      return '10';
    } else {
      return '0';
    }
  }

  String inputtypefun(String name) {
    if (name == "A-I") {
      return '2';
    } else if (name == "D-I") {
      return '3';
    } else if (name == "P-I") {
      return '4';
    } else if (name == "RS485") {
      return '5';
    } else if (name == "12C") {
      return '6';
    } else {
      return '0';
    }
  }

  String convertmappingoutput(List<dynamic> molist) {
    String value = '';

    List mapinnerlist = [
      'valve',
      'main_valve',
      'injector',
      'Booster',
      'filter',
      'D_valve'
    ];

    for (var irr = 0; irr < molist.length; irr++) {
      String srno = '';
      String name = '';
      String deviceno = '';
      String rtu = '';
      String relayio = '';
      for (var maiinr = 0; maiinr < mapinnerlist.length; maiinr++) {
        String maiinrname = mapinnerlist[maiinr];
        List innerlist = molist[irr]['${irr + 1}'][maiinrname];
        if (maiinrname == 'D_valve') {
          if (innerlist.length > 0) {
            srno = innerlist[4] == '-' ? "0" : innerlist[4].toString();
            name = innerlist[0] == '-' ? "0" : innerlist[0].toString();
            deviceno = innerlist[1] == '-' ? "0" : innerlist[1].toString();
            rtu = innerlist[2] == '-' ? "0" : innerlist[2].toString();
            relayio = innerlist[3] == '-' ? "0" : innerlist[3].toString();
            String rtudevicenum = rtunum(deviceno);
            value += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
          }
        } else {
          if (innerlist.length > 0) {
            for (var vsro = 0; vsro < innerlist.length; vsro++) {
              if (maiinrname == 'injector' || maiinrname == 'Booster') {
                srno = innerlist[vsro][5] == '-'
                    ? "0"
                    : innerlist[vsro][5].toString();
              } else {
                srno = innerlist[vsro][4] == '-'
                    ? "0"
                    : innerlist[vsro][4].toString();
              }
              name = innerlist[vsro][0] == '-'
                  ? "0"
                  : innerlist[vsro][0].toString();
              deviceno = innerlist[vsro][1] == '-'
                  ? "0"
                  : innerlist[vsro][1].toString();
              rtu = innerlist[vsro][2] == '-'
                  ? "0"
                  : innerlist[vsro][2].toString();
              relayio = innerlist[vsro][3] == '-'
                  ? "0"
                  : innerlist[vsro][3].toString();
              String rtudevicenum = rtunum(deviceno);
              value += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
            }
          }
        }
      }
      ioreturn += '$value';
    }
    return ioreturn;
  }

  String convertmapinputs(List<dynamic> minlist) {
    String value = '';

    List mapinnerlist = [
      'pressure_sensor',
      'water_meter',
      'ORO_sense',
      'dosing_meter',
      'D_pressure_sensor'
    ];

    for (var irr = 0; irr < minlist.length; irr++) {
      String srno = '';
      String name = '';
      String deviceno = '';
      String rtu = '';
      String relayio = '';
      String inputtype = '';
      for (var maiinr = 0; maiinr < mapinnerlist.length; maiinr++) {
        String maiinrname = mapinnerlist[maiinr];
        List innerlist = minlist[irr]['${irr + 1}'][maiinrname];
        if (maiinrname == 'D_pressure_sensor' ||
            maiinrname == 'pressure_sensor' ||
            maiinrname == 'water_meter') {
          if (innerlist.length > 0) {
            srno = innerlist[5] == '-' ? "0" : innerlist[5].toString();
            name = innerlist[0] == '-' ? "0" : innerlist[0].toString();
            deviceno = innerlist[1] == '-' ? "0" : innerlist[1].toString();
            rtu = innerlist[2] == '-' ? "0" : innerlist[2].toString();
            relayio = innerlist[3] == '-' ? "0" : innerlist[3].toString();
            inputtype = innerlist[4] == '-' ? "0" : innerlist[4].toString();
            String rtudevicenum = rtunum(deviceno);
            String inputtypestr = inputtypefun(inputtype);
            value += '$srno,$name,$rtudevicenum,$rtu,$relayio,$inputtypestr;';
          }
        } else {
          if (innerlist.length > 0) {
            for (var vsro = 0; vsro < innerlist.length; vsro++) {
              if (maiinrname == 'dosing_meter') {
                srno = innerlist[vsro][6] == '-'
                    ? "0"
                    : innerlist[vsro][6].toString();
              } else {
                srno = innerlist[vsro][5] == '-'
                    ? "0"
                    : innerlist[vsro][5].toString();
              }
              name = innerlist[vsro][0] == '-'
                  ? "0"
                  : innerlist[vsro][0].toString();
              deviceno = innerlist[vsro][1] == '-'
                  ? "0"
                  : innerlist[vsro][1].toString();
              rtu = innerlist[vsro][2] == '-'
                  ? "0"
                  : innerlist[vsro][2].toString();
              relayio = innerlist[vsro][3] == '-'
                  ? "0"
                  : innerlist[vsro][3].toString();
              inputtype = innerlist[vsro][4] == '-'
                  ? "0"
                  : innerlist[vsro][4].toString();
              String rtudevicenum = rtunum(deviceno);
              String inputtypestr = inputtypefun(inputtype);
              value += '$srno,$name,$rtudevicenum,$rtu,$relayio,$inputtypestr;';
            }
          }
        }
      }
      ioreturn += '$value';
    }
    return ioreturn;
  }

  String convertSP1MO(List<dynamic> sp_list) {
    String value = '';
    for (var irr = 0; irr < sp_list.length; irr++) {
      String srno = '';
      String name = '';
      String deviceno = '';
      String rtu = '';
      String relayio = '';
      String inputtype = '';
      value = '';
      List innerlist = sp_list[irr]['${irr + 3}']['pump'];
      if (innerlist.length > 0) {
        srno = innerlist[4] == '-' ? "0" : innerlist[4].toString();
        name = 'SP${irr + 1}';
        deviceno = innerlist[1] == '-' ? "0" : innerlist[1].toString();
        rtu = innerlist[2] == '-' ? "0" : innerlist[2].toString();
        relayio = innerlist[3] == '-' ? "0" : innerlist[3].toString();
        String rtudevicenum = rtunum(deviceno);
        value += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
      }
      List innerlistwm = sp_list[irr]['${irr + 3}']['water_meter'];
      if (innerlistwm.length > 0) {
        srno = innerlistwm[5] == '-' ? "0" : innerlistwm[5].toString();
        name = 'WM${irr + 1}';
        deviceno = innerlistwm[0] == true ? "1" : '0';
        rtu = innerlistwm[2] == '-' ? "0" : innerlistwm[2].toString();
        relayio = innerlistwm[3] == '-' ? "0" : innerlistwm[3].toString();
        inputtype = innerlistwm[4] == '-' ? "0" : innerlistwm[4].toString();
        String rtudevicenum = rtunum(deviceno);
        String inputtypestr = inputtypefun(inputtype);
        innerlistwm[0] == true
            ? value += '$srno,$name,$rtudevicenum,$rtu,$relayio,$inputtypestr;'
            : '';
      }

      ioreturn += '$value';
    }
    return ioreturn;
  }

  String convertSP_MO(List<dynamic> sp) {
    String s_p = '';
    String i_p = '';
    for (var i = 0; i < sp.length; i++) {
      for (var j in sp[i].entries) {
        s_p = '';
        for (var k in j.value.entries) {
          if (k.key == 'pump') {
            s_p +=
                '${k.value[4]},SP${i + 1},${k.value[1]},${k.value[2]},${k.value[3]}${i == sp.length - 1 ? '' : ';'}';
          } else {
            s_p +=
                '${k.value[5]},WM${i + 1},${k.value[1]},${k.value[2]},${k.value[3]}${i == sp.length - 1 ? '' : ';'}';
          }
        }
        ioreturn += s_p;
      }
    }
    return ioreturn;
  }

  String convertIP_MO(List<dynamic> sp) {
    String s_p = '';
    String i_p = '';
    for (var i = 0; i < sp.length; i++) {
      for (var j in sp[i].entries) {
        s_p = '';
        for (var k in j.value.entries) {
          if (k.key == 'pump') {
            s_p +=
                '${k.value[4]},SP${i + 1},${k.value[1]},${k.value[2]},${k.value[3]}${i == sp.length - 1 ? '' : ';'}';
          } else {
            s_p +=
                '${k.value[5]},WM${i + 1},${k.value[1]},${k.value[2]},${k.value[3]}${i == sp.length - 1 ? '' : ';'}';
          }
        }
        ioreturn += s_p;
      }
    }
    return ioreturn;
  }

  String convertCD_MO(List<dynamic> cd) {
    String s_p = '';
    for (var i = 0; i < cd.length; i++) {
      for (var j in cd[i].entries) {
        s_p = '';
        String srno = '';
        String name = '';
        String deviceno = '';
        String rtu = '';
        String relayio = '';
        String inputtype = '';
        for (var k in j.value.entries) {
          if (k.key == 'injector') {
            for (var c = 0; c < k.value.length; c++) {
              srno = k.value[c][5] == '-' ? "0" : k.value[c][5].toString();
              name = 'INJ-$i';
              deviceno = k.value[c][1] == '-' ? "0" : k.value[c][1].toString();
              rtu = k.value[c][2] == '-' ? "0" : k.value[c][2].toString();
              relayio = k.value[c][3] == '-' ? "0" : k.value[c][3].toString();
              String rtudevicenum = rtunum(deviceno);
              s_p += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
            }
          } else if (k.key == 'booster') {
            for (var c = 0; c < k.value.length; c++) {
              srno = k.value[c][5] == '-' ? "0" : k.value[c][5].toString();
              name = 'BSTR-$i';
              deviceno = k.value[c][1] == '-' ? "0" : k.value[c][1].toString();
              rtu = k.value[c][2] == '-' ? "0" : k.value[c][2].toString();
              relayio = k.value[c][3] == '-' ? "0" : k.value[c][3].toString();
              String rtudevicenum = rtunum(deviceno);

              s_p += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
            }
          } else {
            for (var c = 0; c < k.value.length; c++) {
              srno = k.value[c][6] == '-' ? "0" : k.value[c][6].toString();
              name = 'DOSMTR-$i';
              deviceno = k.value[c][1] == '-' ? "0" : k.value[c][1].toString();
              rtu = k.value[c][2] == '-' ? "0" : k.value[c][2].toString();
              relayio = k.value[c][3] == '-' ? "0" : k.value[c][3].toString();
              String rtudevicenum = rtunum(deviceno);

              k.value[c][0] == true
                  ? s_p += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;'
                  : '';
            }
          }
        }
        ioreturn += s_p;
      }
    }
    return ioreturn;
  }

  String convertCF_MO(List<dynamic> cd) {
    String s_p = '';
    for (var i = 0; i < cd.length; i++) {
      for (var j in cd[i].entries) {
        s_p = '';
        String srno = '';
        String name = '';
        String deviceno = '';
        String rtu = '';
        String relayio = '';
        String inputtype = '';
        for (var k in j.value.entries) {
          if (k.key == 'filter') {
            for (var c = 0; c < k.value.length; c++) {
              srno = k.value[c][4] == '-' ? "0" : k.value[c][4].toString();
              name = 'INJ-$i';
              deviceno = k.value[c][1] == '-' ? "0" : k.value[c][1].toString();
              rtu = k.value[c][2] == '-' ? "0" : k.value[c][2].toString();
              relayio = k.value[c][3] == '-' ? "0" : k.value[c][3].toString();

              String rtudevicenum = rtunum(deviceno);

              s_p += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;';
            }
          } else if (k.key == 'D_S_valve') {
            srno = k.value[4] == '-' ? "0" : k.value[4].toString();
            name = 'DS-$i';
            deviceno = k.value[1] == '-' ? "0" : k.value[1].toString();
            rtu = k.value[2] == '-' ? "0" : k.value[2].toString();
            relayio = k.value[3] == '-' ? "0" : k.value[3].toString();

            String rtudevicenum = rtunum(deviceno);

            k.value[0] == true
                ? s_p += '$srno,$name,$rtudevicenum,$rtu,$relayio,1;'
                : '';
          } else if (k.key == 'P_sensor') {
            srno = k.value[5] == '-' ? "0" : k.value[5].toString();
            name = 'PS-$i';
            deviceno = k.value[1] == '-' ? "0" : k.value[1].toString();
            rtu = k.value[2] == '-' ? "0" : k.value[2].toString();
            relayio = k.value[3] == '-' ? "0" : k.value[3].toString();
            inputtype = k.value[4] == '-' ? "0" : k.value[4].toString();

            String rtudevicenum = rtunum(deviceno);
            String inputtypestr = inputtypefun(inputtype);

            k.value[0] == true
                ? s_p +=
                    '$srno,$name,$rtudevicenum,$rtu,$relayio,$inputtypestr;'
                : '';
          }
        }
        ioreturn += s_p;
      }
    }
    return ioreturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('inputoutput')),
      body: Center(
        child: Container(
          child: FloatingActionButton(
            onPressed: () {
              // String payloadout = convertmappingoutput(mapppingofoutputs);
              // String payloadinput = convertmapinputs(mappingOfInputs);
              String payloadsp = convertSourcepump(sourcePump);
              // print("---------payloadir-----------$payloadsp");
              String payloadir = convertIrrigationpump(transformedList);
              // print("---------payloadir-----------$payloadir");
              String payloadirline = convertIrrigation(irrigationline);
              // print("---------payloadirline-----------$payloadirline");
              String payloadcendosing = convertCentralDosing(centralDosing);
              String payloadlocdosing = convertlocalDosing(localDosing);
              // print("---------payloadlocdosing-----------$payloadlocdosing");
              String payloadcfilter = convertcentralfilter(centralFilter);
              String payloadlocfilter = convertlocalfilter(localFilter);
              // print("---------payloadlocfilter-----------$payloadlocfilter");
              String payloadmapip = convertmapinputs(mappingOfInputs);
              // print("---------payloadmapip-----------$payloadmapip");
              String payloadmapout = convertmappingoutput(mapppingofoutputs);
              // print("---------payloadmapout-----------$payloadmapout");
              String payloadspmo = convertSP_MO(SP_MO);
              // print("---------payloadspmo-----------$payloadspmo");
              String payloadipmo = convertIP_MO(IP_MO);
              // print("---------payloadipmo-----------$payloadipmo");
              String payloadcdmo = convertCD_MO(CD_for_MO);
              // print("---------payloadcdmo-----------$payloadcdmo");
              String payloadcfmo = convertCF_MO(CF_for_MO);
              // print("---------payloadcfmo-----------$payloadcfmo");

              Map<String, List<dynamic>> payload = {
                '200': [
                  {'201': payloadir},
                  {'202': payloadirline},
                  {'203': payloadlocdosing},
                  {'204': payloadlocfilter},
                  {'205': ''},
                  {'206': payloadcfmo},
                ]
              };
              print(payload);
            },
            child: Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
