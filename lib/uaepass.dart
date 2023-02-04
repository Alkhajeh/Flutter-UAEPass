// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/material.dart';

import 'src/enums.dart';
import 'src/helper.dart';
import 'src/model/uaepass_token.dart';
import 'src/model/uaepass_user.dart';
import 'src/uaepass_login_view.dart';

export 'src/enums.dart';
export 'src/uaepass_login_button.dart';

class Uaepass {
  static Uaepass? _instance;
  Uaepass._({
    required this.env,
    required this.fullscreen,
    required this.showMessages,
    required this.appScheme,
    required this.clientId,
    required this.clientSecret,
  });

  static Uaepass init({
    required UaePassEnv env,
    required String appScheme,
    required String clientId,
    required String clientSecret,
    bool fullscreen = true,
    bool showMessages = true,
  }) =>
      _instance = Uaepass._(
        env: env,
        fullscreen: fullscreen,
        showMessages: showMessages,
        appScheme: appScheme,
        clientId: clientId,
        clientSecret: clientSecret,
      );

  static Uaepass get instance {
    if (_instance == null) {
      throw Exception('Initialize UAEPass plugin first.');
    }

    return _instance!;
  }

  final UaePassEnv env;
  final String appScheme;
  final String clientId;
  final String clientSecret;
  final bool showMessages;
  final bool fullscreen;
  String? _code;
  UaepassToken? _token;
  UaepassUser? _user;

  /// Get authorization code
  String? get code => _code;

  /// Get user token
  UaepassToken? get token => _token;

  /// Get user information
  UaepassUser? get user => _user;

  /// Check if user is logged in
  bool isLoggedIn() {
    return _code != null;
  }

  /// Initiate UAEPass login
  Future<void> login(BuildContext context) async {
    final code = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UaepassLoginView(),
        fullscreenDialog: fullscreen,
      ),
    );

    if (code == null) return;
    _code = code;

    if (code == null) return;
    _token = await Helper.getTokenAsync(code!);
    if (_token == null) return;
    _user = await Helper.getUser(_token!.accessToken!);
  }
}
