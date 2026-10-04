// lib/features/add_task/add_task_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/add_task/widgets/add_task_header.dart';
import 'package:todo_app/features/add_task/widgets/color_selector.dart';
import 'package:todo_app/features/add_task/widgets/labeled_field.dart';
import 'package:todo_app/features/add_task/widgets/status_dropdown.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';
import 'package:todo_app/features/shared_widgets/app_text_field.dart';
import 'package:todo_app/features/shared_widgets/primary_button.dart';
import 'package:todo_app/features/shared_widgets/responsive.dart';
import 'package:todo_app/features/shared_widgets/task_item.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  static const _colorOptions = [
    Color(0xFF4E7DF0),
    Color(0xFFF2A93B),
    Color(0xFF9B6BE0),
    Color(0xFFE85C5C),
    Color(0xFF3DBE7A),
  ];

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  TaskStatus _status = TaskStatus.pending;
  Color _selectedColor = _colorOptions.first;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveTask() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.tr('add_task.title_required'))),
      );
      return;
    }

    await Hive.box<TaskItem>(AppConstants.taskBox).add(
      TaskItem(
        title: title,
        subtitle: _descriptionController.text.trim(),
        status: _status,
        color: _selectedColor,
      ),
    );

    if (!mounted) return;
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = Responsive.isWide(constraints.maxWidth);
            final contentMaxWidth = Responsive.contentMaxWidth(
              constraints.maxWidth,
            );
            final descriptionHeight = isWide ? 200.0 : 130.h;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: contentMaxWidth),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    children: [
                      AddTaskHeader(
                        title: context.tr('add_task.title'),
                        onBack: () => Navigator.of(context).maybePop(),
                      ),
                      SizedBox(height: 20.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabeledField(
                                label: context.tr('add_task.task_title'),
                                child: AppTextField(
                                  controller: _titleController,
                                  hintText: context.tr(
                                    'add_task.task_title_hint',
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              LabeledField(
                                label: context.tr('add_task.description'),
                                child: SizedBox(
                                  height: descriptionHeight,
                                  child: AppTextField(
                                    controller: _descriptionController,
                                    hintText: context.tr(
                                      'add_task.description_hint',
                                    ),
                                    expands: true,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              LabeledField(
                                label: context.tr('add_task.status'),
                                child: StatusDropdown(
                                  value: _status,
                                  onChanged: (status) {
                                    if (status != null) {
                                      setState(() => _status = status);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 16.h),
                              LabeledField(
                                label: context.tr('add_task.choose_color'),
                                child: ColorSelector(
                                  colors: _colorOptions,
                                  selectedColor: _selectedColor,
                                  onChanged: (color) =>
                                      setState(() => _selectedColor = color),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      PrimaryButton(
                        label: context.tr('add_task.save_task'),
                        onPressed: _saveTask,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
