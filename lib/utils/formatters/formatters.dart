import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._();

  /// Format Date: e.g., '24-Jul-2025' (for profiles, chats, etc.)
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  /// Format Time: e.g., '08:45 PM' (for messages, last seen, etc.)
  static String formatTime(DateTime? time) {
    time ??= DateTime.now();
    return DateFormat('hh:mm a').format(time);
  }

  /// Format full DateTime: e.g., 'Jul 24, 2025 at 8:45 PM'
  static String formatFullDateTime(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return DateFormat('MMM dd, yyyy • hh:mm a').format(dateTime);
  }

  /// Format Age from Birthdate
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Format Phone Number: e.g., (123) 456-7890 or international
  static String formatPhoneNumber(String phoneNumber) {
    final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11) {
      return '(${digits.substring(0, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    }

    return phoneNumber; // Return as-is if it doesn't match expected lengths
  }

  /// Convert to International Format: e.g., +92 300 1234567
  static String internationalPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 10) return phoneNumber;

    final countryCode = '+${digitsOnly.substring(0, 2)}';
    final rest = digitsOnly.substring(2);

    return '$countryCode ${_groupDigits(rest)}';
  }

  /// Format Currency (optional use): e.g., for subscriptions or premium features
  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// Private helper to format digit groups with spacing
  static String _groupDigits(String digits) {
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      buffer.write(digits[i]);
      if ((i + 1) % 3 == 0 && i != digits.length - 1) {
        buffer.write(' ');
      }
    }
    return buffer.toString();
  }
}
