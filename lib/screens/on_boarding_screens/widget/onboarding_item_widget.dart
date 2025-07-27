import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';

class OnboardingItemWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            child: Image.asset(
              imagePath,
              height: 400,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          Text(
            title,
            style: TextStyle(
              fontSize: TSizes.fontSizeLg + 6,
              fontWeight: FontWeight.bold,
              color: TColors.primary,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItem),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: TSizes.fontSizeMd,
                color: TColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
