import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/colors.dart';

class TextLinkButton extends StatelessWidget {
  final String leadingText;
  final String linkText;
  final VoidCallback onTap;

  const TextLinkButton({
    super.key,
    required this.leadingText,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: TSizes.fontSizeSm,
            color: isDark ? TColors.textWhite : TColors.textPrimary,
          ),
          children: [
            TextSpan(text: leadingText),
            TextSpan(
              text: linkText,
              style: TextStyle(
                fontSize: TSizes.fontSizeSm,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
