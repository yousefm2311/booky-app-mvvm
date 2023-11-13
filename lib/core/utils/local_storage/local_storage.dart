import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? sharedPreferences;
  // Initialize SharedPreferences
  Future<void> initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setData(String key, dynamic value) async {
    if (sharedPreferences == null) {
      await initSharedPreferences();
    }
    if (value is int) {
      sharedPreferences!.setInt(key, value);
    } else if (value is double) {
      sharedPreferences!.setDouble(key, value);
    } else if (value is bool) {
      sharedPreferences!.setBool(key, value);
    } else if (value is String) {
      sharedPreferences!.setString(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  dynamic getData(String key) {
    if (sharedPreferences == null) {
      throw Exception("SharedPreferences not initialized");
    }
    return sharedPreferences!.get(key);
  }

  Future<void> removeData(String key) async {
    if (sharedPreferences == null) {
      await initSharedPreferences();
    }
    sharedPreferences!.remove(key);
  }

  Future<void> clearAllData() async {
    if (sharedPreferences == null) {
      await initSharedPreferences();
    }
    sharedPreferences!.clear();
  }
}