import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }

  static Future<void> setEmail(String email) async {
    await sharedPreferences!.setString("email", email);
  }

  static Future<void> clearPref() async {
    await sharedPreferences!.clear();
  }

  static String? getEmail() {
    String? email = sharedPreferences!.getString("email");
    return email;
  }
}
