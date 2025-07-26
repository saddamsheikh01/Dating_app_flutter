import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    checkColor: MaterialStateProperty.resolveWith((state) {
      return Colors.white;
    }),
    fillColor: MaterialStateProperty.resolveWith((state) {
      return state.contains(MaterialState.selected)
          ? const Color(0xFFE91E63) // Romantic pink
          : Colors.grey.shade300;
    }),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    checkColor: MaterialStateProperty.resolveWith((state) {
      return Colors.white;
    }),
    fillColor: MaterialStateProperty.resolveWith((state) {
      return state.contains(MaterialState.selected)
          ? const Color(0xFFE91E63) // Romantic pink
          : Colors.grey.shade700;
    }),
  );
}
