import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

Future<String?> openGoogleAndGetToken(String url) async {
  final result = await FlutterWebAuth2.authenticate(
    url: url,
    callbackUrlScheme: "https",
  );

  final uri = Uri.parse(result);
  return uri.queryParameters['token'];
}
