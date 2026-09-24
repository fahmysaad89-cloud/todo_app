import 'package:flutter/material.dart';

enum TaskStatus { pending, inProgress, done }

extension TaskStatusX on TaskStatus {
  String get translationKey {
    switch (this) {
      case TaskStatus.pending:
        return 'status.pending';
      case TaskStatus.inProgress:
        return 'status.in_progress';
      case TaskStatus.done:
        return 'status.done';
    }
  }

  Color get color {
    switch (this) {
      case TaskStatus.pending:
        return const Color(0xFF9B6BE0);
      case TaskStatus.inProgress:
        return const Color(0xFFF2A93B);
      case TaskStatus.done:
        return const Color(0xFF3DBE7A);
    }
  }
}
