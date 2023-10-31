import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeviceListViewModel extends ChangeNotifier {
  final List<Device> _devices = [
    Device(
        areaName: 'chennai',
        name: 'venkatesan',
        imeiNumber: '98767654432',
        profileImage: 's',
        deviceName: 'pump'),
    Device(
        areaName: 'covai',
        name: 'tamil',
        imeiNumber: '6987654321',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'Erode',
        name: 'Arun',
        imeiNumber: '8767646545',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'chennai',
        name: 'venugopal',
        imeiNumber: '1214324324',
        profileImage: 's',
        deviceName: 'pump'),
    Device(
        areaName: 'covai',
        name: 'tamil selvan',
        imeiNumber: '994477623',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'Erode',
        name: 'AKIL',
        imeiNumber: '987664545215',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'covai',
        name: 'Siva prakash',
        imeiNumber: '994477623',
        profileImage: 'T',
        deviceName: 'pump'),
    Device(
        areaName: 'ooty',
        name: 'Siva',
        imeiNumber: '87664545215',
        profileImage: 'v',
        deviceName: 'Smart'),
    Device(
        areaName: 'covai',
        name: 'prakash',
        imeiNumber: '97664545215',
        profileImage: 'v',
        deviceName: 'oro'),
  ];
  List<Device> _filteredDevices = [];

  List<Device> get devices =>
      _filteredDevices.isEmpty ? _devices : _filteredDevices;

  void searchDevices(String query) {
    if (query.isEmpty) {
      _filteredDevices.clear();
    } else {
      _filteredDevices = _devices.where((device) {
        final lowerQuery = query.toLowerCase();
        return device.name.toLowerCase().startsWith(lowerQuery) ||
            device.imeiNumber.toLowerCase().contains(lowerQuery) ||
            device.areaName.toLowerCase().startsWith(lowerQuery) ||
            device.deviceName.toLowerCase().startsWith(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }
}


class SharedDevice extends StatefulWidget {
  const SharedDevice({Key? key}) : super(key: key);

  @override
  _SharedDeviceState createState() => _SharedDeviceState();
}

class _SharedDeviceState extends State<SharedDevice> {
  bool isSearching = false;
  final FocusNode _searchFocus = FocusNode();


  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextFormField(
          focusNode: _searchFocus,
          autofocus: true,
          keyboardType: TextInputType.text,
          onChanged: viewModel.searchDevices,
          decoration: const InputDecoration(
            hintText: 'Search devices...',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize, color: Colors.white),
          onEditingComplete: (){
            setState(() {
              isSearching = !isSearching;
            });
            _searchFocus.unfocus();
          },
        )
            : const Text('Shared Device List'),
        actions: [
          IconButton(
            icon: isSearching ? const Icon(Icons.cancel) : const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (isSearching) {
                  _searchFocus.requestFocus();
                } else {
                  _searchFocus.unfocus();
                  viewModel.searchDevices('');
                }
              });

            },
          ),
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            child: DeviceList(),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: 'Search devices...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  List<bool> isStarredList = [];

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<DeviceListViewModel>(context, listen: false);
    isStarredList = List.generate(viewModel.devices.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DeviceListViewModel>(context);

    return ListView.builder(
      itemCount: viewModel.devices.length,
      itemBuilder: (context, index) {
        final device = viewModel.devices[index];
        return ListTile(
          tileColor: Colors.white,
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          title: Text(device.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('IMEI: ${device.imeiNumber}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87)),
              Text('Area: ${device.areaName}',
                  style: const TextStyle(fontSize: 12, color: Colors.black87)),
            ],
          ),
          trailing: GestureDetector(
            onTap: () {
              setState(() {
                isStarredList[index] = !isStarredList[index];
              });
            },
            child: Icon(
              isStarredList[index] ? Icons.star : Icons.star_border,
              color: isStarredList[index] ? Colors.orange : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}

class Device {
  final String name;
  final String imeiNumber;
  final String areaName;
  final String deviceName;
  final String profileImage;

  Device({
    required this.name,
    required this.imeiNumber,
    required this.areaName,
    required this.deviceName,
    required this.profileImage,
  });
}