import 'package:flutter/material.dart';

import '../uaepass.dart';
import 'model/uaepass_buttons.dart';

class UaepassLoginButton extends StatelessWidget {
  const UaepassLoginButton({
    Key? key,
    this.height = 50,
    this.onCallback,
    this.lang = UaepassLang.en,
    this.type = UaepassButtonType.normal,
    this.theme = UaePassButtonTheme.outline,
  }) : super(key: key);

  final VoidCallback? onCallback;

  final double height;
  final UaepassLang lang;
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
