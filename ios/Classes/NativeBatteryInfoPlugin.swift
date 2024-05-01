import Flutter
import UIKit

public class NativeBatteryInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_battery_info", binaryMessenger: registrar.messenger())
    let instance = NativeBatteryInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getBatteryLevel":
        UIDevice.current.isBatteryMonitoringEnabled = true
        result(UIDevice.current.batteryLevel * 100)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
