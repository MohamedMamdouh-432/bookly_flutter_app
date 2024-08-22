import 'package:bookly/core/utils/constants_manager.dart';
import 'package:bookly/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedSlidingText extends StatefulWidget {
  const AnimatedSlidingText({super.key});

  @override
  State<AnimatedSlidingText> createState() => _AnimatedSlidingTextState();
}

class _AnimatedSlidingTextState extends State<AnimatedSlidingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  void initSlidingAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    );
    _controller.forward();
  }

  Future navToHome() {
    return Future.delayed(const Duration(seconds: 3), () {
      Get.off(
        () => const HomeScreen(),
        transition: Transition.fade,
        duration: ConstantsManager.navDuration,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return SlideTransition(
          position: _animation,
          child: const Text(
            'Read Amazing books for free',
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(1.3),
          ),
        );
      },
    );
  }
}
