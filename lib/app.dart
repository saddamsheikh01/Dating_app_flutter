import 'package:dataing_app/controllers/theme_controller.dart';
import 'package:dataing_app/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:dataing_app/utils/themes/d_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
      title: 'Dating App',
      theme: TAppThemeCustom.lightTheme,
      darkTheme: TAppThemeCustom.darkTheme,
      themeMode: themeController.themeMode.value,
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    ));
  }
}
