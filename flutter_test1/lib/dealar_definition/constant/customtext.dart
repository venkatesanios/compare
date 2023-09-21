import 'package:flutter/material.dart';
import 'package:flutter_test1/dealar_definition/constant/custom_text.dart';

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom TextField Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: TextEditingController(),
                  // labelText: 'Username',
                  // prefixIcon: Icons.person,
                  onChanged: (text) {
                    // Perform your action here, e.g., update a state variable
                    print('Text changed to: $text');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
