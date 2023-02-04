import 'package:flutter/material.dart';

import '../uaepass.dart';
import 'model/uaepass_buttons.dart';

enum UaepassButtonType { normal, pill, sharp }

enum UaePassButtonTheme { outline, white, dark }

extension ParseToString on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}

class UaepassLoginButton extends StatelessWidget {
  const UaepassLoginButton({
    Key? key,
    this.height = 50,
    this.onCallback,
    this.lang = Lang.en,
    this.type = UaepassButtonType.normal,
    this.theme = UaePassButtonTheme.outline,
  }) : super(key: key);

  final VoidCallback? onCallback;

  final double height;
  final Lang lang;
  final UaepassButtonType type;
  final UaePassButtonTheme theme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Uaepass.instance.login(context);
        if (onCallback == null) return;
        onCallback!();
      },
      child: Ink.image(
        image: AssetImage(
          UaepassButtons.signInButton(lang: lang, theme: theme, type: type),
        ),
        fit: BoxFit.fitWidth,
        width: height * 5.74,
        height: height,
      ),
    );
  }
}
