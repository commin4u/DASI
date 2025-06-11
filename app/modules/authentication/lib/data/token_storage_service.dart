import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageService {
  static const _accessTokenKey = 'access_token';

  final _storage = FlutterSecureStorage(aOptions: _androidOptions);

  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  // Save tokens
  Future<void> saveToken({
    required String accessToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  // Get access token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // Delete tokens (for logout)
  Future<void> deleteToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // Check if token exists
  Future<bool> hasToken() async {
    final token = await _storage.read(key: _accessTokenKey);
    return token != null;
  }

  Future<void> clearToken() async {
    await _storage.deleteAll();
  }
}