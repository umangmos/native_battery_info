import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_battery_info_platform_interface.dart';

/// An implementation of [NativeBatteryInfoPlatform] that uses method channels.
class MethodChannelNativeBatteryInfo extends NativeBatteryInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_battery_info');

  @override
  Future<num?> getBatteryLevel() {
    return methodChannel.invokeMethod<num?>('getBatteryLevel');
  }
}
