import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  /// Returns a color based on a string value (used for profile themes, tags, etc.)
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      case 'blue':
        return Colors.blue;
      case 'pink':
        return Colors.pink;
      case 'grey':
        return Colors.grey;
      case 'purple':
        return Colors.purple;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      default:
        return Colors.grey.shade300;
    }
  }

  /// Show snack bar (for quick alerts)
  static void showSnackBar(String message, {Color bgColor = Colors.black}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bgColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show alert dialog (for confirmations, errors, info)
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  /// Navigate to another screen (using GetX)
  static void navigateTo(Widget screen) {
    Get.to(() => screen);
  }

  /// Truncate text for bios, taglines, etc.
  static String truncateText(String text, int maxLength) {
    return text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';
  }

  /// Detect current theme mode (light/dark)
  static bool isDarkMode() {
    return Get.isDarkMode;
  }

  /// Get screen size, height, width
  static Size screenSize() => MediaQuery.of(Get.context!).size;
  static double screenHeight() => screenSize().height;
  static double screenWidth() => screenSize().width;

  /// Format DateTime for messages, matches, activities
  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Remove duplicates from a list (like interests, messages, etc.)
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wrap widgets like user tags, interests, etc.
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrapped = <Widget>[];
    for (int i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, (i + rowSize).clamp(0, widgets.length));
      wrapped.add(Row(
        children: rowChildren,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ));
    }
    return wrapped;
  }

  /// Format time ago for messages or last seen
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return DateFormat('dd MMM').format(dateTime);
  }
}
