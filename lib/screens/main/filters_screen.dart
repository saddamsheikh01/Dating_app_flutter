import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class FiltersScreen extends StatefulWidget {
  final String initialLocation;
  const FiltersScreen({Key? key, this.initialLocation = 'Chicago, USA'}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String selectedGender = 'Girls';
  double distance = 40;
  RangeValues ageRange = const RangeValues(20, 28);
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController(text: widget.initialLocation);
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final Color cardColor = isDark ? TColors.darkContainer : TColors.white;
    final Color labelColor = isDark ? TColors.textWhite : TColors.textPrimary;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? TColors.dark : TColors.light,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg).copyWith(top: TSizes.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? TColors.grey : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItem),

            /// Title + Clear
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Filters',
                    style: TextStyle(
                      fontSize: TSizes.fontSizeLg,
                      fontWeight: FontWeight.bold,
                      color: labelColor,
                    )),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedGender = 'Girls';
                      distance = 40;
                      ageRange = const RangeValues(20, 28);
                      _locationController.text = widget.initialLocation;
                    });
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      color: TColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            _sectionLabel('Interested in', labelColor),
            const SizedBox(height: TSizes.spaceBtwItem),
            _genderTabs(isDark),

            const SizedBox(height: TSizes.spaceBtwSections),
            _sectionLabel('Location', labelColor),
            const SizedBox(height: TSizes.spaceBtwItem),
            _locationTextField(isDark, cardColor, labelColor),

            const SizedBox(height: TSizes.spaceBtwSections),
            _sectionLabel('Distance', labelColor),
            const SizedBox(height: TSizes.spaceBtwItem),

            Row(
              children: [
                Expanded(
                  child: Slider(
                    min: 0,
                    max: 100,
                    activeColor: TColors.primary,
                    inactiveColor: isDark ? TColors.grey : TColors.borderSecondary,
                    value: distance,
                    onChanged: (v) => setState(() => distance = v),
                  ),
                ),
                Text(
                  '${distance.round()}km',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeMd,
                    color: labelColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            _sectionLabel('Age', labelColor),
            const SizedBox(height: TSizes.spaceBtwItem),
            RangeSlider(
              values: ageRange,
              min: 18,
              max: 60,
              activeColor: TColors.primary,
              inactiveColor: isDark ? TColors.grey : TColors.borderSecondary,
              onChanged: (range) => setState(() => ageRange = range),
            ),
            Text(
              '${ageRange.start.round()}‑${ageRange.end.round()}',
              style: TextStyle(fontSize: TSizes.fontSizeMd, color: labelColor),
            ),

            const SizedBox(height: TSizes.spaceBtwSections * 1.5),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop({
                  'gender': selectedGender,
                  'distance': distance,
                  'ageRange': ageRange,
                  'location': _locationController.text.trim(),
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Continue', style: TextStyle(color: TColors.white)),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }

  Widget _sectionLabel(String text, Color color) => Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: TSizes.fontSizeMd,
        color: color,
      ),
    ),
  );

  Widget _genderTabs(bool isDark) {
    final options = ['Girls', 'Boys', 'Both'];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
        border: Border.all(color: TColors.primary),
      ),
      child: Row(
        children: options.map((opt) {
          final selected = opt == selectedGender;
          return Expanded(
            child: InkWell(
              onTap: () => setState(() => selectedGender = opt),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                decoration: BoxDecoration(
                  color: selected
                      ? TColors.primary
                      : isDark
                      ? TColors.dark
                      : TColors.light,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                ),
                child: Text(
                  opt,
                  style: TextStyle(
                    color: selected
                        ? TColors.white
                        : isDark
                        ? TColors.textWhite
                        : TColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _locationTextField(bool isDark, Color bgColor, Color textColor) {
    return TextField(
      controller: _locationController,
      style: TextStyle(color: textColor),
      cursorColor: TColors.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: 'Enter your location',
        hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
        filled: true,
        fillColor: bgColor,
        suffixIcon: const Icon(Iconsax.location, size: 20, color: TColors.primary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
          borderSide: const BorderSide(color: TColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
          borderSide: const BorderSide(color: TColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
