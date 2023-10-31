import 'package:flutter/material.dart';

class ValveData {
  final String name;
  final String description;
  final DeviceStatus status;
  final DeviceStatus switchState;
  final String setTime;
  final String remTime;
  final String setFlow;
  final String remFlow;

  ValveData({
    required this.name,
    required this.description,
    required this.status,
    required this.switchState,
    required this.setTime,
    required this.remTime,
    required this.setFlow,
    required this.remFlow,
  });
}

enum DeviceStatus {
  notSet,
  error,
  completed,
  running,
  next,
  upcoming
}

Color getColorForStatus(DeviceStatus status) {
  switch (status) {
    case DeviceStatus.notSet:
      return Colors.grey;
    case DeviceStatus.error:
      return Colors.red;
    case DeviceStatus.completed:
      return Colors.green;
    case DeviceStatus.running:
      return Colors.blue;
    case DeviceStatus.next:
      return Colors.orange;
    case DeviceStatus.upcoming:
      return Colors.brown;
    default:
      return Colors.black;
  }
}