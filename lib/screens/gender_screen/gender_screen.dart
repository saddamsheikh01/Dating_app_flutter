import 'package:dataing_app/screens/Interest_Screen/Interest_Screen.dart';
import 'package:dataing_app/screens/search_friend/search_friend.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/common/widgets/appbar.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = '';

  final List<String> _genders = ['Man', 'Woman', 'Custom'];

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,

      appBar: TAppBar(
        showBackArrow: true,
        title: const Text('Gender'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TSizes.defaultSpace),
            child: TextButton(
              onPressed: () {}, // TODO: Handle skip
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: TColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            Text(
              'I am',
              style: TextStyle(
                fontSize: TSizes.fontSizeXl,
                fontWeight: FontWeight.bold,
                color: TColors.textPrimary,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            ..._genders.map((gender) {
              final bool isSelected = _selectedGender == gender;

              return GestureDetector(
                onTap: () {
                  setState(() => _selectedGender = gender);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItem),
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.lg, vertical: TSizes.md),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? TColors.primary
                        : TColors.lightContainer,
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                    border: Border.all(
                      color: isSelected
                          ? TColors.primary
                          : TColors.grey.withOpacity(0.4),
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      /// Left side text
                      Expanded(
                        child: Text(
                          gender == 'Custom' ? 'Choose Custom Gender' : gender,
                          style: TextStyle(
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : TColors.textPrimary,
                          ),
                        ),
                      ),

                      /// Right side icon
                      Icon(
                        isSelected
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: isSelected ? Colors.white : TColors.grey,
                      ),
                    ],
                  ),
                ),
              );
            }),

            const Spacer(),

            PrimaryButton(
              text: 'Continue',
              onPressed: () {
                Get.to(() => const SearchFriend());
              },

            ),
          ],
        ),
      ),
    );
  }
}
