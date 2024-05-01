import 'package:flutter/material.dart';
import 'package:native_battery_info/native_battery_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // plugin instanciation
  final _mybatterypluginPlugin = NativeBatteryInfo();

  // this is where we will store the battery level
  num? _batteryLevel;

  @override
  void initState() {
    super.initState();

    // execute the method to retrieve the battery level
    _mybatterypluginPlugin.getBatteryLevel().then((batteryLevel) {
      setState(() {
        _batteryLevel = batteryLevel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // we display the battery level
          child: _batteryLevel != null ? Text('Battery Level is: $_batteryLevel') : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
