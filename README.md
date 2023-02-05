# uaepass

[![Generic badge](https://img.shields.io/badge/platform-android%20|%20ios%20-blue.svg)](https://pub.dev/packages/uaepass)

![Default](https://user-images.githubusercontent.com/12137414/216746446-74762242-d43e-4495-84c6-c73c29bf62f3.png)

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  uaepass: <latest_version>
```

### iOS

Add the below to `info.plist`

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>uaepass</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>{custom App Scheme}</string>
        </array>
    </dict>
</array>
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>uaepass</string> // for Production
    <string>uaepassstg</string> // for Staging
</array>
```

Update `AppDelegate.swift` as per below

```swift
import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
   private var methodChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window.rootViewController as! FlutterViewController
    methodChannel = FlutterMethodChannel(name: "{custom App Scheme}.uaepass/channel", binaryMessenger: controller.binaryMessenger)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      methodChannel?.invokeMethod("didRecieveTranscript", arguments: url.absoluteString)
      return true
    }
}
```

### Android

Add the below to `AndroidManifest.xml`

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data
        android:scheme="{custom App Scheme}"
        android:host="uaepass" />
</intent-filter>
```

```xml
<manifest>
   ...
    <queries>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
         </intent>
        <package android:name="ae.uaepass.mainapp" />
        <package android:name="ae.uaepass.mainapp.stg" />
    </queries>
</manifest>
```

Update `MainActivity.kt` as per below

```kotlin
import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channel = "poc.uaepass/channel1"
    private var methodChannel: MethodChannel? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor, channel)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        methodChannel?.invokeMethod("didRecieveTranscript", "")
    }
}
```

## Use it

```dart
import 'package:uaepass/uaepass.dart';

UaepassLoginButton();
```

## Example

<?code-excerpt "basic.dart (basic-example)"?>

```dart
import 'package:flutter/material.dart';
import 'package:uaepass/uaepass.dart';

void main() {
  Uaepass.init(
    env: UaePassEnv.stg,
    appScheme: '{custom App Scheme}',
    clientId: 'sandbox_stage',
    clientSecret: 'sandbox_stage',
  );
  runApp(
    const MaterialApp(
      home: Material(
        child: Center(
          child: UaepassLoginButton(),
        ),
      ),
    ),
  );
}

```
