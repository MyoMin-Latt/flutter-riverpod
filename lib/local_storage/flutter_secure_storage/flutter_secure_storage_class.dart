import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage;
  SecureStorage(this.storage);

  Future<void> saveData(String text) async {
    storage.write(key: 'key', value: text);
  }

  Future<void> getData() async {
    storage.read(key: 'key');
  }
}
