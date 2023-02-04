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

Add any URL schemes passed to `info.plist`

Example:

```xml
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLName</key>
        <string>deeplink.flutter.dev</string>
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

### Android

Coming Soon

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
