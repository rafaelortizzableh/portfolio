import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesSingleton {
  SharedPreferencesSingleton._();

  static final SharedPreferencesSingleton _instance =
      SharedPreferencesSingleton._();

  static SharedPreferencesSingleton get instance => _instance;

  late final SharedPreferences? _prefs;

  SharedPreferences? get prefs => _prefs;

  Future<void> init(SharedPreferences? prefs) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();
  }
}
