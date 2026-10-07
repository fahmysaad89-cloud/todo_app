// lib/features/home/home_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/add_task/add_task_screen.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';
import 'package:todo_app/features/home/widgets/home_header.dart';
import 'package:todo_app/features/home/widgets/stats_summary_card.dart';
import 'package:todo_app/features/home/widgets/task_section.dart';
import 'package:todo_app/features/shared_widgets/Language_Button.dart';
import 'package:todo_app/features/shared_widgets/responsive.dart';
import 'package:todo_app/features/shared_widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                child: ValueListenableBuilder<Box<TaskItem>>(
                  valueListenable: Hive.box<TaskItem>(
                    AppConstants.taskBox,
                  ).listenable(),
                  builder: (context, box, _) {
                    // newest first
                    final tasks = box.values.toList().reversed.toList();
                    final pending = tasks
                        .where((t) => t.status != TaskStatus.done)
                        .length;

                    final topSection = <Widget>[
                      const Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: LanguageToggleButton(),
                      ),
                      SizedBox(height: 12.h),
                      HomeHeader(greeting: context.tr('home.good_morning')),
                      SizedBox(height: 20.h),
                      StatsSummaryCard(
                        tasks: tasks.length,
                        docs: 0,
                        pending: pending,
                      ),
                    ];

                    if (tasks.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                        child: Column(
                          children: [
                            ...topSection,
                            Expanded(
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Lottie.asset(
                                        'assets/icons/Empty.json',
                                        width: 260.w,
                                        height: 260.w,
                                        repeat: true,
                                        errorBuilder: (_, _, _) => Icon(
                                          Icons.inbox_outlined,
                                          size: 80.sp,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Text(
                                        context.tr('home.no_tasks'),
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      children: [
                        ...topSection,
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
                        TaskSection(
                          tasks: tasks,
                          crossAxisCount: crossAxisCount,
                        ),
                      ],
                    );
                  },
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.tr('nav.home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_task),
            label: context.tr('nav.task'),
          ),
        ],
      ),
    );
  }
}
