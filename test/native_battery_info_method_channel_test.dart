import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:native_battery_info/native_battery_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNativeBatteryInfo platform = MethodChannelNativeBatteryInfo();
  const MethodChannel channel = MethodChannel('native_battery_info');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getBatteryLevel') {
        return 21;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getBatteryLevel', () async {
    expect(await platform.getBatteryLevel(), 21.0);
  });
}
