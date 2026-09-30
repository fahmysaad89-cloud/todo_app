// lib/features/home/widgets/home_header.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/profile/data/user_model.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;

  final Color color;
  final VoidCallback? onNotificationTap;

  const HomeHeader({
    super.key,
    required this.greeting,

    this.color = const Color(0xFF5B5FEF),
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    UserModel? user = Hive.box<UserModel>(
      AppConstants.userBox,
    ).get(AppConstants.currentUser);

    return Row(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: Color.fromARGB(255, 70, 74, 182),
          backgroundImage: Image.file(File(user?.image ?? "")).image,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: TextStyle(fontSize: 20.sp, color: Colors.grey[600]),
              ),
              Text(
                user?.name ?? "",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1D1E33),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onNotificationTap,
          child: Container(
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              // color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
