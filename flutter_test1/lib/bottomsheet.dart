import 'package:flutter/material.dart';

class DraggableFullScreenSheetApp extends StatelessWidget {
  const DraggableFullScreenSheetApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Draggable Full Screen Bottom Sheet')),
        body: const DraggableFullScreenSheetExample(),
      ),
    );
  }
}

class DraggableFullScreenSheetExample extends StatefulWidget {
  const DraggableFullScreenSheetExample({Key? key});

  @override
  _DraggableFullScreenSheetExampleState createState() =>
      _DraggableFullScreenSheetExampleState();
}

class _DraggableFullScreenSheetExampleState
    extends State<DraggableFullScreenSheetExample> {
  double _sheetOffset = 0;
  double _initialOffset = 0;
  double _screenHeight = 0;

  @override
  void initState() {
    super.initState();
    _screenHeight = 1600;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        _initialOffset = _sheetOffset;
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          _sheetOffset = _initialOffset + details.primaryDelta!;
          if (_sheetOffset < 0) {
            _sheetOffset = 0;
          } else if (_sheetOffset > _screenHeight) {
            _sheetOffset = _screenHeight;
          }
        });
      },
      child: Stack(
        children: [
          Scaffold(
            appBar:
                AppBar(title: const Text('Draggable Full Screen Bottom Sheet')),
            body: Center(
              child: ElevatedButton(
                child: const Text('Open Full Screen Bottom Sheet'),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 0.2,
                        maxChildSize: 1,
                        minChildSize: 0.2,
                        builder: (context, controller) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return GestureDetector(
                                onVerticalDragUpdate: (details) {
                                  setState(() {
                                    _sheetOffset =
                                        _initialOffset + details.primaryDelta!;
                                    if (_sheetOffset < 0) {
                                      _sheetOffset = 0;
                                    } else if (_sheetOffset > _screenHeight) {
                                      _sheetOffset = _screenHeight;
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  height: constraints.maxHeight - _sheetOffset,
                                  color: Colors.amber,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text(
                                            'Draggable Full Screen Bottom Sheet'),
                                        ElevatedButton(
                                          child:
                                              const Text('Close Bottom Sheet'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: _sheetOffset,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  _sheetOffset = _initialOffset + details.primaryDelta!;
                  if (_sheetOffset < 0) {
                    _sheetOffset = 0;
                  } else if (_sheetOffset > _screenHeight) {
                    _sheetOffset = 800;
                  }
                });
              },
              child: Container(
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: const Icon(Icons.drag_handle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
