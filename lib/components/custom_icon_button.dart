import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size; // 组件的长宽
  final double? borderRadius; // 圆角半径
  final Color? borderColor; // 边框颜色
  final Color? iconColor; // 图标颜色
  final VoidCallback? onPressed; // 点击事件

  const CustomIconButton({
    super.key,
    required this.icon,
    this.size = 40.0, // 默认值
    this.borderRadius = 20.0, // 默认值 (size的一半)
    this.borderColor,
    this.iconColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBorderColor = borderColor ?? theme.dividerColor;
    final effectiveIconColor = iconColor ?? theme.colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(color: effectiveBorderColor, width: 0.4),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius!),
          onTap: onPressed,
          child: Center(
            child: Icon(icon, color: effectiveIconColor, size: (size! * 0.6)),
          ),
        ),
      ),
    );
  }
}
