import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() {
    return _instance;
  }

  SharedPrefHelper._internal();
  static const String datakey = 'key_token';
  static const String is_dark = 'is_dark';
  static const String listKey = 'myListKey';

  //! shared pref  for storing each profile keys
  Future<List<String>> getStringList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(listKey) ?? [];
  }

  Future<List<String>> removeStringFromList(String valueToRemove) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(listKey) ?? [];

    list.remove(valueToRemove);

    await prefs.setStringList(listKey, list);
    return list;
  }

  Future<List<String>> addStringToList(String newValue) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(listKey) ?? [];

    list.add(newValue);

    await prefs.setStringList(listKey, list);
    return list;
  }

  //! theme data managment------------------------------------------------

  Future<bool> isDark() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getBool(is_dark) ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(is_dark, isDark);
  }

  Future<void> putString(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(datakey, value);
  }
}
