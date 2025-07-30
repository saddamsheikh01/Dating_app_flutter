import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/common/widgets/appbar.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> _interests = [
    'Photography','Shopping','Karaoke','Yoga',
    'Cooking','Tennis','Run','Swimming',
    'Art','Traveling','Extreme','Music',
    'Drink','Video games'
  ];
  final Set<String> _selected = {'Shopping','Run','Traveling'};

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Your interests',
          style: TextStyle(
            color: TColors.textPrimary,
            fontSize: TSizes.fontSizeLg,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TSizes.defaultSpace),
            child: TextButton(
              onPressed: () {}, // Skip logic
              child: Text(
                'Skip',
                style: TextStyle(
                  color: TColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: TSizes.fontSizeMd,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              Text(
                'Select a few interests:',
                style: TextStyle(
                  fontSize: TSizes.fontSizeLg,
                  color: TColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItem),
              Text(
                "Tap to choose what you're passionate about.",
                style: TextStyle(
                  fontSize: TSizes.fontSizeSm,
                  color: TColors.textSecondary,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              Expanded(
                child: Wrap(
                  spacing: TSizes.spaceBtwItem,
                  runSpacing: TSizes.spaceBtwItem,
                  children: _interests.map((interest) {
                    final selected = _selected.contains(interest);
                    return ChoiceChip(
                      label: Text(interest),
                      selected: selected,
                      onSelected: (val) {
                        setState(() {
                          if (val) _selected.add(interest);
                          else _selected.remove(interest);
                        });
                      },
                      backgroundColor: isDark ? TColors.darkContainer : TColors.lightContainer,
                      selectedColor: TColors.primary,
                      labelStyle: TextStyle(
                        color: selected ? TColors.textWhite : TColors.textPrimary,
                        fontSize: TSizes.fontSizeSm,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                        side: BorderSide(
                          color: selected
                              ? Colors.transparent
                              : TColors.borderSecondary,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.lg, vertical: TSizes.sm * 1.5),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
              PrimaryButton(
                text: 'Continue',
                onPressed: () {
                  // handle continue
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
