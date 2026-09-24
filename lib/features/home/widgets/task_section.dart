// lib/features/home/widgets/task_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/home/widgets/task_card.dart';
import 'package:todo_app/features/shared_widgets/task_item.dart';

class TaskSection extends StatelessWidget {
  final List<TaskItem> tasks;
  final int crossAxisCount;

  const TaskSection({
    super.key,
    required this.tasks,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    if (crossAxisCount <= 1) {
      return Column(
        children: tasks
            .map(
              (task) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: TaskCard(task: task),
              ),
            )
            .toList(),
      );
    }

    return GridView.count(
      crossAxisCount: crossAxisCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12.h,
      crossAxisSpacing: 12.w,

      childAspectRatio: 1.0,
      children: tasks.map((task) => TaskCard(task: task)).toList(),
    );
  }
}
