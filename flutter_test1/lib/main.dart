import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test1/alert.dart';
import 'package:flutter_test1/bottomsheet.dart';
import 'package:flutter_test1/create_dealerdifinition/createdealerdifinition.dart';
import 'package:flutter_test1/dealar_definition/constant/customtext.dart';
import 'package:flutter_test1/dealar_definition/dealer_Screen.dart';
import 'package:flutter_test1/dealar_definition/newdealerscreen.dart';
import 'package:flutter_test1/dealar_definition/newfile.dart';
import 'package:flutter_test1/geo_location.dart';
import 'package:flutter_test1/get_location.dart';
import 'package:flutter_test1/gkeyboard.dart';
import 'package:flutter_test1/googlemap.dart';
import 'package:flutter_test1/keyboard_dismiss.dart';
import 'package:flutter_test1/language.dart';
import 'package:flutter_test1/metadata.dart';
import 'package:flutter_test1/product/product_Screen.dart';
import 'package:flutter_test1/product/product_ViewModel.dart';
import 'package:flutter_test1/segment.dart';
import 'package:flutter_test1/product/state_management/add_product_provider.dart';
import 'package:flutter_test1/tabbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DismissKeyboard(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductViewModel()),
        ChangeNotifierProvider(create: (context) => AddProductProvider()),

        // ChangeNotifierProvider(create: (context) => CustomerDevicePvd()),
        // ChangeNotifierProvider(create: (context) => SellDeviceProvider()),
        // ChangeNotifierProvider(create: (context) => DeviceListViewModel()),
      ],
      child: DealerScreen(),
    ),
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
        child: DealerDefinitionScreen(),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
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
      decoration: const InputDecoration(
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
        trailing: const Icon(Icons.message),
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
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
