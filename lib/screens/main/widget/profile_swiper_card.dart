import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileSwiperCard extends StatelessWidget {
  final Map<String, dynamic> profile;
  const ProfileSwiperCard({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(profile['image'], fit: BoxFit.cover),
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Iconsax.location, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(profile['distance'],
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${profile['name']}, ${profile['age']}',
                      style: const TextStyle(
                          fontSize: TSizes.fontSizeLg,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(profile['description'],
                      style: const TextStyle(
                          fontSize: TSizes.fontSizeSm,
                          color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
