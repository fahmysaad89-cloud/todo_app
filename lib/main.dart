import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/core/utils/app_constants.dart';
import 'package:todo_app/features/profile/data/user_model.dart';
import 'package:todo_app/features/shared_widgets/task_item.dart';
import 'package:todo_app/todo_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskItemAdapter());

  await Hive.openBox<UserModel>(AppConstants.userBox);
  await Hive.openBox<TaskItem>(AppConstants.taskBox);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const TodoApp(),
    ),
  );
}
