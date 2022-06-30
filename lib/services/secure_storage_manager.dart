import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const TOKEN_KEY_NAME = 'authToken';

Future<String?> getUserAuthToken() async {
  final _storage = const FlutterSecureStorage();
  final token = await _storage.read(key: TOKEN_KEY_NAME);
  print(token);
  return token;
}

Future<String?> saveUserAuthToken(String token) async {
  final _storage = const FlutterSecureStorage();
  await _storage.write(key: TOKEN_KEY_NAME, value: token)
  .catchError((err) {
    print(err.toString());
  });
}

Future<void> deleteUserAuthToken() async {
  final _storage = const FlutterSecureStorage();
  final result = await _storage.delete(key: TOKEN_KEY_NAME);
  return result;
}

