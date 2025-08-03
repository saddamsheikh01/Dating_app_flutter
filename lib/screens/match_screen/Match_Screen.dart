import 'package:dataing_app/common/widgets/PhoneOutlinedButton.dart';
import 'package:dataing_app/common/widgets/primary_button.dart';
import 'package:dataing_app/screens/nav_match_screen/match_screen/main_match_screen.dart';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:dataing_app/utils/constants/image_strings.dart';
import 'package:get/get.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 👇 FIXED: Give fixed height to Stack
                SizedBox(
                  height: 360,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Girl Image (Left) with Heart on Bottom Left
                      Positioned(
                        left: 20,
                        child: Transform.rotate(
                          angle: -0.17,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    TImages.imageMain1,
                                    height: 330,
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 12,
                                left: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Icon(Icons.favorite, color: Colors.pink, size: 26),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Boy Image (Right) with Heart on Top Right
                      Positioned(
                        right: 20,
                        child: Transform.rotate(
                          angle: 0.18,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    TImages.imageMain2,
                                    height: 330,
                                    width: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 12,
                                right: 12,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Icon(Icons.favorite, color: Colors.pink, size: 26),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwItem),

                // Match Text
                Text(
                  "It's a match, Jake!",
                  style: TextStyle(
                    fontSize: TSizes.fontSizeLg,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary,
                  ),
                ),

                const SizedBox(height: TSizes.sm),

                Text(
                  "Start a conversation now with each other",
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm,
                    color: TColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                // Say Hello Button
                PrimaryButton(text: ' Say hello ', onPressed: () {  },),

                const SizedBox(height: TSizes.sm),

                // Keep Swiping Button
                PhoneOutlinedButton(text: 'Keep Swiping',         onPressed: () {
                  Get.to(() => const MatchesScreen());
                },
                )   ,           ],
            ),
          ),
        ),
      ),
    );
  }
}
