import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final Color? color;
  // 1. 添加可选参数 thickness
  final double thickness;

  const CustomDivider({super.key, this.text, this.color, this.thickness = 1.0});

  @override
  Widget build(BuildContext context) {
    final Color textColor = color ?? Theme.of(context).dividerColor;

    Widget buildLine() => Expanded(
      child: Divider(
        color: textColor.withValues(alpha: 0.4),
        thickness: thickness,
      ),
    );

    return Row(
      children: <Widget>[
        buildLine(),
        if (text != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              text!,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        buildLine(),
      ],
    );
  }
}
