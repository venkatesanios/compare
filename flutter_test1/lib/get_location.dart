import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(), // Your LocationScreen widget here
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _currentAddress = 'Fetching Address...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Get the user's current location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      // Use the latitude and longitude to fetch the address
      // String address =
      //     await _getAddressFromLatLng(position.latitude, position.longitude);

      String address = await _getAddressFromLatLng(11.047440, 76.985390);

      setState(() {
        _currentAddress = address;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<String> _getAddressFromLatLng(
      double latitude, double longitude) async {
    //141f83813e7951a962cdbc2d9598c30b
    //AIzaSyCMgmgazqGQjVr7LHxgztqRZZS9_WDoKxo
    final apiKey =
        'AIzaSyCMgmgazqGQjVr7LHxgztqRZZS9_WDoKxo'; // Replace with your Google Maps API key
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    print(response);
    final data = json.decode(response.body);
    print(data);

    if (response.statusCode == 200) {
      if (data['results'].isNotEmpty) {
        return data['results'][0]['formatted_address'];
      } else {
        return 'Address not found';
      }
    } else {
      throw Exception('Failed to fetch address');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Location and Address'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Address:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              _currentAddress,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
