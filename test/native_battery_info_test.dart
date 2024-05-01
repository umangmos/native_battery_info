import 'package:flutter_test/flutter_test.dart';
import 'package:native_battery_info/native_battery_info.dart';
import 'package:native_battery_info/native_battery_info_method_channel.dart';
import 'package:native_battery_info/native_battery_info_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNativeBatteryInfoPlatform with MockPlatformInterfaceMixin implements NativeBatteryInfoPlatform {
  @override
  Future<num?> getBatteryLevel() => Future.value(21);
}

void main() {
  final NativeBatteryInfoPlatform initialPlatform = NativeBatteryInfoPlatform.instance;

  test('$MethodChannelNativeBatteryInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNativeBatteryInfo>());
  });

  test('getBatteryLevel', () async {
    NativeBatteryInfo nativeBatteryInfoPlugin = NativeBatteryInfo();
    MockNativeBatteryInfoPlatform fakePlatform = MockNativeBatteryInfoPlatform();
    NativeBatteryInfoPlatform.instance = fakePlatform;

    expect(await nativeBatteryInfoPlugin.getBatteryLevel(), 21);
  });
}
