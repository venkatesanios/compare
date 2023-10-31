import 'package:flutter/material.dart';

class WaterValveApp extends StatelessWidget {
  const WaterValveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Water Valve Animation'),
        ),
        body: Center(
          child: WaterValveAnimation(),
        ),
      ),
    );
  }
}

class WaterValveAnimation extends StatefulWidget {
  @override
  _WaterValveAnimationState createState() => _WaterValveAnimationState();
}

class _WaterValveAnimationState extends State<WaterValveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  // Water background
                  Positioned.fill(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  // Water flowing
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: _controller.value * 100,
                    child: Container(
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Text('Water Valve'),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
