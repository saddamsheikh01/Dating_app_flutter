import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.light,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            // Heading
            const Text(
              'My mobile',
              style: TextStyle(
                fontSize: TSizes.fontSizeXl,
                fontWeight: FontWeight.bold,
                color: TColors.textPrimary,
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
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
                  borderSide: const BorderSide(),
                ),
              ),
              initialCountryCode: 'US',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                  ),
                ),
                onPressed: () {
                  // Handle phone submit
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeMd,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
