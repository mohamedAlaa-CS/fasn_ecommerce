import 'package:fasn_ecommerce/core/di/injections.dart';
import 'package:fasn_ecommerce/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static saveString(String key, String value) {
    getIt.get<SharedPreferences>().setString(key, value);
  }

  static saveBool(String key, bool value) {
    getIt.get<SharedPreferences>().setBool(key, value);
  }

  static saveListString(String key, List<String> value) {
    getIt.get<SharedPreferences>().setStringList(key, value);
  }

  static getString(String key) {
    getIt.get<SharedPreferences>().getString(key);
  }

  static bool? getBool(String key) {
    getIt.get<SharedPreferences>().getBool(key);
    return null;
  }

  static List<String>? getListString(String key) {
    getIt.get<SharedPreferences>().getStringList(key);
    return null;
  }

  static saveToken(String value) async {
    await getIt.get<SharedPreferences>().setString(AppStrings.token, value);
  }

  static Future<bool> remove(String key) async {
    return await getIt.get<SharedPreferences>().remove(key);
  }

//! get token
  static String? get token {
    String? printToken =
        getIt.get<SharedPreferences>().getString(AppStrings.token);
    return printToken;
  }
}
