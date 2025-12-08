import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Вспомогательный класс для работы с NSUserDefaults (на iOS) и DataStore Preferences (на Android).
class SharedPreferencesHelper {
  final SharedPreferencesAsync _storage;

  SharedPreferencesHelper([@visibleForTesting SharedPreferencesAsync? storage])
    : _storage = storage ?? SharedPreferencesAsync();

  Future<T?> read<T>(String key) async {
    if (T == bool) {
      return await _storage.getBool(key) as T?;
    } else if (T == int) {
      return await _storage.getInt(key) as T?;
    } else if (T == double) {
      return await _storage.getDouble(key) as T?;
    } else if (T == String) {
      return await _storage.getString(key) as T?;
    } else if (T == List<String>) {
      return await _storage.getStringList(key) as T?;
    }

    throw Exception("Does't support type ${T.runtimeType} yet.");
  }

  Future<void> write({required String key, required Object value}) {
    if (value is bool) {
      return _storage.setBool(key, value);
    } else if (value is int) {
      return _storage.setInt(key, value);
    } else if (value is double) {
      return _storage.setDouble(key, value);
    } else if (value is String) {
      return _storage.setString(key, value);
    } else if (value is List<String>) {
      return _storage.setStringList(key, value);
    }

    throw Exception("Does't support type ${value.runtimeType} yet.");
  }

  Future<void> delete(String key) => _storage.remove(key);

  Future<Iterable<String>> allKeys() => _storage.getKeys();

  Future<void> deleteAll() => _storage.clear();

  Future<bool> containsKey(String key) => _storage.containsKey(key);
}
