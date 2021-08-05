import 'dart:async';

import 'package:flutter/services.dart';

class SampleCallNativeFlutter {
  static const MethodChannel _channel =
      const MethodChannel('sample_plugin_flutter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool?> isToday(DateTime dateTime) async {
    final date = dateTime.toUtc().toIso8601String();
    final bool? isSuccess = await _channel.invokeMethod(
      'isToday',
      {
        'dateTime': date,
      },
    );
    return isSuccess;
  }
}
