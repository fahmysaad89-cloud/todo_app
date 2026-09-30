// lib/features/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/profile/data/user_model.dart';
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
    nextpage();
  }

  nextpage() {
    UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);
    if (user == null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ProfileScreen()),
      );
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
