import 'package:dataing_app/common/widgets/PhoneOutlinedButton.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/screens/auth/PhoneScreen/PhoneNumberScreen.dart';
import 'package:dataing_app/screens/auth/sign_up/widgets/icon_widget.dart';
import 'package:dataing_app/screens/profile_details/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(

      backgroundColor: isDark ? TColors.dark : TColors.light,
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),

                // Logo
                Image.asset(
                  TImages.darkApp,
                  height: TSizes.productImageSize,
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                const Text(
                  'Sign up to continue',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeXl,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItem),

                // Continue with email
                PrimaryButton(text: 'Continue with email',  onPressed: () {
                  Get.to(() => const ProfileDetailsScreen());
                },),

                const SizedBox(height: TSizes.spaceBtwItem),

                // Use phone number
                PhoneOutlinedButton(
                  text: 'Use phone number',
                  onPressed: () {
                    Get.to(() => const PhoneNumberScreen());
                  },
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                // Divider with "or sign up with"
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: TSizes.sm),
                      child: Text('or sign up with'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: TSizes.spaceBtwItem),
                // Social buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SocialIcon(assetPath: TImages.facebookIcon),
                    SizedBox(width: TSizes.spaceBtwSections),
                    SocialIcon(assetPath: TImages.googleICon),
                    SizedBox(width: TSizes.spaceBtwSections),
                    SocialIcon(assetPath: TImages.appleIcon),
                  ],
                ),


                const Spacer(),

                // Terms and privacy
                const Padding(
                  padding: EdgeInsets.only(bottom: TSizes.defaultSpace),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms of use',
                        style: TextStyle(color: TColors.primary),
                      ),
                      SizedBox(width: TSizes.lg),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(color: TColors.primary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
