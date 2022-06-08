import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MySecureCache {
  final _storage = const FlutterSecureStorage();
  Future<void> deleteCache(String key) async {
    return _storage.delete(key: key);
  }

  MySecureCache() {
    // _storage = new FlutterSecureStorage();
  }
  Future<Map<String, dynamic>?> readCache(String key) async {
    return _storage.read(key: key).then((value) {
      return value == null ? null : json.decode(value);
    });
  }

  Future<void> updateCache(String key, Map<String, dynamic> data) async {
    return _storage.write(key: key, value: json.encode(data));
  }
}
