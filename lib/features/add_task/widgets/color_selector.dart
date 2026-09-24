import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelector extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onChanged;

  const ColorSelector({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colors.map((color) {
        final isSelected = color.toARGB32() == selectedColor.toARGB32();
        return Expanded(
          child: Center(
            child: GestureDetector(
              onTap: () => onChanged(color),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: isSelected ? 45.w : 35.w,
                height: isSelected ? 45.w : 35.w,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.black26, width: 2.5)
                      : null,
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.white, size: 18.sp)
                    : null,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
