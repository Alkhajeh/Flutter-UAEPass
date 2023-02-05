// ignore_for_file: avoid_classes_with_only_static_members

import '../uaepass.dart';

class Configuration {
  static const bool app2App = true;

  static String get baseUrl => Uaepass.instance.env == UaePassEnv.stg
      ? 'https://stg-id.uaepass.ae'
      : 'https://id.uaepass.ae';

  static String authroizeUrl = '$baseUrl/idshub/authorize';
  static String tokenUrl = '$baseUrl/idshub/token';
  static String profileUrl = '$baseUrl/idshub/userinfo';
  static String tokenTXUrl = '$baseUrl/trustedx-authserver/oauth/main-as/token';
  static String createDocumentUrl =
      '$baseUrl/trustedx-resources/esignsp/v2/signer_processes';

  static String get uaePassScheme =>
      Uaepass.instance.env == UaePassEnv.stg ? 'uaepassstg://' : 'uaepass://';

  static String successScheme = '${Uaepass.instance.appScheme}://success';
  static String failScheme = '${Uaepass.instance.appScheme}://failure';

  static const String redirectURL =
      'https://dev-ds.smartdubai.ae/auth/auth-return';
  static const String grantType = 'authorization_code';
  static const String grantTypeTX = 'client_credentials';
  static const String scope = 'urn:uae:digitalid:profile:general';
  static const String scopeDocument =
      'urn%3Asafelayer%3Aeidas%3Asign%3Aprocess%3Adocument';
  static const String responseType = 'code';

  static const String acrValuesWeb =
      'urn:safelayer:tws:policies:authentication:level:low';
  static const String acrValuesMobile =
      'urn:digitalid:authentication:flow:mobileondevice';
}
