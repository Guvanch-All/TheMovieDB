import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//62 урок конец 63 средина 13:34
abstract class _Keys {
  static const sessionId = 'session-id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Keys.sessionId);

  Future<void> setSessionId(String? value) {
    if(value != null){
      return _secureStorage.write(key: _Keys.sessionId, value: value);
    }else{
      return _secureStorage.delete(key: _Keys.sessionId);
    }
  }

}
