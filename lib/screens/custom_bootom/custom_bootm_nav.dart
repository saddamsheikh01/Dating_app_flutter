import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dataing_app/utils/constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final bool isDark;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? TColors.darkerGrey : TColors.light,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(icon: Iconsax.cards, index: 0),
          _buildNavItem(icon: Iconsax.heart, index: 1),
          _buildNavItem(icon: Iconsax.message, index: 2),
          _buildNavItem(icon: Iconsax.profile_circle, index: 3),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required int index}) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          size: isSelected ? 28 : 24,
          color: isSelected ? TColors.primary : TColors.textSecondary,
        ),
      ),
    );
  }
}
