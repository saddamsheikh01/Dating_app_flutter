import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class SocialIcon extends StatelessWidget {
  final String assetPath;

  const SocialIcon({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
      ),
      child: Image.asset(assetPath),
    );
  }
}
