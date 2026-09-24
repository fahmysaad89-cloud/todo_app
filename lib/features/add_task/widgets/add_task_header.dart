// lib/features/add_task/widgets/add_task_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const AddTaskHeader({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: const BoxDecoration(
              // color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1D1E33),
          ),
        ),
      ],
    );
  }
}
