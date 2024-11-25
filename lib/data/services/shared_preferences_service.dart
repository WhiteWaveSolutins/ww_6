// ignore_for_file: constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  static const ONBOARDING = 'ONBOARDING';
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
}
