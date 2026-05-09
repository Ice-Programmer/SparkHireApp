import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final double? iconGap;
  final Color? backgroundColor;
  final Color textColor;
  final double btnWidth;
  final double btnHeight;
  final double fontSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool isShadow;
  final FontWeight fontWeight;
  final bool disable;
  final Color? borderColor;
  final bool disableSplash;
  
  /// 新增：控制图标在左边还是右边。默认 false (图标在左)
  final bool isIconRight;

  const CustomButton({
    super.key,
    this.title,
    this.icon,
    this.iconGap,
    this.backgroundColor,
    this.onPressed,
    required this.textColor,
    required this.btnWidth,
    required this.btnHeight,
    required this.fontSize,
    this.borderRadius = 10,
    this.isShadow = true,
    this.fontWeight = FontWeight.bold,
    this.disable = false,
    this.borderColor,
    this.disableSplash = false,
    this.isIconRight = false, // 默认图标在左侧
  });

  @override
  Widget build(BuildContext context) {
    // 提取共用的 Text Widget
    final textWidget = title != null
        ? Text(
            title!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          )
        : null;

    // 提取共用的 Icon Widget
    final iconWidget = icon != null
        ? Icon(icon, color: textColor, size: fontSize)
        : null;

    return SizedBox(
      height: btnHeight,
      width: btnWidth,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: disable
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.4)
              : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          boxShadow: (isShadow && backgroundColor != null)
              ? [
                  BoxShadow(
                    color: backgroundColor!.withValues(alpha: 0.3),
                    spreadRadius: 2.r,
                    blurRadius: 5.r,
                    offset: Offset(0, 3.h),
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: disable ? null : onPressed,
            splashColor: disableSplash ? Colors.transparent : null,
            highlightColor: disableSplash ? Colors.transparent : null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 根据 isIconRight 决定排列顺序
                    if (isIconRight) ...[
                      if (textWidget != null) textWidget,
                      if (iconWidget != null && textWidget != null && iconGap != null)
                        iconGap!.horizontalSpace,
                      if (iconWidget != null) iconWidget,
                    ] else ...[
                      if (iconWidget != null) iconWidget,
                      if (iconWidget != null && textWidget != null && iconGap != null)
                        iconGap!.horizontalSpace,
                      if (textWidget != null) textWidget,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}