import 'package:shared_preferences/shared_preferences.dart';

class PrefsUser {
  static late SharedPreferences _prefs;

  static String _name = "Jane Doe";
  static String _tag = "@janedoe_29";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('username') ?? _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('username', value);
  }

  static String get tag {
    return _prefs.getString('usertag') ?? _tag;
  }

  static set tag(String value) {
    _tag = value;
    _prefs.setString('usertag', value);
  }
}
