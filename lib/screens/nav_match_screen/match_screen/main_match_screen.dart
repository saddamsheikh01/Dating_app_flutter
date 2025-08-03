import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<Map<String, dynamic>> todayMatches = [
    {
      'name': 'Leilani',
      'age': 19,
      'image': TImages.imageMain1,
      'favorite': false,
    },
    {
      'name': 'Annabelle',
      'age': 20,
      'image': TImages.imageMain2,
      'favorite': false,
    },
    {
      'name': 'Reagan',
      'age': 24,
      'image': TImages.imageMain3,
      'favorite': false,
    },
    {
      'name': 'Hadley',
      'age': 25,
      'image': TImages.imageMain4,
      'favorite': false,
    },
    {
      'name': 'Leilani',
      'age': 19,
      'image': TImages.imageMain1,
      'favorite': false,
    },
    {
      'name': 'Annabelle',
      'age': 20,
      'image': TImages.imageMain2,
      'favorite': false,
    },
    {
      'name': 'Reagan',
      'age': 24,
      'image': TImages.imageMain3,
      'favorite': false,
    },
    {
      'name': 'Hadley',
      'age': 25,
      'image': TImages.imageMain4,
      'favorite': false,
    },
  ];

  List<Map<String, dynamic>> yesterdayMatches = [
    {
      'name': 'Alice',
      'age': 22,
      'image': TImages.imageMain5,
      'favorite': false,
    },
    {
      'name': 'Bella',
      'age': 23,
      'image': TImages.imageMain6,
      'favorite': false,
    },
    {
      'name': 'Alice',
      'age': 22,
      'image': TImages.imageMain5,
      'favorite': false,
    },
    {
      'name': 'Bella',
      'age': 23,
      'image': TImages.imageMain6,
      'favorite': false,
    },
    {
      'name': 'Alice',
      'age': 22,
      'image': TImages.imageMain5,
      'favorite': false,
    },
    {
      'name': 'Bella',
      'age': 23,
      'image': TImages.imageMain6,
      'favorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? TColors.dark : TColors.light;
    final textColor = isDark ? TColors.textWhite : TColors.textPrimary;
    final subTextColor = isDark
        ? TColors.textWhite.withOpacity(0.6)
        : TColors.textSecondary;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // removes the back arrow
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: const Icon(Icons.compare_arrows, color: TColors.primary),
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Matches',
              style: TextStyle(
                fontSize: TSizes.fontSizeXl,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? TColors.textWhite
                    : TColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is a list of people who have liked you and your matches.',
              style: TextStyle(
                color: subTextColor,
                fontSize: TSizes.fontSizeMd,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            _sectionTitle('Today', textColor),
            _matchGrid(todayMatches, true),
            const SizedBox(height: TSizes.spaceBtwSections),
            _sectionTitle('Yesterday', textColor),
            _matchGrid(yesterdayMatches, false),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItem),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: Text(
              title,
              style: TextStyle(
                fontSize: TSizes.fontSizeMd,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
          const Expanded(child: Divider(thickness: 1)),
        ],
      ),
    );
  }

  Widget _matchGrid(List<Map<String, dynamic>> data, bool isToday) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      padding: const EdgeInsets.only(top: TSizes.md),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: TSizes.spaceBtwItem,
        mainAxisSpacing: TSizes.spaceBtwItem,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final person = data[index];
        return _matchCard(person, index, isToday);
      },
    );
  }

  Widget _matchCard(Map<String, dynamic> person, int index, bool isToday) {
    return StatefulBuilder(
      builder: (context, setStateCard) => ClipRRect(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(person['image'], fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.85),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${person['name']}, ${person['age']}',
                      style: const TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                    const SizedBox(height: TSizes.xs),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _glassButton(
                          icon: Icons.close,
                          onTap: () {
                            setState(() {
                              (isToday ? todayMatches : yesterdayMatches)
                                  .removeAt(index);
                            });
                          },
                        ),
                        _glassButton(
                          icon: Icons.favorite,
                          iconColor: person['favorite']
                              ? Colors.red
                              : TColors.white,
                          onTap: () {
                            setStateCard(() {
                              person['favorite'] = !person['favorite'];
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glassButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = TColors.white,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
        ),
      ),
    );
  }
}
