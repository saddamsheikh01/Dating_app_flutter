import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/device/device_utility.dart';

import '../../utils/helpers/helper_function.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),

      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: isDark ? TColors.dark : TColors.light,
        surfaceTintColor: Colors.transparent,
        leading: showBackArrow
            ? IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left, color: TColors.primary),
        )
            : leadingIcon != null
            ? IconButton(
          onPressed: leadingOnPressed,
          icon: Icon(leadingIcon, color: TColors.primary),
        )
            : null,
        title: DefaultTextStyle(
          style: TextStyle(
            color: isDark ? TColors.textWhite : TColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          child: title ?? const SizedBox(),
        ),
        actions: actions,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
