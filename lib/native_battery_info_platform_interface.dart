import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_battery_info_method_channel.dart';

abstract class NativeBatteryInfoPlatform extends PlatformInterface {
  /// Constructs a NativeBatteryInfoPlatform.
  NativeBatteryInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeBatteryInfoPlatform _instance = MethodChannelNativeBatteryInfo();

  /// The default instance of [NativeBatteryInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeBatteryInfo].
  static NativeBatteryInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeBatteryInfoPlatform] when
  /// they register themselves.
  static set instance(NativeBatteryInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<num?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}
