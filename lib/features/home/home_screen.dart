// lib/features/home/home_screen.dart
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/add_task/add_task_screen.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';
import 'package:todo_app/features/home/widgets/home_header.dart';
import 'package:todo_app/features/home/widgets/stats_summary_card.dart';
import 'package:todo_app/features/home/widgets/task_section.dart';
import 'package:todo_app/features/profile/data/user_model.dart';
import 'package:todo_app/features/shared_widgets/Language_Button.dart';
import 'package:todo_app/features/shared_widgets/responsive.dart';
import 'package:todo_app/features/shared_widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _tasks = [
    TaskItem(
      title: 'Flutter UI',
      subtitle: 'Designing App Screens',
      status: TaskStatus.pending,
      color: Color(0xFF4E7DF0),
    ),
    TaskItem(
      title: 'Workout',
      subtitle: 'Gym at 6 PM',
      status: TaskStatus.done,
      color: Color(0xFF3DBE7A),
    ),
    TaskItem(
      title: 'Meeting',
      subtitle: 'Team Sync',
      status: TaskStatus.inProgress,
      color: Color(0xFFF2A93B),
    ),
    TaskItem(
      title: 'Read Book',
      subtitle: 'Atomic Habits',
      status: TaskStatus.pending,
      color: Color(0xFF9B6BE0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final contentMaxWidth = Responsive.contentMaxWidth(
              constraints.maxWidth,
            );
            final crossAxisCount = Responsive.columnCount(constraints.maxWidth);

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentMaxWidth),
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: LanguageToggleButton(),
                    ),
                    SizedBox(height: 12.h),
                    HomeHeader(greeting: context.tr('home.good_morning')),
                    SizedBox(height: 20.h),
                    const StatsSummaryCard(tasks: 12, docs: 5, pending: 7),
                    SizedBox(height: 24.h),
                    Text(
                      context.tr('home.today_tasks'),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1D1E33),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TaskSection(tasks: _tasks, crossAxisCount: crossAxisCount),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF5B5FEF),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const AddTaskScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'Task'),
        ],
      ),
    );
  }
}
