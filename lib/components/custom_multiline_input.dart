import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMultilineInput extends StatelessWidget {
  final double? width;
  final double? height;

  final String? hintText;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;
  final double borderRadius;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final String? title;
  final double fontSize;

  const CustomMultilineInput({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.initialValue,
    this.maxLines = 100,
    this.maxLength,
    this.borderRadius = 12,
    this.backgroundColor,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.fontSize = 16,
  });

  Widget _buildTitle(BuildContext context) {
    if (title == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title!,
            style: TextStyle(
              fontSize: fontSize,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: enabled ? 0.7 : 0.2),
            ),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color:
                backgroundColor ?? Theme.of(context).colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextFormField(
            enabled: enabled,
            initialValue: initialValue,
            maxLines: maxLines,
            maxLength: maxLength,
            keyboardType: TextInputType.multiline,
            textAlignVertical: TextAlignVertical.top,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              counterText: '', // 👈 隐藏默认计数器
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
