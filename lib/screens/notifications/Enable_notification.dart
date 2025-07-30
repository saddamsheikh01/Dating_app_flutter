import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/common/widgets/appbar.dart';
import 'package:get/get.dart';

class EnableNotification extends StatefulWidget {
  const EnableNotification({super.key});

  @override
  State<EnableNotification> createState() => _EnableNotificationState();
}

class _EnableNotificationState extends State<EnableNotification> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? TColors.textWhite : TColors.textPrimary;
    final subTextColor = isDark ? TColors.textWhite.withOpacity(0.6) : TColors.textSecondary;

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: TAppBar(
        showBackArrow: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: TSizes.defaultSpace),
            child: TextButton(
              onPressed: () {
                // Handle skip
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: TColors.primary,
                  fontSize: TSizes.fontSizeMd,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Image
            Image.asset(
              TImages.enableNotificationImage,
              width: 240,
              height: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 1.5),

            /// Title
            Text(
              "Enable notification’s",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: TSizes.fontSizeLg,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItem),

            /// Description
            Text(
              "Get push-notification when you get the match or receive a message.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: TSizes.fontSizeSm,
                color: subTextColor,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Primary Button
            PrimaryButton(
              text: 'I want to be notified',
              onPressed: () {
                Get.to(() => const ());

              },
            ),
          ],
        ),
      ),
    );
  }
}
