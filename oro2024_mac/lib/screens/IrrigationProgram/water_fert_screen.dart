import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/irrigation_program_main_provider.dart';

class WaterAndFertScreen extends StatefulWidget {
  const WaterAndFertScreen({super.key});

  @override
  State<WaterAndFertScreen> createState() => _WaterAndFertScreenState();
}

class _WaterAndFertScreenState extends State<WaterAndFertScreen> {
  List<List<String>> sequence = [['1.1','1.2','1.5'],['2.2','2.3'],['3.1','3.4'],['4.3','4.5']];
  int SelectedGroup = 0;

  @override
  Widget build(BuildContext context) {
    final programPvd = Provider.of<IrrigationProgramMainProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0XFFF3F3F3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 60,
            child: programPvd.sequencedValves.isNotEmpty
                ? ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: programPvd.sequencedValves.length,
              itemBuilder: (context, index) {
                final valveList = programPvd.sequencedValves[index];
                final valveListAsString = valveList.join(' , ');
                final nonEmptyStrings = valveList.where((valve) => valve.isNotEmpty).toList();
                return InkWell(
                  onTap: (){
                    setState(() {
                      SelectedGroup = index;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: SelectedGroup == index ? Theme.of(context).colorScheme.secondary : Theme.of(context).primaryColor,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          nonEmptyStrings.join(' , '),
                          style: TextStyle(fontWeight: FontWeight.bold, color: SelectedGroup == index ? Colors.black : Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
                : const Center(child: Text('Select desired sequence')),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.yellow.shade200,
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text('Water dosage',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage method'),
                                          DropdownButton(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              value: '-',
                                              items: ['-','m3/h','time'].map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      child: Text(items,style: TextStyle(fontSize: 11,color: Colors.black),)
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value){

                                              }),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage planned'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.yellow.shade200,
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text('Local fertilization dosage ',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 8),
                        child: Text('Local Fert Site 1',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage method'),
                                          DropdownButton(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              value: '-',
                                              items: ['-','m3/h','time'].map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      child: Text(items,style: TextStyle(fontSize: 11,color: Colors.black),)
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value){

                                              }),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage planned'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 8),
                        child: Text('Local Fert Site 2',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage method'),
                                          DropdownButton(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              value: '-',
                                              items: ['-','m3/h','time'].map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      child: Text(items,style: TextStyle(fontSize: 11,color: Colors.black),)
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value){

                                              }),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage planned'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.yellow.shade200,
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text('Central fertilization dosage ',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 8),
                        child: Text('Central Fert Site 1',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage method'),
                                          DropdownButton(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              value: '-',
                                              items: ['-','m3/h','time'].map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      child: Text(items,style: TextStyle(fontSize: 11,color: Colors.black),)
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value){

                                              }),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage planned'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,top: 8),
                        child: Text('Central Fert Site 2',style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage method'),
                                          DropdownButton(
                                              underline: Container(),
                                              focusColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              value: '-',
                                              items: ['-','m3/h','time'].map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                      child: Text(items,style: TextStyle(fontSize: 11,color: Colors.black),)
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value){

                                              }),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Water dosage planned'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.yellow.shade200,
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text('Pre/Post watering',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Pre watering'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Post watering'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        color: Colors.yellow.shade200,
                        width: double.infinity,
                        height: 30,
                        child: Center(child: Text('EC and pH',style: TextStyle(fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height : 140,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),

                            children: [
                              ...ListTile.divideTiles(
                                  context: context,
                                  color: Colors.black,
                                  tiles: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('EC'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('EC'),
                                          SizedBox(
                                            width: 100,
                                            child: TextFormField(
                                              initialValue: '',
                                              decoration: InputDecoration(
                                                  fillColor: Colors.transparent,
                                                  border: OutlineInputBorder()
                                              ),
                                            ),
                                          )

                                        ],
                                      ),
                                    )
                                  ]).toList()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }

}
class ProgramDropDownButton extends StatefulWidget {
  const ProgramDropDownButton({super.key});

  @override
  State<ProgramDropDownButton> createState() => _ProgramDropDownButtonState();
}

class _ProgramDropDownButtonState extends State<ProgramDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

