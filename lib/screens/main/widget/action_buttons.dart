import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _circleButton(Icons.close, Colors.orange, 50),
        _circleButton(Icons.favorite, Colors.white, 70, iconColor: TColors.primary),
        _circleButton(Icons.star, Colors.purple, 50),
      ],
    );
  }

  Widget _circleButton(IconData icon, Color color, double size,
      {Color? iconColor}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
        ],
      ),
      child: Icon(icon, size: size * 0.5, color: iconColor ?? color),
    );
  }
}
