import 'package:flutter/material.dart';
import 'package:sample_plugin_flutter/sample_plugin_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Phần 2. Hướng dẫn tạo Widget với plugin
              SampleButton(
                text: "Sample Button",
                onPressed: () {
                  print("Sample Button Click");
                },
              ),

              /// Phần 3. Hướng dẫn gọi native code từ plugin
              FutureBuilder<String?>(
                future: SampleCallNativeFlutter.platformVersion,
                builder: (_, snapshoot) {
                  return Text(snapshoot.data ?? '');
                },
              ),

              /// Phần 4. Hướng dẫn gọi native code từ plugin
              FutureBuilder<bool?>(
                future: SampleCallNativeFlutter.isToday(DateTime.now()),
                builder: (_, snapshoot) {
                  return Text('isToDay: ${DateTime.now()} is ${snapshoot.data}');
                },
              ),
              FutureBuilder<bool?>(
                future: SampleCallNativeFlutter.isToday(DateTime(2021,01,01)),
                builder: (_, snapshoot) {
                  return Text('isToDay: ${DateTime(2021,01,01)} is ${snapshoot.data}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}