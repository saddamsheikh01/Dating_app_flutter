import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;

  void setLightTheme() => themeMode.value = ThemeMode.light;
  void setDarkTheme() => themeMode.value = ThemeMode.dark;
  void setSystemTheme() => themeMode.value = ThemeMode.system;
}
