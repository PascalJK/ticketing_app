import 'package:flutter/material.dart';

// For times sake: Used A.I to generate this code snippet
class AppThemes {
  static final ThemeData appTheme = ThemeData(
    primaryColor: const Color(0xFF1976D2), // Blue for primary elements
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1976D2), // Main app color
      secondary: Color(0xFFFFC107), // Amber for accents
      surface: Color(0xFFFFFFFF), // White background for cards, sheets
      error: Color(0xFFD32F2F), // Red for errors
      onPrimary: Color(0xFFFFFFFF), // White text/icons on primary
      onSecondary: Color(0xFF000000), // Black text/icons on secondary
      onSurface: Color(0xFF212121), // Dark text on surfaces
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1976D2),
      foregroundColor: Color(0xFFFFFFFF),
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1976D2), // Button color
        foregroundColor: const Color(0xFFFFFFFF), // Button text/icon color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFF212121)),
      bodyMedium: TextStyle(color: Color(0xFF212121)),
      titleLarge: TextStyle(
        color: Color(0xFF212121),
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF1976D2), width: 2),
      ),
      labelStyle: TextStyle(color: Color(0xFF757575)),
    ),
  );
}