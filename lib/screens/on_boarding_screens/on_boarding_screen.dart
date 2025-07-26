
import 'package:flutter/material.dart';



class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingItem> onboardingItems = [
    _OnboardingItem(
      imagePath: 'https://i.imgur.com/dL8K9Wk.jpg', // Replace with your asset if needed
      title: 'Algorithm',
      description: 'Users going through a vetting process to ensure you never match with bots.',
    ),
    _OnboardingItem(
      imagePath: 'https://i.imgur.com/m1v4KfM.jpg',
      title: 'Privacy',
      description: 'We ensure end-to-end encryption for secure and private conversations.',
    ),
    _OnboardingItem(
      imagePath: 'https://i.imgur.com/zsYrZTZ.jpg',
      title: 'Community',
      description: 'Be part of a respectful and genuine community.',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _createAccount() {
    print("Navigate to Create Account");
  }

  void _signIn() {
    print("Navigate to Sign In");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: onboardingItems.length,
                itemBuilder: (context, index) {
                  final item = onboardingItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network(
                            item.imagePath,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink.shade600,
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            _buildPageIndicator(),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: _createAccount,
                child: Text(
                  'Create an account',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: _signIn,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black87),
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(onboardingItems.length, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12 : 8,
          height: _currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.pinkAccent : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

class _OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  _OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}