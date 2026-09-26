import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/features/shared_widgets/primary_button.dart';

class AvatarPicker extends StatefulWidget {
  final double radius;
  final Color color;
  final VoidCallback? onTap;

  const AvatarPicker({
    super.key,
    required this.radius,
    this.color = const Color(0xFF5B5FEF),
    this.onTap,
  });

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  final picker = ImagePicker();
  XFile? photo;

  Future<void> pickImageFromCamera() async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() => photo = picked);
    }
  }

  Future<void> pickImageFromGallery() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => photo = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (sheetContext) => Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryButton(
                    label: 'camera',
                    onPressed: () async {
                      Navigator.pop(sheetContext);
                      await pickImageFromCamera();
                    },
                  ),
                  20.verticalSpace,
                  PrimaryButton(
                    label: 'gallery',
                    onPressed: () async {
                      Navigator.pop(sheetContext);
                      await pickImageFromGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        child: CircleAvatar(
          radius: widget.radius,
          backgroundColor: Colors.white,
          backgroundImage: photo != null ? FileImage(File(photo!.path)) : null,
          child: photo == null
              ? Icon(Icons.person, size: widget.radius, color: widget.color)
              : null,
        ),
      ),
    );
  }
}
