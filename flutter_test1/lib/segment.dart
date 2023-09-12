import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'PermissionCheck.dart';
import 'package:flutter_test1/PermissionCheck.dart';
import 'package:get/get.dart';
import 'package:flutter_test1/localeString.dart';

class SegmentedButtonApp extends StatelessWidget {
  const SegmentedButtonApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.8, keepPage: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: 5,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(10.0),
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 207, 233, 244)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(top: 10.0),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Device name :$index ',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text('Device IMEI no :  ',
                                        style: TextStyle(fontSize: 14)),
                                    Banner(
                                      message: 'message.tr',
                                      location: BannerLocation.bottomEnd,
                                      color: Colors.red,
                                      child: Container(
                                        height: 100,
                                        width: double.infinity,
                                        color: Colors.green,
                                        child: Text(
                                            'test \n test1 123456 test \n test1 123456 test \n test1 123456'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.white,
                                onPressed: () {
                                  // setState(() {
                                  // SellDevicePvd.removeFunction(SellDevicePvd.getList[index]);
                                  // });
                                },
                                icon: Icon(
                                  Icons.clear_rounded,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // return pages[index % pages.length];
                    },
                  ),
                ),
                Spacer(),
                SizedBox(height: 20),
                Text('title2.tr'),
                Container(
                  child: MultipleChoice(
                    name: ['first', 'second', 'third', 'four'],
                  ),
                ),
                Spacer(),
                TextField(
                  keyboardType:
                      TextInputType.number, // Set the keyboard type to number
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]')), // Allow only digits (0-9)
                  ],
                  // numberWithOptions(
                  //   signed: false,
                  //   decimal: false,
                  // ),
                  // other arguments
                ),
                ElevatedButton(
                    onPressed: () {
                      PermissionClass()
                          .checkPermission(context, Permission.locationAlways);
                    },
                    child: Text('Permission'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _isVisible {}

class MultipleChoice extends StatefulWidget {
  List<String> name;
  MultipleChoice({Key? key, required this.name});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<String> selection = {'0'};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<String>(
      showSelectedIcon: false,
      segments: <ButtonSegment<String>>[
        for (var i in widget.name)
          ButtonSegment<String>(value: '$i', label: Text(i)),
      ],
      selected: selection,
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: false,
    );
  }
}
