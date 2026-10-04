// lib/features/shared_widgets/task_item.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/features/add_task/widgets/task_status.dart';

class TaskItem extends HiveObject {
  String title;
  String subtitle;
  int statusIndex;
  int colorValue;

  TaskItem({
    required this.title,
    required this.subtitle,
    required TaskStatus status,
    required Color color,
  }) : statusIndex = status.index,
       colorValue = color.toARGB32();

  TaskStatus get status => TaskStatus.values[statusIndex];
  Color get color => Color(colorValue);
}

class TaskItemAdapter extends TypeAdapter<TaskItem> {
  @override
  final int typeId = 1;

  @override
  TaskItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskItem(
      title: fields[0] as String,
      subtitle: fields[1] as String,
      status: TaskStatus.values[fields[2] as int],
      color: Color(fields[3] as int),
    );
  }

  @override
  void write(BinaryWriter writer, TaskItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(2)
      ..write(obj.statusIndex)
      ..writeByte(3)
      ..write(obj.colorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskItemAdapter && runtimeType == other.runtimeType;
}
