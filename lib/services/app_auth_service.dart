import 'package:flutter_appauth/flutter_appauth.dart';
import 'dart:io' show Platform;

class AppAuthService {
  static final AppAuthService shared = AppAuthService();

  // AppAuth Variables
  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  String? _codeVerifier;
  String? _nonce;
  String? _authorizationCode;
  String? accessToken;
  String? idToken;

  // Constants
  final String _clientId = Platform.isIOS
      ? 'd'
      : 'f';
  final String _redirectUrl = Platform.isIOS
      ? 'app://dredirect'
      : 'app:/doauth2redirect';
  final String _discoveryUrl =
      'htf-configuration';
  final List<String> _scopes = <String>['openid'];

  Future<void> authorize() async {
    try {
      final AuthorizationResponse? authResponse =
          await _appAuth.authorize(AuthorizationRequest(
        _clientId,
        _redirectUrl,
        discoveryUrl: _discoveryUrl,
        scopes: _scopes,
      ));

      if (authResponse != null) {
        // Getting Code
        _authorizationCode = authResponse.authorizationCode;
        _codeVerifier = authResponse.codeVerifier;
        _nonce = authResponse.nonce;

        // Getting AccessToken
        final TokenResponse? tokenResponse = await _appAuth.token(TokenRequest(
            _clientId, _redirectUrl,
            authorizationCode: _authorizationCode,
            discoveryUrl: _discoveryUrl,
            codeVerifier: _codeVerifier,
            nonce: _nonce,
            scopes: _scopes));

        // Parse Token
        if (tokenResponse != null) {
          accessToken = tokenResponse.accessToken;
          idToken = tokenResponse.idToken;
          print('token parsed');
        }
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
