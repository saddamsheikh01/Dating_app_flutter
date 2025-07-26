import 'package:flutter/material.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.pink.shade100.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
    selectedColor: Colors.pinkAccent,
    backgroundColor: Colors.pink.shade50,
    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
    checkmarkColor: Colors.white,
    secondaryLabelStyle: const TextStyle(color: Colors.deepPurple),
    brightness: Brightness.light,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.deepPurple.shade200.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    selectedColor: Color(0xFFB83280), // deep romantic magenta
    backgroundColor: Color(0xFF3A2C4A),
    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
    checkmarkColor: Colors.white,
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    brightness: Brightness.dark,
  );
}
