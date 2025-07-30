import 'package:dataing_app/common/widgets/appbar.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/screens/gender_screen/gender_screen.dart';
import 'package:dataing_app/screens/profile_details/widget/showBirthdayPicker.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  DateTime? _selectedDate;

  /// ✅ Birthday Bottom Sheet Function
  void _pickBirthdayBottomSheet() async {
    await showBirthdayPicker(context, _selectedDate, (DateTime pickedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: const TAppBar(
        title: Text('Profile details'),
        showBackArrow: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace),
            child: Text(
              'Skip',
              style: TextStyle(
                color: TColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Avatar + Edit
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    TImages.profileDetailsImage,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 4),
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: TColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Iconsax.camera, color: Colors.white, size: 18),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections * 1.5),

            /// First Name
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First name'),
            ),
            const SizedBox(height: TSizes.spaceBtwItem),

            /// Last Name
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last name'),
            ),
            const SizedBox(height: TSizes.spaceBtwItem),

            /// Birthday Picker Trigger
            GestureDetector(
              onTap: _pickBirthdayBottomSheet,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.md, horizontal: TSizes.lg),
                decoration: BoxDecoration(
                  color: TColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(TSizes.buttonRadius),
                ),
                child: Row(
                  children: [
                    const Icon(Iconsax.calendar, color: TColors.primary),
                    const SizedBox(width: TSizes.spaceBtwItem),
                    Text(
                      _selectedDate != null
                          ? DateFormat('dd MMM yyyy').format(_selectedDate!)
                          : 'Choose birthday date',
                      style: const TextStyle(
                        color: TColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Confirm Button
            PrimaryButton(
              text: 'Confirm',
         onPressed: () {
      Get.to(() => const GenderScreen());
      },
            ),
          ],
        ),
      ),
    );
  }
}
