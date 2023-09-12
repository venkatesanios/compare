import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test1/alert.dart';
import 'package:flutter_test1/bottomsheet.dart';
import 'package:flutter_test1/geo_location.dart';
import 'package:flutter_test1/get_location.dart';
import 'package:flutter_test1/gkeyboard.dart';
import 'package:flutter_test1/googlemap.dart';
import 'package:flutter_test1/language.dart';
import 'package:flutter_test1/metadata.dart';
import 'package:flutter_test1/product/ProductScreen.dart';
import 'package:flutter_test1/product/ProductViewModel.dart';
import 'package:flutter_test1/segment.dart';
import 'package:flutter_test1/state_management/add_product_provider.dart';
import 'package:flutter_test1/tabbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductViewModel()),
      ChangeNotifierProvider(create: (context) => AddProductProvider()),

      // ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
      // ChangeNotifierProvider(create: (context) => SellDeviceProvider()),
      // ChangeNotifierProvider(create: (context) => DeviceListViewModel()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ContactBloc(),
        child: ProductForm(),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ContactList(),
          ),
        ],
      ),
    );
  }
}

class Contact {
  final String name;
  final String number;
  final String message;

  Contact(this.name, this.number, this.message);
}

enum ContactEvent { filterContacts }

class ContactBloc extends Bloc<ContactEvent, List<Contact>> {
  final List<Contact> allContacts = [
    Contact('John Doe', '+1234567890', 'Hello there!'),
    Contact('Jane Smith', '+9876543210', 'Hi! How are you?'),
    Contact('Doe', '+1234567890', 'Hello there!'),
    Contact('Smith', '+9876543210', 'Hi! How are you?'),
    Contact('ve', '+1234567890', 'Hello there!'),
    Contact('Jishi', '+9876543210', 'Hi! How are you?'),
    // Add more contacts...
  ];

  ContactBloc() : super([]);

  @override
  Stream<List<Contact>> mapEventToState(ContactEvent event) async* {
    if (event == ContactEvent.filterContacts) {
      yield allContacts; // Replace with your filtering logic
    }
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) {
        context.read<ContactBloc>().add(ContactEvent.filterContacts);
      },
      decoration: InputDecoration(
        labelText: 'Search',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, List<Contact>>(
      builder: (context, contacts) {
        return ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactCard(contact: contacts[index]);
          },
        );
      },
    );
  }
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text(contact.name[0]),
        ),
        title: Text(contact.name),
        subtitle: Text(contact.message),
        trailing: Icon(Icons.message),
      ),
    );
  }
}

class MetadataItem extends StatelessWidget {
  final String label;
  final String value;

  MetadataItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
