import 'package:dataing_app/controllers/onboarding_controller/onboarding_controller.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingIndicator extends StatelessWidget {
  final int length;
  const OnboardingIndicator({super.key, required this.length});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) {
          final isActive = controller.currentPage.value == index;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: TSizes.xs),
            width: isActive ? TSizes.iconXs : TSizes.iconXs,
            height: isActive ? TSizes.iconXs : TSizes.iconXs,
            decoration: BoxDecoration(
              color: isActive ? TColors.primary : TColors.grey,
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}
