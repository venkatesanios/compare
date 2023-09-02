import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, dynamic>> availableLanguages = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'Tamil', 'locale': Locale('ta', 'IN')},
    {'name': 'Malayalam', 'locale': Locale('ml', 'IN')},
    {'name': 'Kannada', 'locale': Locale('kn', 'IN')},
    {'name': 'Hindi', 'locale': Locale('hi', 'IN')},
    {'name': 'Telugu', 'locale': Locale('te', 'IN')},
  ];

  updateLanguage(Locale locale) {
    // Replace this with your actual logic to update the language
    // For demonstration purposes, I'm just printing the locale name.
    // print('Changing to ${locale.languageCode} - ${locale.countryCode}');
    Get.back();
    //Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Select one language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: availableLanguages.map((language) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(language['name']),
                    leading: Radio(
                      value: language['name'],
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value.toString();
                          updateLanguage(language['locale']);
                          // print('$selectedLanguage : ${language['locale'].tr}');
                          print(selectedLanguage.tr);
                        });
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Selected Language: ${selectedLanguage.tr}'),
            ),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Next')))
          ],
        ),
      ),
    );
  }
}
