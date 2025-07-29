import 'dart:async';
import 'package:dataing_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otpCode = ['', '', '', '', ''];
  int currentIndex = 0;
  int timerSeconds = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds > 0) {
        setState(() {
          timerSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _addDigit(String digit) {
    if (currentIndex < 5) {
      setState(() {
        otpCode[currentIndex] = digit;
        currentIndex++;
      });
    }
  }

  void _removeDigit() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        otpCode[currentIndex] = '';
      });
    }
  }

  void _resendCode() {
    setState(() {
      timerSeconds = 60;
      otpCode = ['', '', '', '', ''];
      currentIndex = 0;
    });
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildOTPBox(String digit, bool active) {
    return Container(
      width: 55,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: digit.isNotEmpty ? TColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: digit.isNotEmpty
              ? TColors.primary
              : active
              ? TColors.primary
              : Colors.grey.shade400,
          width: 1.5,
        ),
      ),
      child: Text(
        digit,
        style: TextStyle(
          color: digit.isNotEmpty ? Colors.white : TColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildKey(String label, {VoidCallback? onTap, IconData? icon}) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: icon != null
            ? Icon(icon, size: 28)
            : Text(label, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context); // Get current theme
    return Scaffold(
      backgroundColor: isDark ? TColors.dark : TColors.light, // Apply theme color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItem),
              Text(
                '00:${timerSeconds.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: TSizes.spaceBtwItem),
              const Text(
                'Type the verification code\nwe’ve sent you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: TColors.textPrimary),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                      (index) => _buildOTPBox(otpCode[index], index == currentIndex),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 1.5),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        for (int i = 1; i <= 9; i++)
                          _buildKey('$i', onTap: () => _addDigit('$i')),
                        const SizedBox.shrink(),
                        _buildKey('0', onTap: () => _addDigit('0')),
                        _buildKey('', icon: Icons.backspace_outlined, onTap: _removeDigit),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: timerSeconds == 0 ? _resendCode : null,
                child: Text(
                  'Send again',
                  style: TextStyle(
                    fontSize: 16,
                    color: TColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItem),
            ],
          ),
        ),
      ),
    );
  }

}
