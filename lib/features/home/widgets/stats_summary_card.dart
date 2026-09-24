// lib/features/home/widgets/stats_summary_card.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/widgets/stat_column.dart';

class StatsSummaryCard extends StatelessWidget {
  final int tasks;
  final int docs;
  final int pending;

  const StatsSummaryCard({
    super.key,
    required this.tasks,
    required this.docs,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF4E4AE0)],
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StatColumn(value: '$tasks', label: context.tr('home.tasks')),
          StatColumn(value: '$docs', label: context.tr('home.docs')),
          StatColumn(value: '$pending', label: context.tr('home.pending')),
        ],
      ),
    );
  }
}
