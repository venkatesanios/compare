import 'package:flutter/material.dart';

class MyAppkey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Custom PIN Entry Keyboard')),
          body: Center(
            child: PinEntryKeyboard(),
          )),
    );
  }
}

class PinEntryKeyboard extends StatefulWidget {
  @override
  _PinEntryKeyboardState createState() => _PinEntryKeyboardState();
}

class _PinEntryKeyboardState extends State<PinEntryKeyboard> {
  String enteredPin = '';

  void handleKeyTap(String key) {
    if (key == '<-') {
      if (enteredPin.isNotEmpty) {
        setState(() {
          enteredPin = enteredPin.substring(0, enteredPin.length - 1);
        });
      }
    } else if (key == 'L>') {
      // Handle PIN submission here
      print('Submitted PIN: $enteredPin');
    } else {
      if (enteredPin.length < 4) {
        setState(() {
          enteredPin += key;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter PIN:',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          enteredPin,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            final keys = [
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '<-',
              '0',
              'L>'
            ];

            return InkWell(
              onTap: () {
                handleKeyTap(keys[index]);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                height: 10,
                width: 0,
                child: Text(
                  keys[index],
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
            );
          },
          itemCount: 12,
        ),
      ],
    );
  }
}
