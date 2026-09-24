// lib/features/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/features/profile/profile_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateNext();
  }

  Future<void> _navigateNext() async {
    await Future.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    // Cap the animation size on tablets/web so it doesn't blow up.
    // final screenSize = MediaQuery.of(context).size;
    // final animationSize = (screenSize.shortestSide * 0.5).clamp(140.0, 280.0);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            'assets/icons/splash.json',
            // width: animationSize,
            // height: animationSize,
            repeat: true,
          ),
        ),
      ),
    );
  }
}
