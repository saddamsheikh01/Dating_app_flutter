import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static const Color primaryColorLight = Color(0xFFE91E63); // pink
  static const Color primaryColorDark = Color(0xFFAD1457);  // darker pink

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: primaryColorLight,
    suffixIconColor: primaryColorLight,
    labelStyle: const TextStyle(
      fontSize: 15,
      color: primaryColorLight,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    floatingLabelStyle: const TextStyle(
      color: primaryColorLight,
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1.5, color: primaryColorLight),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.deepOrange),
    ),
    filled: true,
    fillColor: Colors.pink.shade50,
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: primaryColorDark,
    suffixIconColor: primaryColorDark,
    labelStyle: const TextStyle(
      fontSize: 15,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.white60,
    ),
    floatingLabelStyle: const TextStyle(
      color: primaryColorDark,
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.white24),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.white30),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1.5, color: primaryColorDark),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.redAccent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(width: 1, color: Colors.orangeAccent),
    ),
    filled: true,
    fillColor: Colors.black12,
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
  );
}
