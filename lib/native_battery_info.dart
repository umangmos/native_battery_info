import 'native_battery_info_platform_interface.dart';

class NativeBatteryInfo {
  Future<num?> getBatteryLevel() {
    return NativeBatteryInfoPlatform.instance.getBatteryLevel();
  }
}
