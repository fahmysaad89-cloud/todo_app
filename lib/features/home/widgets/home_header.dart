// lib/features/home/widgets/home_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String userName;
  final Color color;
  final VoidCallback? onNotificationTap;

  const HomeHeader({
    super.key,
    required this.greeting,
    required this.userName,
    this.color = const Color(0xFF5B5FEF),
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: Color.fromARGB(255, 70, 74, 182),
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
                userName,
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
