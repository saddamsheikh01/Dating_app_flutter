import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  // Light Theme for Dating App
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.pinkAccent,
    surfaceTintColor: Colors.pinkAccent,
    iconTheme: IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: 'Lobster', // Optional: for a romantic font style
    ),
  );

  // Dark Theme for Dating App
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Color(0xFF1F1B24),
    surfaceTintColor: Color(0xFF1F1B24),
    iconTheme: IconThemeData(color: Colors.pinkAccent, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.pinkAccent, size: 24),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.pinkAccent,
      fontFamily: 'Lobster', // Optional: can use Google Fonts too
    ),
  );
}
