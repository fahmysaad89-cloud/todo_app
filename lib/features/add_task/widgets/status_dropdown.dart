// lib/features/add_task/widgets/status_dropdown.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';

class StatusDropdown extends StatelessWidget {
  final TaskStatus value;
  final ValueChanged<TaskStatus?> onChanged;

  const StatusDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<TaskStatus>(
          initialValue: value,
          isExpanded: true,
          decoration: const InputDecoration(border: InputBorder.none),
          icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
          items: TaskStatus.values
              .map(
                (status) => DropdownMenuItem(
                  value: status,
                  child: Text(
                    context.tr(status.translationKey),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
