import 'package:dataing_app/screens/main/widget/action_buttons.dart';
import 'package:dataing_app/screens/main/widget/discover_app_bar.dart';
import 'package:dataing_app/screens/main/widget/profile_swiper_card.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';


class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Map<String, dynamic>> _profiles = [
    {
      'name': 'Jessica Parker',
      'age': 23,
      'image': TImages.profileDetailsImage,
      'description': 'Professional model',
      'distance': '1 km'
    },
    {
      'name': 'Emily Clark',
      'age': 24,
      'image': TImages.onBoardingImage1,
      'description': 'Photographer',
      'distance': '2.5 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.onBoardingImage2,
      'description': 'Yoga Trainer',
      'distance': '3 km'
    }
  ];

  late CardSwiperController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DiscoverAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Expanded(
              child: CardSwiper(
                controller: _controller,
                cardsCount: _profiles.length,
                cardBuilder: (context, index, _, __) {
                  final profile = _profiles[index];
                  return ProfileSwiperCard(profile: profile);
                },
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 1.5),
            const BottomActionButtons(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: TColors.primary,
        unselectedItemColor: TColors.textSecondary,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.cards), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.heart), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Iconsax.profile_circle), label: ''),
        ],
      ),
    );
  }
}
