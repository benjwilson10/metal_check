import Flutter
import UIKit

public class SwiftMetalCheckPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "metal_check", binaryMessenger: registrar.messenger())
    let instance = SwiftMetalCheckPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "isMetalAvailable":
         isMetalAvailable(call, result: result)
        break
      default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func isMetalAvailable(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let device = MTLCreateSystemDefaultDevice() else { 
      result(false)
      return;
    }
    result(true)
  }
}
