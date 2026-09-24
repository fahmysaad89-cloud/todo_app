// lib/features/profile/profile_screen.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/add_task/widgets/labeled_field.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/profile/widgets/avatar_picker.dart';
import 'package:todo_app/features/shared_widgets/Language_Button.dart';
import 'package:todo_app/features/shared_widgets/app_text_field.dart';
import 'package:todo_app/features/shared_widgets/primary_button.dart';
import 'package:todo_app/features/shared_widgets/responsive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _nameController = TextEditingController();
  static const _primary = Color(0xFF5B5FEF);

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = Responsive.isWide(constraints.maxWidth);
            final avatarRadius = isWide ? 65.0 : 55.r;
            final horizontalPadding = isWide
                ? constraints.maxWidth * 0.15
                : 24.w;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: Responsive.contentMaxWidth(constraints.maxWidth),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: 24.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: isWide ? 16.h : 24.h),
                      const Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: LanguageToggleButton(),
                      ),
                      SizedBox(height: isWide ? 24.h : 66.h),
                      AvatarPicker(radius: avatarRadius, color: _primary),
                      SizedBox(height: 28.h),
                      Text(
                        context.tr('profile.title'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D1E33),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        context.tr('profile.subtitle'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 36.h),
                      LabeledField(
                        label: context.tr('profile.full_name'),
                        child: AppTextField(
                          controller: _nameController,
                          hintText: context.tr('profile.full_name_hint'),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      PrimaryButton(
                        label: context.tr('profile.continue'),
                        color: _primary,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
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
