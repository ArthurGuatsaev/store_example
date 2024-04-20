import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "file_reader",
                                              binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler({
        [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        guard call.method == "tryReadFile" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.receiveFileData(result: result)

    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func receiveFileData(result: FlutterResult) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("test.txt")
            
            if FileManager.default.fileExists(atPath: fileURL.path) {
                print("Файл test.txt найден по пути \(fileURL.path)")
                let text=try? String(contentsOf: fileURL)
                    if (text == nil) {
                result(FlutterError(code: "UNAVAILABLE",
                                        message: "file is not available.",
                                        details: nil))
                    } else {
                        result(String(text!))
                    }
            } else {
                print("Файл test.txt не найден")
                result(FlutterError(code: "UNAVAILABLE",
                                    message: "file path \(fileURL.path) is not available.",
                                        details: nil))

            }
            
        }
        
            
            
        

      
    }

}
