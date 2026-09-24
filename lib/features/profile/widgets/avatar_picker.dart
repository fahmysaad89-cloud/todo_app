import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarPicker extends StatelessWidget {
  final double radius;
  final Color color;
  final VoidCallback? onTap;

  const AvatarPicker({
    super.key,
    required this.radius,
    this.color = const Color(0xFF5B5FEF),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: radius, color: color),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Icon(Icons.camera_alt, size: 16.sp, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
