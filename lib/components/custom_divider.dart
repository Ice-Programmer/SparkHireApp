import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final Color? color;
  final double thickness;
  final double horizontalGap;
  final double? height;

  const CustomDivider({
    super.key,
    this.text,
    this.color,
    this.thickness = 1.0,
    this.horizontalGap = 0.0,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = color ?? Theme.of(context).dividerColor;

    Widget buildLine() => Expanded(
      child: Divider(
        height: height,
        thickness: thickness,
        color: textColor.withValues(alpha: 0.4),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalGap),
      child: Row(
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
      ),
    );
  }
}
