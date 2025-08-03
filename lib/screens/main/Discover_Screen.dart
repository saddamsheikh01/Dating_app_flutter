import 'package:dataing_app/screens/custom_bootom/custom_bootm_nav.dart';
import 'package:dataing_app/screens/main/widget/action_buttons.dart';
import 'package:dataing_app/screens/main/widget/discover_app_bar.dart';
import 'package:dataing_app/screens/main/widget/profile_swiper_card.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';

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
      'image': TImages.imageMain1,
      'description': 'Professional model',
      'distance': '1 km'
    },
    {
      'name': 'Emily Clark',
      'age': 24,
      'image': TImages.imageMain2,
      'description': 'Photographer',
      'distance': '2.5 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain3,
      'description': 'Yoga Trainer',
      'distance': '3 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain4,
      'description': 'Yoga Trainer',
      'distance': '3 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain5,
      'description': 'Yoga Trainer',
      'distance': '3 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain6,
      'description': 'Yoga Trainer',
      'distance': '3 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain7,
      'description': 'Doctor ',
      'distance': '8 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain8,
      'description': 'Medical Student ',
      'distance': '3 km'
    },
    {
      'name': 'Sophia Lee',
      'age': 22,
      'image': TImages.imageMain9,
      'description': ' shop keeper  ',
      'distance': '3 km'
    }
  ];

  late CardSwiperController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = CardSwiperController();
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed
    });
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
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onNavItemTapped,
        isDark: isDark,
      ),
    );
  }
}
