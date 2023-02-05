import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../uaepass.dart';
import 'configuration.dart';
import 'model/uaepass_token.dart';
import 'model/uaepass_user.dart';

class UaePassAuthUrl {
  late String appUrl;
  late String successUrl;
}

mixin Helper {
  static Future<String> getLoginUrl() async {
    final baseUrl = Configuration.authroizeUrl;
    const redirectUrl = Configuration.redirectURL;
    const scope = Configuration.scope;
    const state = 'ShNP22hyl1jUU2RGjTRkpg==';
    const responseType = Configuration.responseType;

    var appInstalled = true;
    var acrValues = '';

    if (await canLaunchUrlString(
      '${Configuration.uaePassScheme}digitalid-users-ids',
    )) {
      appInstalled = true;
    }

    if (Configuration.app2App && appInstalled) {
      acrValues = Configuration.acrValuesMobile;
    } else {
      acrValues = Configuration.acrValuesWeb;
    }

    return '$baseUrl?'
        'redirect_uri=$redirectUrl'
        '&client_id=${Uaepass.instance.clientId}'
        '&state=$state'
        '&response_type=$responseType'
        '&scope=$scope'
        '&acr_values=$acrValues';
  }

  static UaePassAuthUrl getUaePassOpenUrl(Uri url) {
    final newUrl = '${Configuration.uaePassScheme}${url.host}${url.path}';
    final uaePassAuthUrl = UaePassAuthUrl();

    uaePassAuthUrl.appUrl = '$newUrl?'
        'successurl=${Configuration.successScheme}'
        '&failureurl=${Configuration.failScheme}'
        '&closeondone=true';
    uaePassAuthUrl.successUrl = url.queryParameters['successurl'].toString();

    return uaePassAuthUrl;
  }

  static Future<UaepassToken?> getTokenAsync(String code) async {
    final response = await http.post(
      Uri.parse(Configuration.tokenUrl),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'redirect_uri': Configuration.redirectURL,
        'client_id': Uaepass.instance.clientId,
        'client_secret': Uaepass.instance.clientSecret,
        'grant_type': Configuration.grantType,
        'code': code
      },
    );

    if (response.statusCode == 200) {
      return UaepassToken.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<UaepassUser?> getUser(String accessToken) async {
    final headers = {'Authorization': 'Bearer $accessToken'};

    final response = await http.get(
      Uri.parse(
        'https://stg-id.uaepass.ae/idshub/userinfo',
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return UaepassUser.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }
}
