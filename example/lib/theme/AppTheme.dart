import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(bool dark) {
    return dark ? getDarkTheme() : getLightTheme();
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      backgroundColor: Colors.black87,
    );
  }

  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.amber,
      backgroundColor: Colors.white,
    );
  }
}
