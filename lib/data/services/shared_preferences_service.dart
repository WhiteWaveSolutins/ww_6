// ignore_for_file: constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static const ONBOARDING = 'ONBOARDING';
  static const PASSWORD = 'PASSWORD';
  static const FACEID = 'FACEID';
}

class SharedPreferencesService {
  //ONBOARDING
  static Future<bool> switchStatusShowOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_Keys.ONBOARDING, true);
  }

  static Future<bool> getStatusShowOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_Keys.ONBOARDING) ?? false;
  }

  //PASSWORD
  static Future<bool> setPassword({required String password}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_Keys.PASSWORD, password);
  }

  static Future<String?> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_Keys.PASSWORD);
  }

  static Future<bool> removePassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(_Keys.PASSWORD);
  }

  //FACEID
  static Future<bool> switchFaceId({required bool status}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_Keys.FACEID, status);
  }

  static Future<bool> getFaceId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_Keys.FACEID) ?? false;
  }
}
