import 'package:dataing_app/screens/main/filters_screen.dart';
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
      leading: _squareIcon(
        icon: Icons.arrow_back_ios_new,
        onTap: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        _squareIcon(
          icon: Iconsax.setting_4,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => DraggableScrollableSheet(
                expand: false,
                minChildSize: 0.4,
                initialChildSize: 0.6,
                maxChildSize: 0.9,
                builder: (_, controller) => SingleChildScrollView(
                  controller: controller,
                  child: const FiltersScreen(), // You must import FiltersScreen here
                ),
              ),
            );
          },
        )
      ],
      title: Column(
        children: [
          Text(
            'Discover',
            style: TextStyle(
              fontSize: TSizes.fontSizeLg,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            'Chicago, IL',
            style: TextStyle(
              fontSize: TSizes.fontSizeSm,
              color: subTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _squareIcon({required IconData icon, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.sm),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: TColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
            ],
          ),
          child: Icon(icon, color: TColors.primary),
        ),
      ),
    );
  }
}
