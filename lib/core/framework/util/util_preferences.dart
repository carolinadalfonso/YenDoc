import 'package:shared_preferences/shared_preferences.dart';

class UtilPreferences {
  static const String token = "token";

  static final UtilPreferences _singleton = UtilPreferences._internal();
  static late SharedPreferences prefs;

  UtilPreferences._internal();

  factory UtilPreferences() => _singleton;
}
