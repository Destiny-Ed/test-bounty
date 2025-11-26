import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF0066FF),
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.interTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF0066FF),
      unselectedItemColor: Colors.grey,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF0066FF),
    scaffoldBackgroundColor: const Color(0xFF0F1116),
  );
}