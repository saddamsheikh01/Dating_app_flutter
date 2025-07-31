import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class DiscoverAppBar extends StatelessWidget {
  const DiscoverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? TColors.textWhite : TColors.textPrimary;
    final subTextColor =
    isDark ? TColors.textWhite.withOpacity(0.7) : TColors.textSecondary;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: _squareIcon(Icons.arrow_back_ios_new),
      actions: [_squareIcon(Iconsax.setting_4)],
      title: Column(
        children: [
          Text('Discover',
              style: TextStyle(
                  fontSize: TSizes.fontSizeLg,
                  fontWeight: FontWeight.bold,
                  color: textColor)),
          Text('Chicago, IL',
              style: TextStyle(
                  fontSize: TSizes.fontSizeSm, color: subTextColor)),
        ],
      ),
    );
  }

  Widget _squareIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
          ],
        ),
        child: Icon(icon, color: TColors.primary),
      ),
    );
  }
}
