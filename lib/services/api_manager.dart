import 'dart:convert';

import 'package:cff_ap/config.dart';
import 'package:http/http.dart' as http;

import '../api_models/token_auth_response.dart';

Future<TokenAuthResponse> createTokenAuthResponse(
    String email, String password) async {
  final response = await http.post(
    Uri.parse('$DEV_ENDPOINT/api/v1/user/api-token-auth/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{"username": email, "password": password}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return TokenAuthResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create token.');
  }
}
