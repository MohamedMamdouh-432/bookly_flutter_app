import 'package:bookly/core/utils/image_manager.dart';
import 'package:bookly/splash/components/animated_sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen._internal();
  static const SplashScreen splashScreen = SplashScreen._internal();
  factory SplashScreen() => splashScreen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImageManager.logo),
            const Gap(20),
            const AnimatedSlidingText(),
          ],
        ),
      ),
    );
  }
}
