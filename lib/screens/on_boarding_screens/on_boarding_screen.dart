import 'package:dataing_app/screens/auth/create_account/create_account_screen.dart';
import 'package:dataing_app/screens/on_boarding_screens/widget/onboarding_indicator.dart';
import 'package:dataing_app/screens/on_boarding_screens/widget/onboarding_item_widget.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/TextLinkButton.dart';
import '../../controllers/onboarding_controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _pageController = PageController();
  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// -- Onboarding Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: onboardingController.updatePage,
                children: const [
                  OnboardingItemWidget(
                    imagePath: TImages.onBoardingImage1,
                    title: 'Algorithm',
                    description:
                    'Users going through a vetting process to ensure you never match with bots.',
                  ),
                  OnboardingItemWidget(
                    imagePath: TImages.onBoardingImage2,
                    title: 'Privacy',
                    description:
                    'We ensure end-to-end encryption for secure and private conversations.',
                  ),
                  OnboardingItemWidget(
                    imagePath: TImages.onBoardingImage3,
                    title: 'Community',
                    description:
                    'Be part of a respectful and genuine community.',
                  ),
                ],
              ),
            ),

            /// -- Indicator Dots
            const SizedBox(height: TSizes.spaceBtwItem),
            OnboardingIndicator(length: 3),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// -- Create Account Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: PrimaryButton(
                text: 'Create an account',
                onPressed: () => Get.to(() => const CreateAccountScreen()),
              ),
            ),

            /// -- Sign In Text Link
            const SizedBox(height: TSizes.spaceBtwItem),
            TextLinkButton(
              leadingText: 'Already have an account? ',
              linkText: 'Sign In',
              onTap: onboardingController.signIn,
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
