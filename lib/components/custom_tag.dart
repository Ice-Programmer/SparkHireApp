import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  final Color? color; // 改为可选
  final double fontSize;
  final String text;
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  const CustomTag({
    super.key,
    this.color, // 现在可以不传
    required this.fontSize,
    required this.text,
    this.borderRadius = 4,
    this.horizontalPadding = 6,
    this.verticalPadding = 2,
  });

  Color _getDynamicColor(String text) {
    if (text.isEmpty) return Colors.grey;

    final int charCode = text[0].toUpperCase().codeUnitAt(0);

    const List<Color> palette = [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.tealAccent,
      Colors.pinkAccent,
      Colors.indigoAccent,
      Colors.deepOrangeAccent,
      Colors.cyan,
    ];

    return palette[charCode % palette.length];
  }

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = color ?? _getDynamicColor(text);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        // 使用 effectiveColor 生成浅色背景
        color: effectiveColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: effectiveColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
