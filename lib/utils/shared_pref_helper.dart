import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static final SharedPrefHelper _instance = SharedPrefHelper._internal();

  factory SharedPrefHelper() {
    return _instance;
  }

  SharedPrefHelper._internal();
  static const String datakey = 'key_token';

  /// Save or update a string value
  Future<void> putString(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(datakey, value);
  }

  /// Retrieve a string value
  Future<String?> getString() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(datakey);
  }

  /// Update a string value (only if it exists)
  Future<bool> updateString(String newValue) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(datakey)) {
      await prefs.setString(datakey, newValue);
      return true;
    }
    return false;
  }

  /// Remove a key
  Future<void> removeKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(datakey);
  }

  /// Clear all keys (careful!)
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> containsKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(datakey);
  }
}
