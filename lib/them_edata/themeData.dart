import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData light = ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white.withOpacity(0.4),
      primaryColorLight: Colors.white,
      colorScheme: ColorScheme.light());

  static ThemeData dark = ThemeData(
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Color(0xff2d3748),
      colorScheme: ColorScheme.dark());
}
