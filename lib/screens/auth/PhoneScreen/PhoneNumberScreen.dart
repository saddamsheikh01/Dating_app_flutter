import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/screens/auth/PhoneScreen/widgets/custom_phone_input_field.dart'
    show CustomPhoneInputField;
import 'package:dataing_app/screens/auth/otp_screen/otp_sceen.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        const SizedBox(height: TSizes.spaceBtwSections * 3),

        // Heading
        const Text(
          'My mobile',
          style: TextStyle(
            fontSize: TSizes.fontSizeXl,
            fontWeight: FontWeight.bold,
            color: TColors.primary,
          ),
        ),
        const SizedBox(height: TSizes.sm),

        // Subtext
        const Text(
          'Please enter your valid phone number. We will\nsend you a 4-digit code to verify your account.',
          style: TextStyle(
            fontSize: TSizes.fontSizeSm,
            color: TColors.textSecondary,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // Phone Input
        CustomPhoneInputField(
          onChanged: (value) {
            print("User entered phone: $value");
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        // Continue Button
        PrimaryButton(text: 'Continue', onPressed: () {
          Get.to(() => const OTPScreen());
        },
        ),
          ],
        ),
      ),
    );
  }
}
