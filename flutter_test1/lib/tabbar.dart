import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tabar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Flutter Tab bar',
      home: TabLayoutExample(),
    );
  }
}

class TabLayoutExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabLayoutExampleState();
  }
}

class _TabLayoutExampleState extends State<TabLayoutExample>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _tabController.animateTo(2);
  }

  static const List<Tab> _tabs = [
    Tab(icon: Icon(Icons.looks_one), child: Text('Tab One')),
    Tab(icon: Icon(Icons.looks_two), text: 'Tab Two'),
    Tab(icon: Icon(Icons.looks_3), text: 'Tab Three'),
    Tab(icon: Icon(Icons.looks_4), text: 'Tab Four'),
    Tab(icon: Icon(Icons.looks_5), text: 'Tab Five'),
    Tab(icon: Icon(Icons.looks_6), text: 'Tab Six'),
  ];

  static const List<Widget> _views = [
    Center(child: Text('Content of Tab One')),
    Center(child: Text('Content of Tab Two')),
    Center(child: Text('Content of Tab Three')),
    Center(child: Text('Content of Tab Four')),
    Center(child: Text('Content of Tab Five')),
    Center(child: Text('Content of Tab Six')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontStyle: FontStyle.italic),
              overlayColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Color.fromARGB(255, 216, 60, 206);
                }
                if (states.contains(MaterialState.focused)) {
                  return Colors.orange;
                } else if (states.contains(MaterialState.hovered)) {
                  return const Color.fromARGB(255, 216, 60, 206);
                }

                return Colors.transparent;
              }),
              indicatorWeight: 10,
              indicatorColor: const Color.fromARGB(255, 54, 244, 177),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              indicator: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 54, 244, 155)),
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 216, 60, 206),
              ),
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              onTap: (int index) {
                print('Tab $index is tapped');
              },
              enableFeedback: true,
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              tabs: _tabs,
            ),
            title: const Text(' Flutter Tab bar'),
            backgroundColor: Colors.teal,
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: _views,
          ),
        ),
      ),
    );
  }
}
