import 'package:flutter_full_learn/202/cache/shared_not_initalize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreference() {
    if (preferences == null) throw SharedNotInitalizeException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreference();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreference();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPreference();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPreference();
    return preferences?.getString(key.name);
  }

  //   String? getString(SharedKeys key) {
  //   _checkPreference();
  //   return preferences?.getString(key.name);
  // }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreference();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
