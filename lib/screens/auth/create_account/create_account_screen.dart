import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/common/widgets/appbar.dart';
import '../../../utils/helpers/helper_function.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: const TAppBar(
        title: Text('Create Account'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: TSizes.fontSizeXl,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItem),
            Text(
              'Create your account by filling the form below.',
              style: TextStyle(
                fontSize: TSizes.fontSizeMd,
                color: isDark ? TColors.textWhite : TColors.textSecondary,
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Form Fields
            _buildInputField(label: 'Full Name'),
            const SizedBox(height: TSizes.spaceBtwItem),
            _buildInputField(label: 'Email'),
            const SizedBox(height: TSizes.spaceBtwItem),
            _buildInputField(label: 'Password', obscureText: true),
            const SizedBox(height: TSizes.spaceBtwItem),
            _buildInputField(label: 'Confirm Password', obscureText: true),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Checkbox: Terms & Privacy
            Row(
              children: [
                Checkbox(
                  value: agreeToTerms,
                  onChanged: (value) => setState(() => agreeToTerms = value!),
                  activeColor: TColors.primary,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'I agree to the ',
                      style: TextStyle(fontSize: TSizes.fontSizeSm),
                      children: const [
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: TColors.primary,
                          ),
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: TColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            /// Create Button
            PrimaryButton(
              text: 'Create Account',
              onPressed: () {
                if (!agreeToTerms) {
                  Get.snackbar('Error', 'You must agree to terms and policy.');
                  return;
                }
                Get.snackbar('Success', 'Account created successfully!');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, bool obscureText = false}) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
