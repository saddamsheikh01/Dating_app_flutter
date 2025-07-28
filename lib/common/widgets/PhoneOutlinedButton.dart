import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/colors.dart';

class PhoneOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PhoneOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: TColors.primary),
        backgroundColor: Colors.transparent,
        minimumSize: const Size(double.infinity, TSizes.buttonHeight * 3.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.buttonRadius),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: TSizes.fontSizeMd,
          color: TColors.primary,
        ),
      ),
    );
  }
}
