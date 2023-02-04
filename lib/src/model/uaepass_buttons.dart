// ignore_for_file: avoid_classes_with_only_static_members

import '../../uaepass.dart';

class UaepassButtons {
  static const String imagesPath = 'images/';
  static String getLanguage(Lang lang) => lang == Lang.en ? 'EN' : 'AR';

  static String loginButton({Lang lang = Lang.en}) =>
      '${imagesPath}login/Sharp_${getLanguage(lang)}.png';

  static String loginButtonRounded({Lang lang = Lang.en}) =>
      '${imagesPath}login/Outline_${getLanguage(lang)}.png';

  static String signInButton({
    UaepassButtonType type = UaepassButtonType.normal,
    UaePassButtonTheme theme = UaePassButtonTheme.outline,
    Lang lang = Lang.en,
  }) =>
      '${imagesPath}sign_in/${type.toShortString()}_${theme.toShortString()}_${lang.toShortString()}.png';
}
