import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scan_doc/data/models/token/token.dart';

class SecureStorageKeys {
  static const token = 'TOKEN';
}

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<Token?> getToken() async {
    String? token = await _storage.read(key: SecureStorageKeys.token);
    if (token == null) return null;
    return Token(accessToken: token);
  }

  Future<void> setToken({required Token token}) {
    return _storage.write(
      key: SecureStorageKeys.token,
      value: token.accessToken,
    );
  }

  Future<void> removeToken() => _storage.delete(key: SecureStorageKeys.token);
}
