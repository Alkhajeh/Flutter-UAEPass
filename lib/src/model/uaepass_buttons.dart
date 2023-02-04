// ignore_for_file: avoid_classes_with_only_static_members

import '../../uaepass.dart';

extension ParseToString on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}

class UaepassButtons {
  static const String imagesPath = 'images/';
  static String getLanguage(UaepassLang lang) =>
      lang == UaepassLang.en ? 'EN' : 'AR';

  static String loginButton({UaepassLang lang = UaepassLang.en}) =>
      '${imagesPath}login/Sharp_${getLanguage(lang)}.png';

  static String loginButtonRounded({UaepassLang lang = UaepassLang.en}) =>
      '${imagesPath}login/Outline_${getLanguage(lang)}.png';

  static String signInButton({
    UaepassButtonType type = UaepassButtonType.normal,
    UaePassButtonTheme theme = UaePassButtonTheme.outline,
    UaepassLang lang = UaepassLang.en,
  }) =>
      '${imagesPath}sign_in/${type.toShortString()}_${theme.toShortString()}_${lang.toShortString()}.png';
}
