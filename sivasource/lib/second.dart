import 'package:flutter/material.dart';

//202 IRRIGATION LINE
class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
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
  String Sourcereturn = '';

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

      Sourcereturn +=
          "$autoIncrement,$valve,$main_valve,$Central_dosing_site,$Central_filtration_site,$Local_dosing_site,$local_filtration_site,$pressure_sensor,$irrigationPump,$water_meter,$ORO_Smart_RTU,$RTU,$ORO_switch,$ORO_sense,0;";
    }
    return Sourcereturn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second')),
      body: Container(
        child: FloatingActionButton(
          onPressed: () {
            String payload = convertIrrigation(irrigationline);
            print("---------payload-----------$payload");
          },
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}
