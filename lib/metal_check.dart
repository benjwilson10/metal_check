import 'dart:async';

import 'package:flutter/services.dart';

class MetalCheck {
  static const MethodChannel _channel = const MethodChannel('metal_check');

  static Future<bool> get isMetalAvailable async {
    final bool isAvailable = await _channel.invokeMethod('isMetalAvailable');
    return isAvailable;
  }
}
