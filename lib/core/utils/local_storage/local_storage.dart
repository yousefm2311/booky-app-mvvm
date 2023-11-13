import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? sharedPreferences;

  Future<SharedPreferences> initSharedPreferences() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    return sharedPreferences!;
  }

  Future<void> setData(String key, dynamic value) async {
    SharedPreferences prefs = await initSharedPreferences();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else {
      throw Exception("Unsupported data type");
    }
  }

  dynamic getData(String key) async {
    SharedPreferences prefs = await initSharedPreferences();
    return prefs.get(key);
  }

  Future<void> removeData(String key) async {
    SharedPreferences prefs = await initSharedPreferences();
    prefs.remove(key);
  }

  Future<void> clearAllData() async {
    SharedPreferences prefs = await initSharedPreferences();
    prefs.clear();
  }
}
