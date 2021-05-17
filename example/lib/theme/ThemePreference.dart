// import 'package:shared_preferences/shared_preferences.dart';

// class ThemePreference {
//   static const THEME_DARKMODE = "THEME_DARKMODE";

//   setDarkMode(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool(THEME_DARKMODE, value);
//   }

//   Future<bool> isDarkMode() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(THEME_DARKMODE) ?? false;
//   }
// }