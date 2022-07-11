import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceStorage {
  final _storage = const FlutterSecureStorage();
  final _tokenName = 'token';
  final _notificationId = 'notifId';

  Future<void> setToken(String token) async =>
      await _storage.write(key: _tokenName, value: token);

  Future<String?> getToken() async {
    final token = await _storage.read(key: _tokenName);
    return token;
  }

  Future<String?> getNotificationId() async {
    final String id = await _storage.read(key: _notificationId) ?? "1";
    final int increment = int.parse(id) + 1;
    await _storage.write(key: _notificationId, value: "$increment");
    return increment.toString();
  }

  Future<void> clearAllStorage() => _storage.deleteAll();
}
