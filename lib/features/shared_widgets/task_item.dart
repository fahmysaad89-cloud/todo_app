// lib/features/home/models/task_item.dart
import 'package:flutter/material.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';

class TaskItem {
  final String title;
  final String subtitle;
  final TaskStatus status;

  final Color color;

  const TaskItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.color,
  });
}
