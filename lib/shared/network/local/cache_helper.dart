import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //this function is used to insert string data into cache of program.
  static Future<bool> insertToCache(
      {required String key, required String value}) async {
    return await sharedPreferences.setString(key, value);
  }

  //this function is used to get data from cache of program.
  static Object? getFromCache({required String key}) {
    return sharedPreferences.get(key) ?? '';
  }

  //this function is used to delete string data from cache of program.
  static Future<bool> deleteFromCache({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //this function is used to clear all data from cache of program.
  static Future<bool> clearCache() async {
    return await sharedPreferences.clear();
  }
}
