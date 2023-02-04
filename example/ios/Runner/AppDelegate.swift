import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
   private var methodChannel1: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window.rootViewController as! FlutterViewController
    methodChannel1 = FlutterMethodChannel(name: "poc.deeplink.flutter.dev/channel1", binaryMessenger: controller.binaryMessenger)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      methodChannel1?.invokeMethod("didRecieveTranscript", arguments: url.absoluteString)
      return true
    }
}
