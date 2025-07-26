import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:get/get.dart";
import 'package:url_launcher/url_launcher_string.dart';

class TDeviceUtils {
  TDeviceUtils._();

  /// Hide keyboard from screen
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Set status bar color
  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  /// Enable or disable full-screen mode (e.g., for image viewer or onboarding)
  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  /// Screen width (useful for responsive UI)
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Screen height
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Device pixel ratio
  static double pixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  /// Height of system status bar
  static double statusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  /// Keyboard height
  static double keyboardHeight() {
    return MediaQuery.of(Get.context!).viewInsets.bottom;
  }

  /// Check if keyboard is visible
  static bool isKeyboardVisible() {
    return MediaQuery.of(Get.context!).viewInsets.bottom > 0;
  }

  /// Set allowed screen orientations
  static Future<void> setOrientation(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  /// Hide status bar only
  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  /// Show status bar again
  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// Check internet connectivity
  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }

  /// Check if device is iOS
  static bool isIOS() => Platform.isIOS;

  /// Check if device is Android
  static bool isAndroid() => Platform.isAndroid;

  /// Launch URL (e.g., social profile, terms & conditions)
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Haptic feedback (vibration)
  static void vibrate({Duration duration = const Duration(milliseconds: 50)}) {
    HapticFeedback.mediumImpact();
    Future.delayed(duration, () => HapticFeedback.mediumImpact());
  }
}
