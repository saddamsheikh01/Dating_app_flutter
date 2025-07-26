import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); // Prevent instantiation

  /// -- Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white,
      backgroundColor: Colors.pinkAccent,
      disabledForegroundColor: Colors.white.withOpacity(0.6),
      disabledBackgroundColor: Colors.pink.shade100,
      side: BorderSide(color: Colors.pinkAccent),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );

  /// -- Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 2,
      foregroundColor: Colors.white,
      backgroundColor: Color(0xFFB83280), // Romantic magenta
      disabledForegroundColor: Colors.white.withOpacity(0.6),
      disabledBackgroundColor: Colors.deepPurple.shade200,
      side: BorderSide(color: Color(0xFFB83280)),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
