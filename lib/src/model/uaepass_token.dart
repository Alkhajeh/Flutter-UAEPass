class UaepassToken {
  String? accessToken;
  String? scope;
  String? tokenType;
  int? expiresIn;

  UaepassToken({this.accessToken, this.scope, this.tokenType, this.expiresIn});

  UaepassToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }
}
