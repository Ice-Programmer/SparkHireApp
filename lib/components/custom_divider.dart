import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? text;
  final Color? color;
  const CustomDivider({super.key, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final Color textColor = color ?? Theme.of(context).dividerColor;
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: textColor.withValues(alpha: 0.4))),
        if (text != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(text ?? "", style: TextStyle(color: textColor)),
          ),
        Expanded(child: Divider(color: textColor.withValues(alpha: 0.4))),
      ],
    );
  }
}
