import 'dart:async';

import 'package:flutter/services.dart';

/// method channel.
const MethodChannel _channel = MethodChannel('lib_app');

Future<String?> initData(List<String> listNumber) async =>
    await _channel.invokeMethod('init_data', {'number' : listNumber});


Future<String?> checkData() async =>
    await _channel.invokeMethod('checkData');