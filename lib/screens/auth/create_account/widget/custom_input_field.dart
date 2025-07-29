import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomInputField({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(color: TColors.primary), // Input text color
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: TColors.primary), // Label color
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: BorderSide(color: TColors.primary), // Focus border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: BorderSide(color: TColors.primary), // Enabled border
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
        ),
      ),
    );
  }
}
