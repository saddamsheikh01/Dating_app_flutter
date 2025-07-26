import 'package:flutter/material.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class TAppThemeCustom {
  TAppThemeCustom._();

  static const Color primaryDatingColor = Color(0xFFE91E63); // Pink/Romantic

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: primaryDatingColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme.copyWith(
      selectedColor: primaryDatingColor,
    ),
    appBarTheme: TAppBarTheme.lightAppBarTheme.copyWith(
      backgroundColor: primaryDatingColor,
    ),
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme.copyWith(
      fillColor: MaterialStateProperty.all(primaryDatingColor),
    ),
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: primaryDatingColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme.copyWith(
      selectedColor: primaryDatingColor,
    ),
    appBarTheme: TAppBarTheme.darkAppBarTheme.copyWith(
      backgroundColor: primaryDatingColor,
    ),
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme.copyWith(
      fillColor: MaterialStateProperty.all(primaryDatingColor),
    ),
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
