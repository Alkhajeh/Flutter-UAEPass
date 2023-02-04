// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';

import 'src/configuration.dart';
import 'src/helper.dart';
import 'src/model/uaepass_token.dart';
import 'src/model/uaepass_user.dart';
import 'src/uaepass_login_view.dart';

export 'src/configuration.dart';
export 'src/uaepass_login_button.dart';

enum Lang { en, ar }

class Uaepass {
  static Uaepass? _instance;
  Uaepass._({
    required this.env,
    required this.fullscreen,
    required this.showMessages,
    required this.appScheme,
  });

  static Uaepass init({
    required UaePassEnv env,
    required String appScheme,
    bool fullscreen = true,
    bool showMessages = true,
  }) =>
      _instance = Uaepass._(
        env: env,
        fullscreen: fullscreen,
        showMessages: showMessages,
        appScheme: appScheme,
      );

  static Uaepass get instance {
    if (_instance == null) {
      throw Exception('Initialize UAEPass plugin first.');
    }

    return _instance!;
  }

  String? code;
  bool showMessages;
  UaepassToken? token;
  UaepassUser? user;
  bool fullscreen;
  UaePassEnv env;
  String appScheme;

  bool isLoggedIn() {
    return code != null;
  }

  Future<void> login(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UaepassLoginView(),
        fullscreenDialog: fullscreen,
      ),
    );

    if (code == null) return;
    token = await Helper.getTokenAsync(code!);
    if (token == null) return;
    user = await Helper.getUser(token!.accessToken!);
  }
}
