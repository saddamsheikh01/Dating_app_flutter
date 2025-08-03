import 'package:dataing_app/screens/match_screen/Match_Screen.dart';
import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:get/get.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _circleButton(
          icon: Icons.close,
          color: Colors.orange,
          size: 50,
          onPressed: () {
            // Handle Close action
            print("Close Pressed");
          },
        ),
        _circleButton(
          icon: Icons.favorite,
          color: Colors.white,
          size: 70,
          iconColor: TColors.primary,
          onPressed: () {
            // Handle Favorite action
            print("Favorite Pressed");
          },
        ),
        _circleButton(
          icon: Icons.star,
          color: Colors.purple,
          size: 50,
          onPressed: () {
            Get.to(() => const MatchScreen());

          },

        ),
      ],
    );
  }

  Widget _circleButton({
    required IconData icon,
    required Color color,
    required double size,
    Color? iconColor,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
          ],
        ),
        child: Center(
          child: Icon(icon, size: size * 0.5, color: iconColor ?? color),
        ),
      ),
    );
  }
}
