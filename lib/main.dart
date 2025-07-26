import 'package:dataing_app/utils/themes/d_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: TAppThemeCustom.lightTheme,
      darkTheme: TAppThemeCustom.darkTheme,
      themeMode: ThemeMode.system, // or ThemeMode.light/dark
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: Text('Welcome to Dating App')),
      ),
    );
  }
}
