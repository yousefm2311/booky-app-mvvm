// ignore_for_file: camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? sharedPreferences;

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  dynamic getData({
    required String key,
  }) {
    return sharedPreferences!.get(key);
  }

  Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }

  Future<bool> clearAllData() async {
    return await sharedPreferences!.clear();
  }
}
