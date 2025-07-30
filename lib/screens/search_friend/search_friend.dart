import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/common/widgets/appbar.dart';
import 'package:get/get.dart';

import '../notifications/Enable_notification.dart';

class SearchFriend extends StatefulWidget {
  const SearchFriend({super.key});

  @override
  State<SearchFriend> createState() => _SearchFriendState();
}

class _SearchFriendState extends State<SearchFriend> {
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
              TImages.searchFriendImage,
              width: 240,
              height: 240,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 1.5),

            /// Title
            Text(
              "Search friend’s",
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
              "You can find friends from your contact lists to connected",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: TSizes.fontSizeSm,
                color: subTextColor,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2),

            /// Primary Button
            PrimaryButton(
              text: 'Access to a contact list',
              onPressed: () {
                Get.to(() => const EnableNotification());

              },
            ),
          ],
        ),
      ),
    );
  }
}
